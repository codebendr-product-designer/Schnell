import Foundation
import HTML

public struct Koch {
    public private(set) var text = "Hello, World!"

    public init() {
    }
}



struct MySite: Rule {
    var body: some Rule {
        Write(contents: html {
            HTML.body {
                h1 { "Hello, World!" }
            }
        }, to: "index.html")
    }
}

MySite().execute()

