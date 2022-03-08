import Foundation
import Combine
import CoreLocation

// a client for accessing weather data for locations
public struct WeatherClient {
    public var weather: (Int) -> AnyPublisher<WeatherResponse, Error>
    public var searchLocations: (CLLocationCoordinate2D) -> AnyPublisher<[Location], Error>
    
    public init(weather: @escaping (Int) -> AnyPublisher<WeatherResponse, Error>, searchLocations: @escaping (CLLocationCoordinate2D) -> AnyPublisher<[Location], Error>) {
        self.weather = weather
        self.searchLocations = searchLocations
    }
}

public struct WeatherResponse: Decodable, Equatable {
    public var consolidatedWeather: [ConsolidatedWeather]
    
    public init(consolidatedWeather: [WeatherResponse.ConsolidatedWeather]) {
        self.consolidatedWeather = consolidatedWeather
    }

    
    public struct ConsolidatedWeather: Decodable, Equatable {
        public var applicableDate: Date
        public var id: Int
        public var maxTemp: Double
        public var minTemp: Double
        public var theTemp: Double
        
        public init(applicableDate: Date, id: Int, maxTemp: Double, minTemp: Double, theTemp: Double) {
            self.applicableDate = applicableDate
            self.id = id
            self.maxTemp = maxTemp
            self.minTemp = minTemp
            self.theTemp = theTemp
        }
        
    }
}

public struct Location: Decodable, Equatable {
    public init(title: String, woeid: Int) {
        self.title = title
        self.woeid = woeid
    }
    
    public var title: String
    public var woeid: Int
}

