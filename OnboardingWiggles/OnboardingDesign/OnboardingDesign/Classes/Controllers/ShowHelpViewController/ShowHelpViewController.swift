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

class ShowHelpViewController: UIViewController {


    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- 
    // MARK: - Properties

    @IBOutlet weak var tipboxView: UIView!
    @IBOutlet weak var tiptextLabel: UILabel!
    @IBOutlet weak var morebuttonButton: SupernovaButton!


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
        // Setup tipboxView
        self.tipboxView.layer.borderColor = UIColor(red: 0.878, green: 0.236, blue: 0.849, alpha: 1).cgColor /* #E03CD8 */
        self.tipboxView.layer.borderWidth = 4
        
        
        // Setup tiptextLabel
        let tiptextLabelAttrString = NSMutableAttributedString(string: "Tap or drag the bar to switch between the full-size editor and this compact menu", attributes: [
            .font : UIFont(name: "SFCompactText-Regular", size: 17)!,
            .foregroundColor : UIColor(red: 0.37, green: 0.05, blue: 0.38, alpha: 1),
            .kern : 0,
            .paragraphStyle : NSMutableParagraphStyle(alignment: .left, lineHeight: nil, paragraphSpacing: 1)
        ])
        self.tiptextLabel.attributedText = tiptextLabelAttrString
        
        // Setup morebuttonButton
        self.morebuttonButton.snImageTextSpacing = 10
        
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

    @IBAction public func onMoreButtonPressed(_ sender: UIButton)  {
    
    }
}
