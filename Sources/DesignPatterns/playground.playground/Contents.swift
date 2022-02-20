//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport
import DesignPatterns

class ViewController : UIViewController {
    
    var bankViewModel: BankViewModel = BankViewModel(with: Bank(paymentType: "", balance: 10))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor  = .purple
        let bankView = BankView(
            with: bankViewModel
        )
        view.addSubview(bankView)
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = ViewController()
