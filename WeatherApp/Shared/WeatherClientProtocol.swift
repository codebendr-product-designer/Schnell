import Combine
import Foundation

//protocol WeatherClientProtocol {
//    func weather() -> AnyPublisher<WeatherResponse, Error>
//}
//
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


