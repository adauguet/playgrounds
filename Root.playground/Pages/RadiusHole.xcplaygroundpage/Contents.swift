import UIKit
import PlaygroundSupport

extension CGRect {
    init(center: CGPoint, size: CGSize) {
        self.size = size
        self.origin = CGPoint(x: center.x - size.width / 2, y: center.y - size.height / 2)
    }
}

let windowFrame = CGRect(x: 0, y: 0, width: 320, height: 568)
let contentView = UIView(frame: windowFrame)
contentView.backgroundColor = .white

let frame = CGRect(x: 0.0, y: 0.0, width: 320, height: 568)
let view = UIView(frame: frame)
view.backgroundColor = .black

let mask = UIView(frame: view.bounds)
mask.clipsToBounds = true
mask.backgroundColor = .clear

let outerRect = UIBezierPath(roundedRect: view.bounds, cornerRadius: 0)
let circle = UIBezierPath(roundedRect: CGRect(center: view.center, size: CGSize(width: 100.0, height: 100.0)), cornerRadius: 50)
outerRect.append(circle)
outerRect.usesEvenOddFillRule = true

let layer = CAShapeLayer()
layer.fillRule = kCAFillRuleEvenOdd
layer.fillColor = UIColor.green.cgColor
layer.path = outerRect.cgPath

mask.layer.addSublayer(layer)

view.mask = mask

contentView.addSubview(view)

PlaygroundPage.current.liveView = contentView

UIView.animate(withDuration: 0.8) {
    let scaleTransform = CGAffineTransform(scaleX: 10.0, y: 10.0)
    view.mask?.transform = scaleTransform
}
