import PlaygroundSupport
import Combine
import ReactiveSwift
import UIKit

extension UIButton {
    var text: String? {
        get {
            title(for: .normal)
        }
        set {
            setTitle("Number \(String(describing: newValue))", for: .normal)
        }
    }
}

class MyViewController: UIViewController {
    let viewModel = ViewModel()
    let button = UIButton()
    var cancellables: Set<AnyCancellable> = []
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        button.frame = CGRect(x: 100, y: 200, width: 200, height: 44)
        button.setTitle("Number -", for: .normal)
        button.configuration = .filled()
        button.addAction(.init(handler: { _ in
            self.viewModel.next()
        }), for: .touchUpInside)
        
        view.addSubview(button)
        self.view = view
    }
    
    override func viewDidLoad() {
        viewModel
            .$contents
            .assign(to: \.text, on: button)
            .store(in: &cancellables)
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
