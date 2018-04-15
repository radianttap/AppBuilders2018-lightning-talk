//
//  GridController.swift
//  AppBuilders2018-demo2
//
//  Created by Aleksandar Vacić on 4/13/18.
//  Copyright © 2018 Radiant Tap. All rights reserved.
//

import UIKit

final class GridController: UICollectionViewController, StoryboardLoadable {
	private var waitStateView: UIView?

	//	MARK: Data model

	private var dataSource: [Model] = [] //Model.dummies
	{
		didSet {
			if !isViewLoaded { return }
			processDataUpdates()
		}
	}

	private func processDataUpdates() {
		collectionView?.reloadData()
		collectionView?.backgroundView = dataSource.count == 0 ? waitStateView : nil
	}

	//	MARK: View lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()

//		waitStateView = WaitStateView.nibInstance
		processDataUpdates()

		let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
		layout?.estimatedItemSize = CGSize(width: 150, height: 100)
		layout?.itemSize = UICollectionViewFlowLayoutAutomaticSize

		collectionView?.dataSource = self
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)

		DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
			[weak self] in
			self?.dataSource = Model.dummies
		}
	}

	// MARK: UICollectionViewDataSource

	override func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}

	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return dataSource.count
	}

	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell: GridCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
		let model = dataSource[indexPath.item]
		cell.populate(using: model)
		return cell
	}
}
