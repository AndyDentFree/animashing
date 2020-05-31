//
// Created by Andrew Dent on 30/5/20.
// Copyright (c) 2020 Aussie Designed Software Pty Ltd. All rights reserved.
//

import Foundation
import UIKit

struct HelpLink {
    var button:UIButton? = nil
    var indicator:UIImageView? = nil
    var msg: String = ""
    var url: String? = nil
}

protocol HelpInvoker {
    func showHelp(msg:String, url:String?)
    var morePressed: Bool {get set}  // flag set by Help if more button pressed
    var helpLinks: Dictionary<UIButton, HelpLink> {get set}
}

extension HelpInvoker where Self: UIViewController {
    func showHelp(for btn:UIButton) {
        if let link = helpLinks[btn] {
            showHelp(msg: link.msg, url: link.url)
        } else {
            showHelp(msg: "Help not specified", url: nil)
        }
    }

    func showHelp(msg:String, url:String?=nil) {
        let helpVC = ShowHelpViewController(nibName: "ShowHelpViewController", bundle: nil)
        helpVC.invokedBy = self
        helpVC.helpMsg = msg // yeah this knows the VC intimately but this is a paired friend function so that's OK
        if let urlString = url {
            helpVC.moreUrl = URL(string: urlString)
        }
        self.present(helpVC, animated: true, completion:nil)
    }

    func openUrlAfterDismissing(url: String) {

    }

}
