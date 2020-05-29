//
//  UINavigationController+Utility.swift
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

extension UINavigationController {


    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- 
    // MARK: - Utility
    override open var preferredStatusBarStyle: UIStatusBarStyle  {
        return self.topViewController?.preferredStatusBarStyle ?? .default
    }
}
