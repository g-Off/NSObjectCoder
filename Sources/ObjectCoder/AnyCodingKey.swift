//
//  AnyCodingKey.swift
//  
//
//  Created by Geoffrey Foster on 2019-07-18.
//

import Foundation

struct AnyCodingKey: CodingKey, Equatable, Hashable {
	var stringValue: String
	var intValue: Int?
}

extension AnyCodingKey {
	init?(stringValue: String) {
		self.init(stringValue: stringValue, intValue: nil)
	}
	
	init?(intValue: Int) {
		self.init(stringValue: "\(intValue)", intValue: intValue)
	}
	
	init(index: Int) {
		self.init(intValue: index)!
	}
	
	init<Key>(_ base: Key) where Key: CodingKey {
		if let intValue = base.intValue {
			self.init(intValue: intValue)!
		} else {
			self.init(stringValue: base.stringValue)!
		}
	}
}
