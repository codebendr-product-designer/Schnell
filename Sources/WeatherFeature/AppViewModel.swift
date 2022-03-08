import Foundation
import Combine
import WeatherClient
import PathMonitor
import CoreLocation
import LocationClient

public class AppViewModel: ObservableObject {
  @Published public var currentLocation: Location?
  @Published public var isConnected = true
  @Published public var weatherResults: [WeatherResponse.ConsolidatedWeather] = []

  var weatherRequestCancellable: AnyCancellable?
  var pathUpdateCancellable: AnyCancellable?
  var searchLocationsCancellable: AnyCancellable?
  var locationDelegateCancellable: AnyCancellable?

  let weatherClient: WeatherClient
  let pathMonitorClient: PathMonitor
  let locationClient: LocationClient

  public init(
//    isConnected: Bool = true,
    locationClient: LocationClient,
    pathMonitorClient: PathMonitor,
    weatherClient: WeatherClient
  ) {
    self.weatherClient = weatherClient
    self.locationClient = locationClient
    self.pathMonitorClient = pathMonitorClient

//    self.pathMonitorClient.setPathUpdateHandler { [weak self] path in
      self.pathUpdateCancellable = self.pathMonitorClient.publisher
      .map { $0.status == .satisfied }
      .removeDuplicates()
      .sink(receiveValue: { [weak self] isConnected in
        guard let self = self else { return }
        self.isConnected = isConnected
        if self.isConnected {
          self.refreshWeather()
        } else {
          self.weatherResults = []
        }
      })

    //delegate
    self.locationDelegateCancellable = self.locationClient.delegate
      .sink { event in
        switch event {
        case let .didChangeAuthorization(status):
          switch status {
          case .notDetermined:
            break

          case .restricted:
            // TODO: show an alert
            break
          case .denied:
            // TODO: show an alert
            break

          case .authorizedAlways, .authorizedWhenInUse:
            self.locationClient.requestLocation()

          @unknown default:
            break
          }

        case let .didUpdateLocations(locations):
          guard let location = locations.first else { return }

          self.searchLocationsCancellable =  self.weatherClient
            .searchLocations(location.coordinate)
            .sink(
              receiveCompletion: { _ in },
              receiveValue: { [weak self] locations in
                self?.currentLocation = locations.first
                self?.refreshWeather()
              }
            )

        case .didFailWithError:
          break
        }
      }

    if self.locationClient.authorizationStatus() == .authorizedWhenInUse {
      self.locationClient.requestLocation()
    }
  }

//  deinit {
//    self.pathMonitorClient.cancel()
//  }
  
  func refreshWeather() {
    guard let location = self.currentLocation else { return }

    self.weatherResults = []
    
    self.weatherRequestCancellable = self.weatherClient
      .weather(location.woeid)
      .sink(
        receiveCompletion: { _ in },
        receiveValue: { [weak self] response in
          self?.weatherResults = response.consolidatedWeather
      })
  }

  public func locationButtonTapped() {
      
    switch self.locationClient.authorizationStatus() {
        
    case .notDetermined:
      self.locationClient.requestWhenInUseAuthorization()

    case .restricted:
      // TODO: show an alert
      break
    case .denied:
      // TODO: show an alert
      break

    case .authorizedAlways, .authorizedWhenInUse:
      self.locationClient.requestLocation()

    @unknown default:
        
      break
    }
  }
    
    public func cancelButtonTapped() {}
}

