//
//  GridController.swift
//  AppBuilders2018-demo2
//
//  Created by Aleksandar Vacić on 4/13/18.
//  Copyright © 2018 Radiant Tap. All rights reserved.
//

import UIKit

final class GridController: UICollectionViewController {
	//	MARK: Data model

	private var dataSource: [String] = []


	//	MARK: View lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()

		collectionView?.backgroundColor = view.backgroundColor

		let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
		layout?.estimatedItemSize = CGSize(width: 150, height: 100)

		// Register cell classes
//		self.collectionView?.register(GridCell.self)
	}

	// MARK: UICollectionViewDataSource

	override func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}

	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 0
	}

	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell: GridCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
		return cell
	}
}
