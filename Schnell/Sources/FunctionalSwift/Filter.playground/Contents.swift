import CoreImage
import PlaygroundSupport
import UIKit




    class ViewController: UIViewController {
        override func loadView() {
            let view = UIView(frame: .init(x: 0, y: 0, width: 400, height: 400))
            view.backgroundColor = .white

            let image = UIImageView(frame: .init(x: 0, y: 0, width: 200, height: 200))
            image.contentMode = .scaleToFill
            image.image = .init(named: "tomato")

            view.addSubview(image)
            self.view = view
        }
    }

PlaygroundPage.current.liveView = ViewController()
