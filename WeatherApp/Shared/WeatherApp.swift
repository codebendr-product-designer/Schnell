import SwiftUI
import WeatherClientLive
import WeatherFeature
import PathMonitorLive
import LocationClientLive

@main
struct WeatherApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: .init(
                locationClient: .live,
                pathMonitorClient: .live(),
                weatherClient: .live)
            )
        }
    }
}
