
struct Setting {
    var name: String
    var settings: [Setting] = []
}

extension Setting {
    enum Value {
        case bool(Bool)
        case int(Int)
        case string(String)
        case group([Setting])
    }
}

import SwiftUI

let stack = VStack {
    Text("Hello")
    Text("World")
    Button("I'm a button") {}
}

// Prints 'VStack<TupleView<(Text, Text, Button<Text>)>>'
print(type(of: stack))

@resultBuilder
struct SettingsBuilder {
    static func buildBlock() -> [Setting] { [] }
}

extension SettingsBuilder {
    static func buildBlock(_ settings: Setting...) -> [Setting] {
        settings
    }
}

func makeSettings(@SettingsBuilder _ content: () -> [Setting]) -> [Setting] {
    content()
}



struct SettingsGroup {
    var name: String
    @SettingsBuilder var settings: () -> [Setting]
}

//struct SettingsGroup {
//    var name: String
//    var settings: [Setting]
//
//    init(name: String,
//         @SettingsBuilder builder: () -> [Setting]) {
//        self.name = name
//        self.settings = builder()
//    }
//}

protocol SettingsConvertible {
    func asSettings() -> [Setting]
}

extension Setting: SettingsConvertible {
    func asSettings() -> [Setting] { [self] }
}

extension SettingsGroup: SettingsConvertible {
    func asSettings() -> [Setting] {
        [Setting(name: name, settings: settings())]
    }
}

extension SettingsBuilder {
    static func buildBlock(_ values: SettingsConvertible...) -> [Setting] {
        values.flatMap { $0.asSettings() }
    }
}

extension Array: SettingsConvertible where Element == Setting {
    func asSettings() -> [Setting] { self }
}

extension SettingsBuilder {
    static func buildIf(_ value: SettingsConvertible?) -> SettingsConvertible {
        value ?? []
    }
}

extension SettingsBuilder {
    static func buildEither(first: SettingsConvertible) -> SettingsConvertible {
        first
    }

    static func buildEither(second: SettingsConvertible) -> SettingsConvertible {
        second
    }
}

let shouldShowExperimental = true

enum UserAccessLevel {
    case restricted
    case normal
    case experimental
}

let accesssLevel: UserAccessLevel = .experimental

let settings = makeSettings {
    Setting(name: "Offline mode")
    Setting(name: "Search page size")

    Setting(name: "Experimental", settings: [
        Setting(name: "Default name"),
        Setting(name: "Fluid animations")
    ])
    SettingsGroup(name: "Experimental") {
        Setting(name: "Default name")
        Setting(name: "Fluid animations")
    }
    
    if shouldShowExperimental {
           SettingsGroup(name: "Experimental") {
               Setting(name: "Default name")
               Setting(name: "Fluid animations")
           }
       }  else {
            Setting(name: "Request experimental access")
        }
}

import UIKit
protocol Node: UIView {
    associatedtype Body: Node
    var body: Body { get }
}




