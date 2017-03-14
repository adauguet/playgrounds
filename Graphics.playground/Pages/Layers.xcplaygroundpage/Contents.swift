import Foundation
import UIKit
import PlaygroundSupport

let contentView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 500.0, height: 500.0))
contentView.backgroundColor = .white
PlaygroundPage.current.liveView = contentView

let center = CGPoint(x: contentView.frame.width / 2, y: contentView.frame.height / 2)
let size = CGSize(width: 400.0, height: 400.0)
let frame = CGRect(center: center, size: size)

let view = UIView(frame: frame)
//view.layer.backgroundColor = UIColor.black.cgColor

let layer = CAShapeLayer()

contentView.addSubview(view)

let path = CGMutablePath()

stride(from: 0, to: 2 * CGFloat.pi, by: CGFloat.pi / 24).forEach { float in
    
    let factor: CGFloat = 0.2
    
    var transform = CGAffineTransform(rotationAngle: float).concatenating(CGAffineTransform(scaleX: factor * float, y: factor * float)).concatenating(CGAffineTransform(translationX: 200.0, y: 200.0))
    
    let rect = CGRect(x: -20.0, y: 5.0, width: 40.0, height: 100.0)
    
    path.addPath(CGPath(ellipseIn: rect, transform: &transform))
}

layer.path = path
layer.strokeColor = UIColor.red.cgColor
layer.fillColor = UIColor.white.cgColor
layer.fillRule = kCAFillRuleEvenOdd

view.layer.addSublayer(layer)
