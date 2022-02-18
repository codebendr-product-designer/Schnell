import Foundation
import Combine

private let weatherJsonDecoder: JSONDecoder = {
  let jsonDecoder = JSONDecoder()
  let formatter = DateFormatter()
  formatter.dateFormat = "yyyy-MM-dd"
  jsonDecoder.dateDecodingStrategy = .formatted(formatter)
  jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
  return jsonDecoder
}()

class AppViewModel: ObservableObject {
    @Published var isConnected: Bool
    @Published var weatherResults = [WeatherResponse.ConsolidatedWeather]()
    private var weatherRequestCancellable: AnyCancellable?
    
    let dayOfWeekFormatter: DateFormatter = {
      let formatter = DateFormatter()
      formatter.dateFormat = "EEEE"
      return formatter
    }()
    
    init(isConnected: Bool = true) {
        self.isConnected = isConnected
        
        self.weatherRequestCancellable = URLSession.shared
          .dataTaskPublisher(for: URL(string: "https://www.metaweather.com/api/location/2459115")!)
          .map { data, _ in data }
          .decode(type: WeatherResponse.self, decoder: weatherJsonDecoder)
          .receive(on: DispatchQueue.main)
          .sink(
            receiveCompletion: { _ in },
            receiveValue: { [weak self] in
              self?.weatherResults = $0.consolidatedWeather
            }
          )
        
    }
}
