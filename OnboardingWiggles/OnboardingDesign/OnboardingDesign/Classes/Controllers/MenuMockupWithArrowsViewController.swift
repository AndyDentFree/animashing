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
    func animateHelpTips() {
        [tipArrowToExpander, tipArrowToComposer, tipArrowToApp, tipArrowToFaves]
                .forEach{animateTipArrowUpRight(of: $0)}
    }

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
                msg: "Tap or drag the expander bar to switch between the menu Compact view and editing or playback Expanded views.",
                url: "https://www.touchgram.com/blogs/post/meet-the-expander")
        )
        add(link:HelpLink(
                button: helpcomposerButton,
                indicator: tipArrowToComposer,
                msg: "Composer - the main screen where you add details to the pages of the Touchgram",
                url: "https://www.touchgram.com/blogs/post/composer")
        )
        add(link:HelpLink(
                button: helpfavesButton,
                indicator: tipArrowToFaves,
                msg: "Faves - a list of saved favorite messages and samples.",
                url: "https://www.touchgram.com/blogs/post/saving-faves")
        )
        add(link:HelpLink(
                button: helpappButton,
                indicator: tipArrowToApp,
                msg: "App button, for this test will cycle Help tip visibility + animation.\n\nRoses are red, violets are cyan, if you don't like my verse then you're probably cryin",
                url: "https://github.com/AndyDentFree/animashing")
        )
    }

    override public func viewWillAppear(_ animated: Bool)  {
        super.viewWillAppear(animated)
        
        // Navigation bar, if any
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateHelpTipsAppearance()
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
    @IBAction public func toggleHelpVisible(_ sender: UIButton) {
        cycleStatus()
    }


    @IBAction public func onComposerButtonPressed(_ sender: UIButton)  {
        let destination = ExpandedViewViewController(nibName: "ExpandedViewViewController", bundle: nil)
        self.navigationController?.pushViewController(destination, animated: true)
    }
}
