//
//  UIView-Extensions.swift
//  Radiant Tap Essentials
//
//  Copyright © 2016 Radiant Tap
//  MIT License · http://choosealicense.com/licenses/mit/
//

import UIKit

extension UIView {
	var top: CGFloat {
		return frame.minY
	}
	var bottom: CGFloat {
		return frame.maxY
	}
	var left: CGFloat {
		return frame.minX
	}
	var right: CGFloat {
		return frame.maxX
	}

	//	Methods

	func embed(view v: UIView) {
		v.translatesAutoresizingMaskIntoConstraints = false
		addSubview(v)
		v.topAnchor.constraint(equalTo: topAnchor).isActive = true
		v.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
		v.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
		v.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
	}

	func animateAlpha(to alpha: CGFloat, duration: TimeInterval = 0.3) {
		UIView.animate(withDuration: duration) {
			[unowned self] in
			self.alpha = alpha
		}
	}

	func animateLayout(duration: TimeInterval = 0.3, include: (() -> Void)? = nil, completion: ((Bool) -> Void)? = nil) {
		UIView.animate(withDuration: duration, animations: {
			[unowned self] in
			if let include = include { include() }
			self.layoutIfNeeded()
			}, completion: completion)
	}

	func springLayout(duration: TimeInterval = 0.3, include: (() -> Void)? = nil, completion: ((Bool) -> Void)? = nil) {
		UIView.animate(withDuration: duration,
		               delay: 0,
		               usingSpringWithDamping: 0.96,
		               initialSpringVelocity: 20,
		               options: .allowAnimatedContent,
		               animations: {
						[unowned self] in
						if let include = include { include() }
						self.layoutIfNeeded()
			}, completion: completion)
	}

	func mask(corners: UIRectCorner = [], cornerRadius: CGFloat = 4) {
		let maskPath = UIBezierPath(roundedRect: bounds,
		                            byRoundingCorners: corners,
		                            cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
		let maskLayer = CAShapeLayer()
		maskLayer.frame = bounds
		maskLayer.path = maskPath.cgPath
		layer.mask = maskLayer
	}
}
