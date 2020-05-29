//
//  SupernovaLabel.swift
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

class SupernovaLabel: UILabel {


    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- 
    // MARK: - Properties

    public var clippingOffset: CGFloat = 0


    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- 
    // MARK: - Clipping

    override public var intrinsicContentSize: CGSize  {
        var size = super.intrinsicContentSize
        size.height += self.clippingOffset / 2
        return size
    }

    override public func drawText(in rect: CGRect)  {
        var rect = rect
        rect.origin.y += self.clippingOffset / 2
        super.drawText(in: rect)
    }
}
