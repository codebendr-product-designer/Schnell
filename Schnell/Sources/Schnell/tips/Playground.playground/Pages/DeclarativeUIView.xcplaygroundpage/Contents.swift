import Foundation
import UIKit
import PlaygroundSupport 

@resultBuilder struct StackBuilder {
    static func buildBlock(_ views: UIView...) -> [UIView] {
        views
    }
}

final class VStack: UIStackView {
    
    init(@StackBuilder views: () -> [UIView]) {
        super.init(frame: .zero)
        axis = .vertical
        translatesAutoresizingMaskIntoConstraints = false
        views().forEach { addArrangedSubview($0) }
        
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}

protocol StackModifier {
    associatedtype Stack: UIStackView
    
    func setAlignment(_ alignment: UIStackView.Alignment) -> Stack
    func setDistribution(_ distribution: UIStackView.Distribution) -> Stack
    func setSpacing(_ spacing: CGFloat) -> Stack
}

extension VStack: StackModifier {
    func setAlignment(_ alignment: UIStackView.Alignment) -> VStack {
        self.alignment = alignment
        return self
    }
    
    func setDistribution(_ distribution: UIStackView.Distribution) -> VStack {
        self.distribution = distribution
        return self
    }
    
    func setSpacing(_ spacing: CGFloat) -> VStack {
        self.spacing = spacing
        return self
    }
}

final class HStack: UIStackView {
    
    init(@StackBuilder views: () -> [UIView]) {
        super.init(frame: .zero)
        axis = .horizontal
        translatesAutoresizingMaskIntoConstraints = false
        views().forEach { addArrangedSubview($0) }
        
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension HStack: StackModifier {
    func setAlignment(_ alignment: UIStackView.Alignment) -> HStack {
        self.alignment = alignment
        return self
    }
    
    func setDistribution(_ distribution: UIStackView.Distribution) -> HStack {
        self.distribution = distribution
        return self
    }
    
    func setSpacing(_ spacing: CGFloat) -> HStack {
        self.spacing = spacing
        return self
    }
}

protocol DeclarativeView {
    associatedtype View: UIView
    
    func fillSuperview(offset: CGFloat) -> View
    func setWidth(_ width: CGFloat) -> View
    func setHeight(_ height: CGFloat) -> View
    func setCornerRadius(_ cornerRadius: CGFloat) -> View
    func setBackgroundColor(_ backgroundColor: UIColor) -> View
}

extension UIView: DeclarativeView {
    
    @discardableResult
    func fillSuperview(offset: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        
        guard let superview = superview else {
            return self
        }
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor, constant: offset),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: offset),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -offset),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: offset)
        ])
        
        return self
    }
    
    @discardableResult
    public func setWidth(_ width: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        return self
    }
    
    @discardableResult
    public func setHeight(_ height: CGFloat) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }
    
    @discardableResult
    public func setCornerRadius(_ cornerRadius: CGFloat) -> UIView {
        self.layer.cornerRadius = cornerRadius
        return self
    }
    
    @discardableResult
    public func setBackgroundColor(_ color: UIColor) -> UIView {
        self.backgroundColor = color
        return self
    }
}

class ViewController: UIViewController {
   
    var someView = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        someView.setTitle("some title", for: .normal)
        view.backgroundColor = .white
        
        let exampleStackView = VStack {
            someView
                .setBackgroundColor(.black)
            
            HStack {
                
                UIView()
                    .setWidth(50)
                    .setHeight(50)
                    .setBackgroundColor(.yellow)
                
                UIView()
                    .setWidth(50)
                    .setHeight(50)
                    .setBackgroundColor(.purple)
                
                UIView()
                    .setWidth(50)
                    .setHeight(50)
                    .setBackgroundColor(.lightGray)
            }
            .setDistribution(.fillEqually)
            
            UIView()
                .setBackgroundColor(.systemPink)
        }
        .setAlignment(.fill)
        .setDistribution(.fillEqually)
        .setSpacing(10)
        
        
        view.addSubview(exampleStackView)
        exampleStackView.fillSuperview(offset: 0)
    }
}

let viewController = ViewController()
viewController.view.frame = CGRect(x: 0, y: 0, width: 320, height: 568)
PlaygroundPage.current.liveView = viewController
