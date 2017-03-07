//: Playground - noun: a place where people can play

import UIKit
import CoreGraphics
import PlaygroundSupport

let frame = CGRect(x: 0, y: 0, width: 500, height: 500)
let background = UIView(frame: frame)
background.backgroundColor = .white
PlaygroundPage.current.liveView = background


let image = UIImage(named: "landscape.jpg")
let imageView = UIImageView(frame: frame)
imageView.image = image
imageView.contentMode = .scaleAspectFill
background.addSubview(imageView)

let radius: CGFloat = 40.0
let path = UIBezierPath(roundedRect: frame, cornerRadius: 0)
let circle = UIBezierPath(roundedRect: CGRect(x: 350, y: 250, width: 2 * radius, height: 2 * radius), cornerRadius: radius)
path.append(circle)
path.usesEvenOddFillRule = true

let fillLayer = CAShapeLayer()
fillLayer.path = path.cgPath
fillLayer.fillRule = kCAFillRuleEvenOdd
fillLayer.fillColor = UIColor.white.cgColor
fillLayer.opacity = 0.7
background.layer.addSublayer(fillLayer)
