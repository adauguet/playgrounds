import UIKit
import PlaygroundSupport

let rect = CGRect(x: 0.0, y: 0.0, width: 400.0, height: 400.0)

let center = CGPoint(x: 200.0, y: 200.0)
let pathRect = CGRect(center: center, size: CGSize(width: 400.0, height: 400.0))
let path = UIBezierPath(rect: pathRect)

let circleSize = CGSize(width: 20.0, height: 20.0)
let circleFrame = CGRect(center: center, size: circleSize)
let circle = UIBezierPath(ovalIn: circleFrame)

path.usesEvenOddFillRule = true
path.append(circle)

let contentView = UIView(frame: rect)
contentView.backgroundColor = .white

PlaygroundPage.current.liveView = contentView

let maskLayer = CAShapeLayer()
maskLayer.path = path.cgPath
maskLayer.fillRule = kCAFillRuleEvenOdd
maskLayer.fillColor = UIColor.black.cgColor

contentView.layer.addSublayer(maskLayer)

let toPath = UIBezierPath(rect: pathRect)
let toCircleFrame = CGRect(center: center, size: CGSize(width: 2 * sqrt(2) * 200.0, height: 2 * sqrt(2) * 200.0))
let toCircle = UIBezierPath(ovalIn: toCircleFrame)
toPath.append(toCircle)

let animation = CABasicAnimation(keyPath: "path")
animation.fromValue = path.cgPath
animation.toValue = toPath.cgPath
animation.duration = 5
animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
maskLayer.add(animation, forKey: nil)

CATransaction.begin()
CATransaction.disableActions()
maskLayer.path = toPath.cgPath
CATransaction.commit()