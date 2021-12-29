import CoreImage
import Foundation
import UIKit

public struct ImageFilter {
    typealias Filter = (CIImage) -> CIImage

    static func blur(radius: Double) -> Filter {
        { image in
            let parameters: [String: Any] = [
                kCIInputRadiusKey: radius,
                kCIInputImageKey: image
            ]
            guard let filter = CIFilter(
                name: "CIGaussianBlur",
                parameters: parameters)
            else {
                fatalError()
            }
            guard let outputImage = filter.outputImage else {
                fatalError()
            }
            return outputImage
        }
    }

    static func generate(color: UIColor) -> Filter {
        { _ in
            let parameters = [kCIInputColorKey: CIColor(cgColor: color.cgColor)]
            guard let filter = CIFilter(name: "CIConstantColorGenerator",
                                        parameters: parameters)
            else { fatalError() }
            guard let outputImage = filter.outputImage
            else { fatalError() }
            return outputImage
        }
    }

    static func compositeSourceOver(overlay: CIImage) -> Filter {
        return { image in
            let parameters = [
                kCIInputBackgroundImageKey: image,
                kCIInputImageKey: overlay
            ]
            guard let filter = CIFilter(name: "CISourceOverCompositing",
                                        parameters: parameters)
            else { fatalError() }
            guard let outputImage = filter.outputImage
            else { fatalError() }
            return outputImage.cropped(to: image.extent)
        }
    }

    func overlay(color: UIColor) -> Filter {
        return { image in
            let overlay = generate(color: color)(image).cropped(to: image.extent)
            return compositeSourceOver(overlay: overlay)(image)
        }
    }
}
