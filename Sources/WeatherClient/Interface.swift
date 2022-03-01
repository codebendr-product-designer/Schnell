import Foundation
import Combine
import CoreLocation

// a client for accessing weather data for locations
public struct WeatherClient {
    public var weather: () -> AnyPublisher<WeatherResponse, Error>
    public var searchLocations: (CLLocationCoordinate2D) -> AnyPublisher<[Location], Error>
    
    public init(weather: @escaping () -> AnyPublisher<WeatherResponse, Error>, searchLocations: @escaping (CLLocationCoordinate2D) -> AnyPublisher<[Location], Error>) {
        self.weather = weather
        self.searchLocations = searchLocations
    }
}

public struct WeatherResponse: Decodable, Equatable {
    public var consolidatedWeather: [ConsolidatedWeather]
    
    public struct ConsolidatedWeather: Decodable, Equatable {
        public private(set) var applicableDate: Date
        public private(set) var id: Int
        public private(set) var maxTemp: Double
        public private(set) var minTemp: Double
        public private(set) var theTemp: Double
        
        public init(applicableDate: Date, id: Int, maxTemp: Double, minTemp: Double, theTemp: Double) {
            self.applicableDate = applicableDate
            self.id = id
            self.maxTemp = maxTemp
            self.minTemp = minTemp
            self.theTemp = theTemp
        }
        
    }
}

public struct Location{}

