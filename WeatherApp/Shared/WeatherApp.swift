import SwiftUI
import WeatherClientLive
import WeatherFeature

@main
struct WeatherApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: .init(weatherClient: .live))
        }
    }
}
