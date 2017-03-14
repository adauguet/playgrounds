//
//  ViewController.swift
//  AnimatedBlurHole
//
//  Created by Antoine DAUGUET on 13/03/2017.
//  Copyright © 2017 Antoine DAUGUET. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let blur = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blur)
        blurView.frame = view.frame
        
        let path = UIBezierPath(rect: view.frame)
        let circle = UIBezierPath(ovalIn: CGRect(x: 50, y: 50, width: 300, height: 300))
        path.append(circle)
        path.usesEvenOddFillRule = true
        
        let toPath = UIBezierPath(rect: view.frame)
        let toCircleRect = CGRect(x: 150, y: 150, width: 100, height: 100)
        let toCircle = UIBezierPath(ovalIn: toCircleRect)
        toPath.append(toCircle)
        toPath.usesEvenOddFillRule = true
        
        let hole = CAShapeLayer()
        hole.path = path.cgPath
        hole.fillColor = UIColor.green.cgColor
        hole.fillRule = kCAFillRuleEvenOdd
        
        let mask = UIView(frame: view.frame)
        
        view.addSubview(blurView)
        
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
    }
}
