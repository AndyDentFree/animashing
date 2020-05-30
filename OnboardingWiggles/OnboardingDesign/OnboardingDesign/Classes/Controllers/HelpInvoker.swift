//
// Created by Andrew Dent on 30/5/20.
// Copyright (c) 2020 Aussie Designed Software Pty Ltd. All rights reserved.
//

import Foundation
import UIKit

protocol HelpInvoker {
    func showHelp(msg:String, url:String?)
    var morePressed: Bool {get set}  // flag set by Help if more button pressed
}

extension HelpInvoker where Self: UIViewController {
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
