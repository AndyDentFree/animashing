//
//  MenuMockupWithArrowsViewController.swift
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

class MenuMockupWithArrowsViewController: UIViewController, HelpInvoker {


    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- 
    // MARK: - Properties

    @IBOutlet weak var composerbuttonButton: SupernovaButton!
    @IBOutlet weak var helpexpanderButton: SupernovaButton!
    @IBOutlet weak var helpcomposerButton: SupernovaButton!
    @IBOutlet weak var helpfavesButton: SupernovaButton!
    @IBOutlet weak var helpappButton: SupernovaButton!
    @IBOutlet weak var tipArrowToExpander: UIImageView!
    @IBOutlet weak var tipArrowToApp: UIImageView!
    @IBOutlet weak var tipArrowToComposer: UIImageView!
    @IBOutlet weak var tipArrowToFaves: UIImageView!

    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Protocol HelpInvoker
    var morePressed: Bool = false
    var helpLinks = Dictionary<UIView, HelpLink>()

    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- 
    // MARK: - Lifecycle

    override public func viewDidLoad()  {
        super.viewDidLoad()
        self.setupComponents()
        self.setupUI()
        self.setupGestureRecognizers()
        self.setupLocalization()
        
        // Do any additional setup after loading the view, typically from a nib.
        add(link:HelpLink(
                button: helpexpanderButton,
                indicator: tipArrowToExpander,
                msg: "expander",
                url: "https://github.com/AndyDentFree/animashing")
        )
        add(link:HelpLink(
                button: helpcomposerButton,
                indicator: tipArrowToComposer,
                msg: "composer",
                url: "https://github.com/AndyDentFree/animashing")
        )
        add(link:HelpLink(
                button: helpfavesButton,
                indicator: tipArrowToFaves,
                msg: "faves",
                url: "https://github.com/AndyDentFree/animashing")
        )
        add(link:HelpLink(
                button: helpappButton,
                indicator: tipArrowToApp,
                msg: "app",
                url: "https://github.com/AndyDentFree/animashing")
        )
    }

    override public func viewWillAppear(_ animated: Bool)  {
        super.viewWillAppear(animated)
        
        // Navigation bar, if any
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }


    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- 
    // MARK: - Setup

    private func setupComponents()  {
        // Setup composerbuttonButton
        self.composerbuttonButton.snImagePosition = .top
        
        // Setup helpexpanderButton
        self.helpexpanderButton.snImageTextSpacing = 10
        
        // Setup helpcomposerButton
        self.helpcomposerButton.snImageTextSpacing = 10
        
        // Setup helpfavesButton
        self.helpfavesButton.snImageTextSpacing = 10
        
        // Setup helpappButton
        self.helpappButton.snImageTextSpacing = 10
        
    }

    private func setupUI()  {
        self.extendedLayoutIncludesOpaqueBars = true
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
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

    @IBAction public func onComposerButtonPressed(_ sender: UIButton)  {
        let destination = ExpandedViewViewController(nibName: "ExpandedViewViewController", bundle: nil)
        self.navigationController?.pushViewController(destination, animated: true)
    }
}
