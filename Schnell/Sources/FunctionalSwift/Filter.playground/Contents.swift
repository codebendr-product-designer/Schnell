import CoreImage
import PlaygroundSupport
import UIKit
import FunctionalSwift


    class ViewController: UIViewController {
        override func loadView() {
            
            let url = URL(string: "https://picsum.photos/500/500")!
            let ciimage = CIImage(contentsOf: url)!
            
            let radius = 5.0
            let color = UIColor.red.withAlphaComponent(0.2)
            let blurredImage = ImageFilter.blur(radius: radius)(ciimage)
           let overlaidImage = ImageFilter.overlay(color: color)(blurredImage)
            
            let view = UIView(frame: .init(x: 0, y: 0, width: 400, height: 400))
            view.backgroundColor = .white

            let image = UIImageView(frame: .init(x: 0, y: 0, width: 200, height: 200))
            image.contentMode = .scaleToFill
            image.image = .init(ciImage: overlaidImage)

            view.addSubview(image)
            
            
            
            self.view = view
        }
    }

PlaygroundPage.current.liveView = ViewController()
