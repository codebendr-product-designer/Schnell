import Foundation
import Combine
import WeatherClient
import PathMonitorClient


public class AppViewModel: ObservableObject {
    @Published var isConnected = false
    @Published var weatherResults = [WeatherResponse.ConsolidatedWeather]()
    private var cancellables: Set<AnyCancellable> = []
    private let weatherClient: WeatherClient
    private let pathMonitorClient: PathMonitorClient
    
    let dayOfWeekFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter
    }()
    
    public init(
        pathMonitorClient: PathMonitorClient,
        weatherClient: WeatherClient
    ){
        self.weatherClient = weatherClient
        self.pathMonitorClient = pathMonitorClient
        pathMonitorClient.setPathUpdateHandler { [weak self] path in
            guard let self = self else { return }
            self.isConnected = path.status == .satisfied
            if self.isConnected {
                self.refresh()
            } else {
                self.weatherResults = []
            }
        }
        pathMonitorClient.start(.main)
    }
    
    deinit {
        pathMonitorClient.cancel()
    }
    func refresh() {
        self.weatherResults = []
        self.weatherClient.weather()
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
}
