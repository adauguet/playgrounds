import Foundation
import UIKit

public extension UIImageView {
    convenience init(frame: CGRect, image: UIImage?) {
        self.init(frame: frame)
        self.image = image
    }
}
