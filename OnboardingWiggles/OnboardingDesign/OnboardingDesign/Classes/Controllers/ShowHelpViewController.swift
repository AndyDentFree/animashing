//
//  ShowHelpViewController.swift
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

/// Note: HelpInvoker protocol extension knows this class details & directly access properties & outlets
class ShowHelpViewController: UIViewController {

    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- 
    // MARK: - Properties

    @IBOutlet weak var tipboxView: UIView!
    @IBOutlet weak var tiptextLabel: UILabel!
    @IBOutlet weak var morebuttonButton: SupernovaButton!

    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - HelpInvoker properties
    public var invokedBy: HelpInvoker? = nil
    public var helpMsg: String? = nil
    public var moreUrl: URL? = nil

    public static var urlLauncher: ((URL) -> Void)? = nil // abstract this a bit because some environments need indirection

    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Support for fancy transitions
    private var customTransitioningDelegate = TransitioningDelegate()
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configureTransition()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureTransition()
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
    }

    override public func viewWillAppear(_ animated: Bool)  {
        super.viewWillAppear(animated)
        
        // Navigation bar, if any
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }


    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- 
    // MARK: - Setup

    private func configureTransition() {
        modalPresentationStyle = .custom
        modalTransitionStyle = .crossDissolve              // use whatever transition you want
        transitioningDelegate = customTransitioningDelegate
    }

    private func setupComponents()  {
  /*
        // Setup tiptextLabel
        let tiptextLabelAttrString = NSMutableAttributedString(string: "Tap or drag the bar to switch between the full-size editor and this compact menu", attributes: [
            .font : UIFont(name: "SFCompactText-Regular", size: 17)!,
            .foregroundColor : UIColor(red: 0.37, green: 0.05, blue: 0.38, alpha: 1),
            .kern : 0,
            .paragraphStyle : NSMutableParagraphStyle(alignment: .left, lineHeight: nil, paragraphSpacing: 1)
        ])
        self.tiptextLabel.attributedText = tiptextLabelAttrString
        */
        self.tiptextLabel.text = helpMsg
        
        // Setup morebuttonButton
        self.morebuttonButton.snImageTextSpacing = 10
        
    }

    private func setupUI()  {
        self.extendedLayoutIncludesOpaqueBars = true
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    private func setupGestureRecognizers()  {
        let exitOnTap = UITapGestureRecognizer(target: self, action: #selector(self.handleTapLabel(_:)))
        tiptextLabel.addGestureRecognizer(exitOnTap)
        tipboxView.addGestureRecognizer(exitOnTap)
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

    @IBAction public func onMoreButtonPressed(_ sender: UIButton)  {
        invokedBy?.morePressed = true  // flag should cause completion routine to do something interesting
        if let url = self.moreUrl, let launcher = ShowHelpViewController.urlLauncher {
            self.dismiss(animated: true, completion: { launcher(url) })
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }

    @objc private func handleTapLabel(_ sender: UITapGestureRecognizer) {
        invokedBy?.morePressed = false
        self.dismiss(animated: true, completion: nil)
    }
}
