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

class ExpandedViewViewController: UIViewController, HelpInvoker {   

    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- 
    // MARK: - Properties

    @IBOutlet weak var helptoolsButton: SupernovaButton!
    @IBOutlet weak var helpapppagemenuButton: SupernovaButton!
    @IBOutlet weak var tiparrowtocloseImageView: UIImageView!
    @IBOutlet weak var helpcloseButton: SupernovaButton!
    @IBOutlet weak var tipArrowToTools: UIImageView!
    @IBOutlet weak var tipArrowToPageMenu: UIImageView!
    @IBOutlet weak var collapseButton: SupernovaButton!

    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Protocol HelpInvoker
    var morePressed: Bool = false
    var helpLinks = Dictionary<UIView, HelpLink>()
    func animateHelpTips() {
        [tiparrowtocloseImageView].forEach{animateTipArrowUpRight(of: $0)}
        [tipArrowToPageMenu, tipArrowToTools].forEach{animateTipArrowDownLeft(of: $0)}
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

        // these calls hook up the help buttons and optional indicators to trigger help
        // so all the config is done here, don't need separate IBActions in this class
        add(link:HelpLink(
                button: helpcloseButton,
                indicator: tiparrowtocloseImageView,
                msg: "Close button, cancels the message you have in progress but Touchgram remembers pages you've done so far.",
                url: "https://www.touchgram.com/blogs/post/closebox")
        )
        add(link: HelpLink(
                button: helpapppagemenuButton,
                indicator: tipArrowToPageMenu,
                msg: "Page menu pops up when you tap here, to add pages or change the Current Page",
                url: "https://www.touchgram.com/blogs/post/popup-page-menu")
        )
        add(link: HelpLink(
                button: helptoolsButton,
                indicator: tipArrowToTools,
                msg: "A Tools button is on most screens, showing options that vary depending on where you are.",
                url: "https://www.touchgram.com/blogs/post/hidden-features-on-tools")
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
    @IBAction public func onAnyHelpButtonPressed(_ sender: UIButton)  {
        showHelp(for:sender)
    }
    
    @IBAction public func onCollapseButtonPressed(_ sender: UIButton)  {
        // Pop the navigation stack or dismiss the modal presentation
        if let navigationController = self.navigationController, navigationController.viewControllers.first != self {
            navigationController.popViewController(animated: true)
        } else if self.presentingViewController != nil {
            self.dismiss(animated: true, completion: nil)
        }
    }

}
