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
let blurView = UIVisualEffectView()
blurView.frame = contentRect

let path = UIBezierPath(rect: contentRect)
let circle = UIBezierPath(ovalIn: CGRect(x: 50, y: 50, width: 300, height: 300))
path.append(circle)
path.usesEvenOddFillRule = true

let hole = CAShapeLayer()
hole.path = path.cgPath
hole.fillColor = UIColor.green.cgColor
hole.fillRule = kCAFillRuleEvenOdd

let mask = UIView(frame: contentRect)
mask.layer.addSublayer(hole)

contentView.addSubview(imageView)

contentView.addSubview(blurView)

blurView.mask = mask

UIView.animate(withDuration: 10.0) {
    blurView.effect = UIBlurEffect(style: .regular)
}