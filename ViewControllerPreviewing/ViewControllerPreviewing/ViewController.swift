//
//  ViewController.swift
//  ViewControllerPreviewing
//
//  Created by Karol Kozub on 2016-02-20.
//  Copyright © 2016 Karol Kozub. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UIViewControllerPreviewingDelegate {
    @IBOutlet weak var sourceView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        registerForPreviewingWithDelegate(self, sourceView: sourceView)
    }

    func previewingContext(previewingContext: UIViewControllerPreviewing,
        viewControllerForLocation location: CGPoint) -> UIViewController? {
            return PreviewedViewController()
    }

    func previewingContext(previewingContext: UIViewControllerPreviewing,
        commitViewController viewControllerToCommit: UIViewController) {
            navigationController?.pushViewController(viewControllerToCommit,
                animated: false)
    }
}

