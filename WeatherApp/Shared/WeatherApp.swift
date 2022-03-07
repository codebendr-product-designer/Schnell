import SwiftUI
import WeatherClientLive
import WeatherFeature
import PathMonitorLive

@main
struct WeatherApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: .init(
                pathMonitorClient: .live(),
                weatherClient: .live))
        }
    }
}
