//
//  ExpandedViewViewController.swift
//  OnboardingDesign
//
//  Created by Andy Dent.
//  Copyright © 2018 Aussie Designed Software Pty Ltd. All rights reserved.
//

// --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- 
// MARK: - Import

import UIKit


// --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- 
// MARK: - Implementation

class ExpandedViewViewController: UIViewController {


    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- 
    // MARK: - Properties

    @IBOutlet weak var helptoolsButton: SupernovaButton!
    @IBOutlet weak var helpapppagemenuButton: SupernovaButton!
    @IBOutlet weak var tiparrowtocloseImageView: UIImageView!
    @IBOutlet weak var helpcloseButton: SupernovaButton!


    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- 
    // MARK: - Lifecycle

    override public func viewDidLoad()  {
        super.viewDidLoad()
        self.setupComponents()
        self.setupUI()
        self.setupGestureRecognizers()
        self.setupLocalization()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override public func viewWillAppear(_ animated: Bool)  {
        super.viewWillAppear(animated)
        
        // Navigation bar, if any
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }


    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- 
    // MARK: - Setup

    private func setupComponents()  {
        // Setup helptoolsButton
        self.helptoolsButton.snImageTextSpacing = 10
        
        // Setup helpapppagemenuButton
        self.helpapppagemenuButton.snImageTextSpacing = 10
        
        // Setup tiparrowtocloseImageView
        
        // Setup helpcloseButton
        self.helpcloseButton.snImageTextSpacing = 10
        
    }

    private func setupUI()  {
        self.extendedLayoutIncludesOpaqueBars = true
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    private func setupGestureRecognizers()  {
    
    }

    private func setupLocalization()  {
    
    }


    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- 
    // MARK: - Status Bar

    override public var prefersStatusBarHidden: Bool  {
        return true
    }

    override public var preferredStatusBarStyle: UIStatusBarStyle  {
        return .default
    }


    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- 
    // MARK: - Actions

    @IBAction public func onHelpToolsPressed(_ sender: UIButton)  {
    
    }

    @IBAction public func onHelpAppPageMenuPressed(_ sender: UIButton)  {
    
    }

    @IBAction public func onHelpClosePressed(_ sender: UIButton)  {
        let destination = ShowHelpViewController(nibName: "ShowHelpViewController", bundle: nil)
        self.present(destination, animated: true, completion: nil)
        //self.navigationController?.pushViewController(destination, animated: true)
    }


    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- 
    // MARK: - Animations

    private func animationOne()  {
        let animationElement1 = CAAnimationGroup()
        animationElement1.isRemovedOnCompletion = false
        animationElement1.fillMode = .removed
        animationElement1.duration = 10
        animationElement1.animations = []
        
        let animationProperty1 = CAKeyframeAnimation()
        animationProperty1.beginTime = 0
        animationProperty1.repeatCount = Float(1)
        animationProperty1.duration = 1.25
        animationProperty1.autoreverses = false
        animationProperty1.isRemovedOnCompletion = false
        animationProperty1.timingFunction = CAMediaTimingFunction(controlPoints: 0.42, 0, 0.58, 1)
        animationProperty1.keyPath = "transform.translation.x"
        animationProperty1.keyTimes = [ 0, 0.24, 0.6, 0.8, 1 ]
        animationProperty1.values = [ 0, -4, 8, -4, 4 ]
        animationElement1.animations?.append(animationProperty1)
        
        
        let animationProperty2 = CAKeyframeAnimation()
        animationProperty2.beginTime = 0
        animationProperty2.repeatCount = Float(1)
        animationProperty2.duration = 1.25
        animationProperty2.autoreverses = false
        animationProperty2.isRemovedOnCompletion = false
        animationProperty2.timingFunction = CAMediaTimingFunction(controlPoints: 0.42, 0, 0.58, 1)
        animationProperty2.keyPath = "transform.translation.y"
        animationProperty2.keyTimes = [ 0, 0.24, 0.6, 0.8, 1 ]
        animationProperty2.values = [ 0, 4, -8, 4, -4 ]
        animationElement1.animations?.append(animationProperty2)
        
        
        let animationProperty3 = CAKeyframeAnimation()
        animationProperty3.beginTime = 1.2
        animationProperty3.repeatCount = Float(11)
        animationProperty3.duration = 0.8
        animationProperty3.autoreverses = false
        animationProperty3.isRemovedOnCompletion = false
        animationProperty3.timingFunction = CAMediaTimingFunction(controlPoints: 0.42, 0, 1, 1)
        animationProperty3.keyPath = "transform.rotation.z"
        animationProperty3.keyTimes = [ 0, 0.19, 0.5, 0.81, 1 ]
        animationProperty3.values = [ 0 / 180 * Double.pi, -10 / 180 * Double.pi, 20 / 180 * Double.pi, -20 / 180 * Double.pi, 10 / 180 * Double.pi ]
        animationElement1.animations?.append(animationProperty3)
        
        
        self.tiparrowtocloseImageView.layer.add(animationElement1, forKey: nil)
    }
}
