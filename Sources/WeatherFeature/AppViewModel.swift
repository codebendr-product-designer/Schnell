import Foundation
import Combine
import WeatherClient
import PathMonitor
import CoreLocation

public class AppViewModel: NSObject, ObservableObject {
    @Published var isConnected = false
    @Published var weatherResults = [WeatherResponse.ConsolidatedWeather]()
    private var cancellables: Set<AnyCancellable> = []
    private let weatherClient: WeatherClient
    private let pathMonitorClient: PathMonitor
    private var currentLocation: Location?
    let locationManager = CLLocationManager()
    
    let dayOfWeekFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter
    }()
    
    public init(
        pathMonitorClient: PathMonitor,
        weatherClient: WeatherClient
    ){
        self.weatherClient = weatherClient
        self.pathMonitorClient = pathMonitorClient
        super.init()
        
        pathMonitorClient.publisher
            .map { $0.status == .satisfied }
            .removeDuplicates()
            .sink { [weak self] isConnected in
                guard let self = self else { return }
                self.isConnected = isConnected
                if self.isConnected {
                    self.refresh()
                } else {
                    self.weatherResults = []
                }
            }
            .store(in: &cancellables)
        
        locationManager.delegate = self
    }
    
    func refresh() {
        guard let currentLocation = currentLocation else {
            return
        }

        self.weatherResults = []
        self.weatherClient.weather(currentLocation.woeid)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { response in
                    DispatchQueue.main.async {
                        self.weatherResults = response.consolidatedWeather
                    }
                }
            )
            .store(in: &cancellables)
    }
    
    func locationButtonTapped() {

        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            // TODO show alert
            break
        case .denied:
            // TODO show alert
            break
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.requestLocation()
        @unknown default:
            break
        }
    }
    
   
}

extension AppViewModel: CLLocationManagerDelegate {
    
    public func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            break
        case .restricted:
            //TODO show an alert
            break
        case .denied:
            //TODO show an alert
            break
        case .authorizedAlways, .authorizedWhenInUse, .authorized:
            locationManager.requestLocation()
        @unknown default:
            break
        }
    }
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        weatherClient.searchLocations(location.coordinate)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { [weak self] location in
                    self?.currentLocation  = location.first
                    self?.refresh()
                }
            )
            .store(in: &cancellables)
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    
}
