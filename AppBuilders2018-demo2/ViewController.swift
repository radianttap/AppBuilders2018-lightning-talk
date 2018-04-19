//
//  ViewController.swift
//  AppBuilders2018-demo2
//
//  Created by Aleksandar Vacić on 4/13/18.
//  Copyright © 2018 Radiant Tap. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
	@IBOutlet private weak var containerView: UIView!

	@IBOutlet private var containerWidthConstraint: NSLayoutConstraint!
}

extension ViewController {
	@IBAction func initiateSearch(_ sender: UIButton) {

		let waitStateView = WaitStateView.nibInstance
		containerView.embed(view: waitStateView)

		containerWidthConstraint.isActive = false
		view.animateLayout()
	}
}
