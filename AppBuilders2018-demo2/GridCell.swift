//
//  GridCell.swift
//  AppBuilders2018-demo2
//
//  Created by Aleksandar Vacić on 4/13/18.
//  Copyright © 2018 Radiant Tap. All rights reserved.
//

import UIKit

final class GridCell: UICollectionViewCell, ReusableView {
	@IBOutlet private weak var label: UILabel!
	@IBOutlet private weak var marker: UILabel!

	private func cleanup() {
		label.text = nil
		marker.text = nil
	}
}

extension GridCell {
	override func prepareForReuse() {
		super.prepareForReuse()

		cleanup()
	}

	func populate(using model: Model) {
		label.text = model.text
		marker.text = model.marker
	}
}
