import UIKit
import SwiftUI

//Goals
//1. Basic
//2. Intermediary
//3. Expect 

public struct Bank {
    public let paymentType: String
    public let balance: Float
    
    public init(paymentType: String, balance: Float) {
        self.paymentType = paymentType
        self.balance = balance
    }
}

public class BankViewModel {
    
    let bank: Bank
    var balance: String { "£\(bank.balance)" }
    
    public init(with bank: Bank) {
        self.bank = bank
    }
    
}

public class BankView: UIView {
    
    var bankViewModel: BankViewModel
    let bankLabel: UILabel
    
    public init(with viewModel: BankViewModel) {
        self.bankViewModel = viewModel
        self.bankLabel = UILabel(frame: .zero)
        bankLabel.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        bankLabel.text = "Helloo World"
        bankLabel.textColor = .black
  
        super.init(frame: .zero)
        addSubview(bankLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateUI() {
        bankLabel.text = bankViewModel.balance
    }
}
