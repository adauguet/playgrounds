import UIKit
import PlaygroundSupport

extension CGRect {
    init(center: CGPoint, size: CGSize) {
        let originX = center.x - size.width / 2
        let originY = center.y - size.height / 2
        self.origin = CGPoint(x: originX, y: originY)
        self.size = size
    }
}

let center = CGPoint(x: 100.0, y: 100.0)

let contentView = UIView(frame: CGRect(center: center, size: CGSize(width: 500.0, height: 500.0)))
contentView.backgroundColor = .white

PlaygroundPage.current.liveView = contentView

let view = UIView(frame: CGRect(center: contentView.center, size: CGSize(width: 300.0, height: 300.0)))
view.backgroundColor = .black

contentView.addSubview(view)

UIView.animate(withDuration: 2.0) {
    let animation = CABasicAnimation(keyPath: "cornerRadius")
    animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
    animation.fromValue = 10.0
    animation.toValue = 150.0
    animation.duration = 1.0
    
    view.layer.cornerRadius = 150.0
    view.layer.add(animation, forKey: "cornerRadius")
}