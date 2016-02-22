//
//  PreviewedViewController.swift
//  ViewControllerPreviewing
//
//  Created by Karol Kozub on 2016-02-21.
//  Copyright © 2016 Karol Kozub. All rights reserved.
//

import UIKit

class PreviewedViewController: UIViewController {
    override func previewActionItems() -> [UIPreviewActionItem] {
        let defaultStyleAction = UIPreviewAction(title: "Default Style",
            style: .Default) {action, controller in
        }

        let destructiveStyleAction = UIPreviewAction(title: "Destructive Style",
            style: .Destructive) {action, controller in
        }

        let selectedStyleAction = UIPreviewAction(title: "Selected Style",
            style: .Selected) {action, controller in
        }

        let actionGroup = UIPreviewActionGroup(title: "Group",
            style: .Default,
            actions: [defaultStyleAction, defaultStyleAction, defaultStyleAction])

        return [defaultStyleAction, destructiveStyleAction,
            selectedStyleAction, actionGroup]
    }
}
