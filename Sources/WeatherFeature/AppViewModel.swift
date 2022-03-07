import Foundation
import Combine
import WeatherClient
import PathMonitor
import CoreLocation

public class AppViewModel: ObservableObject {
    @Published var isConnected = false
    @Published var weatherResults = [WeatherResponse.ConsolidatedWeather]()
    private var cancellables: Set<AnyCancellable> = []
    private let weatherClient: WeatherClient
    private let pathMonitorClient: PathMonitor
    
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
    }
    
    func refresh() {
        self.weatherResults = []
        self.weatherClient.weather(2459115)
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
        let locationManager = CLLocationManager()
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
