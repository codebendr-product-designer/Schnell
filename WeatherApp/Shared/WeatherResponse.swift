import Foundation
import Combine
import CoreLocation

//protocol WeatherClientProtocol {
//    func weather() -> AnyPublisher<WeatherResponse, Error>
//}

//struct MockWeatherClient: WeatherClientProtocol {
//    func weather() -> AnyPublisher<WeatherResponse, Error> {
//        Just(
//            WeatherResponse(
//                consolidatedWeather: [
//                    .init(applicableDate: Date(), id: 1, maxTemp: 30, minTemp: 10, theTemp: 20),
//                    .init(applicableDate: Date().addingTimeInterval(86400), id: 2, maxTemp: -10, minTemp: -30, theTemp: -20)
//                ]
//            )
//        )
//            .setFailureType(to: Error.self)
//            .delay(for: 2, scheduler: DispatchQueue.main)
//            .eraseToAnyPublisher()
//    }
//
//
//}
//struct WeatherClient: WeatherClientProtocol {
//    func weather() -> AnyPublisher<WeatherResponse, Error> {
//        URLSession.shared
//            .dataTaskPublisher(for: URL(string: "https://www.metaweather.com/api/location/2459115")!)
//            .map { data, _ in data }
//            .decode(type: WeatherResponse.self, decoder: jsonDecoder)
//            .eraseToAnyPublisher()
//    }
//}
//

private let weatherJsonDecoder: JSONDecoder = {
    let jsonDecoder = JSONDecoder()
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    jsonDecoder.dateDecodingStrategy = .formatted(formatter)
    jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
    return jsonDecoder
}()


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


struct WeatherClient {
  var weather: () -> AnyPublisher<WeatherResponse, Error>
  var searchLocations: (CLLocationCoordinate2D) -> AnyPublisher<[Location], Error>
}

extension WeatherClient {
  static let live = Self(
    weather: {
      URLSession.shared
        .dataTaskPublisher(for: URL(string: "https://www.metaweather.com/api/location/2459115")!)
        .map { data, _ in data }
        .decode(type: WeatherResponse.self, decoder: weatherJsonDecoder)
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    },
    searchLocations: { coordinate in
      fatalError()
    }
  )
}

extension WeatherClient {
  static let empty = Self(
    weather: {
      Just(WeatherResponse(consolidatedWeather: []))
        .setFailureType(to: Error.self)
        .eraseToAnyPublisher()
    }, searchLocations: { _ in
      Just([])
        .setFailureType(to: Error.self)
        .eraseToAnyPublisher()
    })

  static let happyPath = Self(
    weather: {
      Just(
        WeatherResponse(
          consolidatedWeather: [
            .init(applicableDate: Date(), id: 1, maxTemp: 30, minTemp: 10, theTemp: 20),
            .init(applicableDate: Date().addingTimeInterval(86400), id: 2, maxTemp: -10, minTemp: -30, theTemp: -20)
          ]
        )
      )
      .setFailureType(to: Error.self)
      .eraseToAnyPublisher()
    }, searchLocations: { _ in
      Just([])
        .setFailureType(to: Error.self)
        .eraseToAnyPublisher()
    })

  static let failed = Self(
    weather: {
        Fail<WeatherResponse, NSError>(error: NSError(domain: "", code: 1))
        .eraseToAnyPublisher()
    }, searchLocations: { _ in
      Just([])
        .setFailureType(to: Error.self)
        .eraseToAnyPublisher()
    })
}
