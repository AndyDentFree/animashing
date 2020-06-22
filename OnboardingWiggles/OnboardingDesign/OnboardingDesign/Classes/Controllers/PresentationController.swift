//
// Created by Andrew Dent on 30/5/20.
// Copyright (c) 2020 Aussie Designed Software Pty Ltd. All rights reserved.
//
// Fancy controller because want to take up less than entire screen

import Foundation
import UIKit

class TransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {

    private var onDimmerTapped: UIGestureRecognizer?

    init(tapper:UIGestureRecognizer?=nil) {
        onDimmerTapped = tapper // save to use when create presentationController
    }

    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return PresentationController(presentedViewController: presented, presenting: presenting, tapper: onDimmerTapped)
    }
}

// based on https://stackoverflow.com/questions/54737884/changing-the-size-of-a-modal-view-controller/54738387#54738387
// note this is not able to handle taps so have to pass in a completed gesturerecogniser
class PresentationController: UIPresentationController {
    private var onDimmerTapped: UIGestureRecognizer? = nil

    override var frameOfPresentedViewInContainerView: CGRect {
        let bounds = presentingViewController.view.bounds
        let niceWidth = min(bounds.width, 300)
        let goldenRatioHeight = CGFloat(niceWidth)/1.618
        let size = CGSize(width: niceWidth, height: goldenRatioHeight)
        let origin = CGPoint(x: bounds.midX - size.width / 2, y: bounds.midY - size.height / 2)
        return CGRect(origin: origin, size: size)
    }

    convenience init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?, tapper:UIGestureRecognizer?=nil) {
        self.init(presentedViewController: presentedViewController, presenting: presentingViewController)

        presentedView?.autoresizingMask = [
            .flexibleTopMargin,
            .flexibleBottomMargin,
            .flexibleLeftMargin,
            .flexibleRightMargin
        ]

        presentedView?.translatesAutoresizingMaskIntoConstraints = true
        onDimmerTapped = tapper
    }
    let dimmingView: UIView = {
        let dimmingView = UIVisualEffectView(effect: UIBlurEffect(style: .extraLight))
        dimmingView.translatesAutoresizingMaskIntoConstraints = false
        return dimmingView
    }()

    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()

        let superview = presentingViewController.view!
        superview.addSubview(dimmingView)
        NSLayoutConstraint.activate([
            dimmingView.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            dimmingView.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            dimmingView.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            dimmingView.topAnchor.constraint(equalTo: superview.topAnchor)
        ])

        if let tc = presentingViewController.transitionCoordinator {
            tc.animate(alongsideTransition: { _ in
                self.dimmingView.alpha = 0.6
            }, completion: { _ in
                // it is tempting to add the tapper to self.dimmingView but inspection reveals that
                // there is a UITransitionView in front of the dimmingView which prevents gestures reaching it
                if let tapToAdd = self.onDimmerTapped, let tappable = self.containerView {
                    tappable.isUserInteractionEnabled = true  // put the tap recogniser on in here in case needed adding AFTER animation complete
                    tappable.addGestureRecognizer(tapToAdd)
                }
            })
        }
    }

    override func dismissalTransitionWillBegin() {
        super.dismissalTransitionWillBegin()

        presentingViewController.transitionCoordinator?.animate(alongsideTransition: { _ in
            self.dimmingView.alpha = 0
        }, completion: { _ in
            self.dimmingView.removeFromSuperview()
        })
    }
}
