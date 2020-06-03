//
//  HelpAnimations.swift
//  OnboardingDesign
//
//  Created by Andrew Dent on 3/6/20.
//  Copyright © 2020 Aussie Designed Software Pty Ltd. All rights reserved.
//

import Foundation
import UIKit

public func animateTipArrowUpRight(of toAnimate:UIView) {
    animateTipArrowAngled(of:toAnimate, xValues: [ 0, -4, 8, -4, 4 ], yValues: [ 0, 4, -8, 4, -4 ])
}

public func animateTipArrowDownLeft(of toAnimate:UIView) {
    animateTipArrowAngled(of:toAnimate, xValues: [ 0, 4, -8, 4, -4 ], yValues: [ 0, -4, 8, -4, 4 ])
}

private func animateTipArrowAngled(of toAnimate:UIView, xValues:[Int], yValues:[Int])  {
    let animationElement1 = CAAnimationGroup()
    //animationElement1.isRemovedOnCompletion = false
    animationElement1.fillMode = .removed
    animationElement1.duration = 1.5
    animationElement1.animations = []

    let animationProperty1 = CAKeyframeAnimation()
    animationProperty1.beginTime = 0
    animationProperty1.repeatCount = Float(1)
    animationProperty1.duration = 1.25
    animationProperty1.autoreverses = false
    //animationProperty1.isRemovedOnCompletion = false
    animationProperty1.timingFunction = CAMediaTimingFunction(controlPoints: 0.42, 0, 0.58, 1)
    animationProperty1.keyPath = "transform.translation.x"
    animationProperty1.keyTimes = [ 0, 0.24, 0.6, 0.8, 1 ]
    animationProperty1.values = xValues
    animationElement1.animations?.append(animationProperty1)


    let animationProperty2 = CAKeyframeAnimation()
    animationProperty2.beginTime = 0
    animationProperty2.repeatCount = Float(1)
    animationProperty2.duration = 1.25
    animationProperty2.autoreverses = false
    //animationProperty2.isRemovedOnCompletion = false
    animationProperty2.timingFunction = CAMediaTimingFunction(controlPoints: 0.42, 0, 0.58, 1)
    animationProperty2.keyPath = "transform.translation.y"
    animationProperty2.keyTimes = [ 0, 0.24, 0.6, 0.8, 1 ]
    animationProperty2.values = yValues
    animationElement1.animations?.append(animationProperty2)


    let animationProperty3 = CAKeyframeAnimation()
    animationProperty3.beginTime = 1.2
    animationProperty3.repeatCount = Float(1)
    animationProperty3.duration = 0.3
    animationProperty3.autoreverses = false
    //animationProperty3.isRemovedOnCompletion = false
    animationProperty3.timingFunction = CAMediaTimingFunction(controlPoints: 0.42, 0, 1, 1)
    animationProperty3.keyPath = "transform.rotation.z"
    animationProperty3.keyTimes = [ 0, 0.19, 0.5, 0.81, 1 ]
    animationProperty3.values = [ 0 / 180 * Double.pi, -10 / 180 * Double.pi, 20 / 180 * Double.pi, -20 / 180 * Double.pi, 10 / 180 * Double.pi ]
    animationElement1.animations?.append(animationProperty3)


    toAnimate.layer.add(animationElement1, forKey: nil)
}
