import Foundation
import Combine

protocol WeatherClientProtocol {
  func weather() -> AnyPublisher<WeatherResponse, Error>
}

private let jsonDecoder: JSONDecoder = {
  let jsonDecoder = JSONDecoder()
  let formatter = DateFormatter()
  formatter.dateFormat = "yyyy-MM-dd"
  jsonDecoder.dateDecodingStrategy = .formatted(formatter)
  jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
  return jsonDecoder
}()

struct WeatherClient: WeatherClientProtocol {
  func weather() -> AnyPublisher<WeatherResponse, Error> {
    URLSession.shared
      .dataTaskPublisher(for: URL(string: "https://www.metaweather.com/api/location/2459115")!)
      .map { data, _ in data }
      .decode(type: WeatherResponse.self, decoder: jsonDecoder)
      .eraseToAnyPublisher()
  }
}

struct WeatherResponse: Decodable, Equatable {
  var consolidatedWeather: [ConsolidatedWeather]

  struct ConsolidatedWeather: Decodable, Equatable {
    var applicableDate: Date
    var id: Int
    var maxTemp: Double
    var minTemp: Double
    var theTemp: Double
  }
}

struct MockWeatherClient: WeatherClientProtocol {
  func weather() -> AnyPublisher<WeatherResponse, Error> {
    Just(
      WeatherResponse(consolidatedWeather: [
        .init(applicableDate: Date(), id: 1, maxTemp: 30, minTemp: 10, theTemp: 20),
        .init(applicableDate: Date().addingTimeInterval(86400), id: 2, maxTemp: -10, minTemp: -30, theTemp: -20)
      ])
    )
    .setFailureType(to: Error.self)
//#warning("a delay to emulate a network call")
    .delay(for: 2, scheduler: DispatchQueue.main)
    .eraseToAnyPublisher()
      
      #warning("fast way to return a failure for testing")
//      Fail(error: NSError(domain: "", code: 1))
//        .eraseToAnyPublisher()
  }
}


