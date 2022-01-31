import CoreImage
import Foundation
import UIKit

public typealias Filter = (CIImage) -> CIImage
public struct ImageFilter {
    public static func blur(radius: Double) -> Filter {
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

    public static func generate(color: UIColor) -> Filter {
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

    public static func compositeSourceOver(overlay: CIImage) -> Filter {
        return { image in
            let parameters = [
                kCIInputBackgroundImageKey: image,
                kCIInputImageKey: overlay
            ]
            guard let filter = CIFilter(name: "CISourceOverCompositing", parameters: parameters)

            else { fatalError() }
            guard let outputImage = filter.outputImage
            else { fatalError() }
            return outputImage.cropped(to: image.extent)
        }
    }

    public static func overlay(color: UIColor) -> Filter {
        return { image in
            let overlay = ImageFilter.generate(color: color)(image).cropped(to: image.extent)
            return ImageFilter.compositeSourceOver(overlay: overlay)(image)
        }
    }

    public static func compose(filter filter1: @escaping Filter,
                 with filter2: @escaping Filter) -> Filter
    {
        return { image in filter2(filter1(image)) }
    }
}
