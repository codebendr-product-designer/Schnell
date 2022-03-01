import Foundation
import Combine
import WeatherClient

public class AppViewModel: ObservableObject {
    @Published var isConnected: Bool
    @Published var weatherResults = [WeatherResponse.ConsolidatedWeather]()
    private var weatherRequestCancellable: AnyCancellable?
    
    let dayOfWeekFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter
    }()
    
    public init(
        isConnected: Bool = true,
        weatherClient: WeatherClient)
    {
        self.isConnected = isConnected
        
        self.weatherRequestCancellable = weatherClient.weather()
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { response in
                    DispatchQueue.main.async {
                        self.weatherResults = response.consolidatedWeather
                    }
                }
            )
    }
}
