import Combine
import CoreLocation
import SwiftUI
import Network
import PathMonitor
import WeatherClient
import LocationClient

public struct ContentView: View {
  @ObservedObject var viewModel: AppViewModel

  public init(viewModel: AppViewModel) {
    self.viewModel = viewModel
  }

  public var body: some View {
    NavigationView {
      ZStack(alignment: .bottom) {
        ZStack(alignment: .bottomTrailing) {
          List {
            ForEach(self.viewModel.weatherResults, id: \.id) { weather in
              VStack(alignment: .leading) {
                Text(dayOfWeekFormatter.string(from: weather.applicableDate).capitalized)
                  .font(.title)

                Text("Current temp: \(weather.theTemp, specifier: "%.1f")°C")
                  .bold()
                Text("Max temp: \(weather.maxTemp, specifier: "%.1f")°C")
                Text("Min temp: \(weather.minTemp, specifier: "%.1f")°C")
              }
            }
          }

          Button(
            action: { self.viewModel.locationButtonTapped() }
          ) {
            Image(systemName: "location.fill")
              .foregroundColor(.white)
              .frame(width: 60, height: 60)
          }
          .background(Color.black)
          .clipShape(Circle())
          .padding()
        }

        if !self.viewModel.isConnected {
          HStack {
            Image(systemName: "exclamationmark.octagon.fill")

            Text("Not connected to internet")
          }
          .foregroundColor(.white)
          .padding()
          .background(Color.red)
        }
      }
      .navigationBarTitle(self.viewModel.currentLocation?.title ?? "Weather")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    return ContentView(
      viewModel: AppViewModel(
//        isConnected: false,
        locationClient: .notDetermined, // .notDeterminedDenied
        pathMonitorClient: .satisfied,
        weatherClient: .happyPath
      )
    )
  }
}

let dayOfWeekFormatter: DateFormatter = {
  let formatter = DateFormatter()
  formatter.dateFormat = "EEEE"
  return formatter
}()
