import Foundation
import UIKit
import PlaygroundSupport

let frame = CGRect(x: 0.0, y: 0.0, width: 500.0, height: 300.0)
let radius: CGFloat = 75.0

let view = UIView(frame: frame)

PlaygroundPage.current.liveView = view

let image = UIImage(named: "landscape.jpg")
let imageView = UIImageView(image: image)
imageView.frame = frame
imageView.contentMode = .scaleAspectFill

let blur = UIBlurEffect(style: .light)
let blurView = UIVisualEffectView(effect: blur)
blurView.frame = frame

let mask = UIView(frame: blurView.bounds)
mask.clipsToBounds = true
mask.backgroundColor = .clear

let outerRect = UIBezierPath(roundedRect: blurView.bounds, cornerRadius: 0.0)
let circle = UIBezierPath(roundedRect: CGRect(x: 100.0, y: 100.0, width: 2 * radius, height: 2 * radius), cornerRadius: radius)
outerRect.append(circle)
outerRect.usesEvenOddFillRule = true

let layer = CAShapeLayer()
layer.fillRule = kCAFillRuleEvenOdd
layer.fillColor = UIColor.green.cgColor
layer.path = outerRect.cgPath

mask.layer.addSublayer(layer)

blurView.mask = mask

view.addSubview(imageView)
view.addSubview(blurView)