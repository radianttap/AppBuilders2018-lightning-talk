//
//  Model.swift
//  AppBuilders2018-demo2
//
//  Created by Aleksandar Vacić on 4/15/18.
//  Copyright © 2018 Radiant Tap. All rights reserved.
//

import Foundation

struct Model {
	let text: String
	let marker: String
}

extension Model {
	static var dummies: [Model] {
		var arr: [Model] = []

		for _ in 0..<100 {
			let limit = Int(arc4random_uniform(15))
			let text: String = randomAlphaNumericString(length: limit)
			let marker: String = randomAlphaNumericString(length: 4).uppercased()

			arr.append( Model(text: text, marker: marker) )
		}

		return arr
	}

	private static func randomAlphaNumericString(length: Int) -> String {
		let allowedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
		let allowedCharsCount = UInt32(allowedChars.count)
		var randomString = ""

		for _ in 0..<length {
			let randomNum = Int(arc4random_uniform(allowedCharsCount))
			let randomIndex = allowedChars.index(allowedChars.startIndex, offsetBy: randomNum)
			let newCharacter = allowedChars[randomIndex]
			randomString += String(newCharacter)
		}

		return randomString
	}
}
