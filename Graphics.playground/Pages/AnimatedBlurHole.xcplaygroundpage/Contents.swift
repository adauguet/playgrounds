import Foundation
import UIKit
import PlaygroundSupport

let contentRect = CGRect(x: 0, y: 0, width: 400, height: 400)
let contentView = UIView(frame: contentRect)
contentView.backgroundColor = .white

PlaygroundPage.current.liveView = contentView

let image = UIImage(named: "landscape.jpg")
let imageView = UIImageView(frame: contentRect, image: image)
imageView.contentMode = .scaleAspectFill

let blur = UIBlurEffect(style: .light)
let blurView = UIVisualEffectView(effect: blur)
blurView.frame = contentRect

let path = UIBezierPath(rect: contentRect)
let circle = UIBezierPath(ovalIn: CGRect(x: 50, y: 50, width: 300, height: 300))
path.append(circle)
path.usesEvenOddFillRule = true

let toPath = UIBezierPath(rect: contentRect)
let toCircleRect = CGRect(x: 150, y: 150, width: 100, height: 100)
let toCircle = UIBezierPath(ovalIn: toCircleRect)
toPath.append(toCircle)
toPath.usesEvenOddFillRule = true

let hole = CAShapeLayer()
hole.path = path.cgPath
hole.fillColor = UIColor.green.cgColor
hole.fillRule = kCAFillRuleEvenOdd

let mask = UIView(frame: contentRect)

contentView.addSubview(imageView)

contentView.addSubview(blurView)

mask.layer.addSublayer(hole)

blurView.mask = mask

let animation = CABasicAnimation(keyPath: "path")
animation.fromValue = hole.path
animation.toValue = toPath.cgPath
animation.duration = 2
animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
hole.add(animation, forKey: nil)

CATransaction.begin()
CATransaction.disableActions()
hole.path = toPath.cgPath
CATransaction.commit()