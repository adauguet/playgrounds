import CoreGraphics

public extension CGRect {
    init(center: CGPoint, size: CGSize) {
        self.size = size
        self.origin = CGPoint(x: center.x - size.width / 2, y: center.y - size.height / 2)
    }
}
