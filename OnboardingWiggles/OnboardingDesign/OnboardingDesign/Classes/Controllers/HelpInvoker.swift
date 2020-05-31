//
// Created by Andrew Dent on 30/5/20.
// Copyright (c) 2020 Aussie Designed Software Pty Ltd. All rights reserved.
//

import Foundation
import UIKit

struct HelpLink {
    var button:UIButton
    var indicator:UIImageView? = nil
    var msg: String = ""
    var url: String? = nil
}

/// Note: needs AnyObject to force to be class-only protocol so can have mutating funcs like add
protocol HelpInvoker : AnyObject {
    func showHelp(msg:String, url:String?)
    func showHelp(for: UIView)
    func add(link:HelpLink)
    var morePressed: Bool {get set}  // flag set by Help if more button pressed
    var helpLinks: Dictionary<UIView, HelpLink> {get set}  // generic base so can add ImageViews etc
}


extension HelpInvoker where Self: UIViewController {
    func showHelp(for key: UIView) {
        if let link = helpLinks[key] {
            showHelp(msg: link.msg, url: link.url)
        } else {
            showHelp(msg: "Help not specified", url: nil)
        }
    }

    func showHelp(msg: String, url: String? = nil) {
        let helpVC = ShowHelpViewController(nibName: "ShowHelpViewController", bundle: nil)
        helpVC.invokedBy = self
        helpVC.helpMsg = msg // yeah this knows the VC intimately but this is a paired friend function so that's OK
        if let urlString = url {
            helpVC.moreUrl = URL(string: urlString)
        }
        self.present(helpVC, animated: true, completion: nil)
    }

    /**
    Adds the help button action and a similar tap recognizer to the optional image indicator
    */
    func add(link:HelpLink) {
        helpLinks[link.button] = link
        link.button.addTarget(self, action: #selector(onHelpButton), for: .touchUpInside)
        if let indi = link.indicator {
            indi.isUserInteractionEnabled = true
            helpLinks[indi] = link  // also index the link by UIImageView
            indi.addGestureRecognizer(
                    UITapGestureRecognizer(target: self,
                            action: #selector(onTapHelpRelated(_:))
                    )
            )
        }
    }
}

/**
put these @objc selectors out on UIViewController rather than the specialisation above

otherwise get an error:
@objc can only be used with members of classes, @objc protocols, and concrete extensions of classes
*/
extension UIViewController {
    @objc func onHelpButton(sender: UIButton!) {
        guard let asHI = self as? HelpInvoker else {return}
        asHI.showHelp(for: sender)
    }

    @objc func onTapHelpRelated(_ sender: UITapGestureRecognizer) {
        guard let asHI = self as? HelpInvoker, let tapped = sender.view else {return}
        asHI.showHelp(for: tapped)
    }
}
