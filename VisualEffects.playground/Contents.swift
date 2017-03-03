import Foundation
import UIKit
import PlaygroundSupport

let radius = 75.0
let viewFrame = CGRect(x: 0.0, y: 0.0, width: 400.0, height: 200.0)
let blurViewFrame = CGRect(x: 25.0, y: 25.0, width: radius * 2, height: radius * 2)
let labelFrame = CGRect(x: 0.0, y: 0.0, width: radius * 2, height: radius * 2)
let view = UIView(frame: viewFrame)

let font = UIFont.boldSystemFont(ofSize: 32.0)

let landscape = UIImage(named: "landscape.jpg")
let imageView = UIImageView(image: landscape)
imageView.frame = view.frame
imageView.contentMode = .scaleAspectFill

let blurEffect = UIBlurEffect(style: .regular)
let blurView = UIVisualEffectView(effect: blurEffect)
blurView.frame = blurViewFrame
blurView.clipsToBounds = true
blurView.layer.cornerRadius = blurView.frame.width / 2

let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
let vibrancyView = UIVisualEffectView(effect: vibrancyEffect)
vibrancyView.frame = view.frame

let label = UILabel(frame: labelFrame)
label.backgroundColor = .clear
label.text = "Antoine"
label.textColor = .white
label.font = font
label.textAlignment = .center

vibrancyView.contentView.addSubview(label)

blurView.contentView.addSubview(vibrancyView)

view.addSubview(imageView)
view.addSubview(blurView)

PlaygroundPage.current.liveView = view