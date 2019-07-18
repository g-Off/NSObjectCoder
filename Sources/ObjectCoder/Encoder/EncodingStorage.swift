//
//  EncodingStorage.swift
//  
//
//  Created by Geoffrey Foster on 2019-07-18.
//

import Foundation

struct EncodingStorage {
	private var containers: [Any] = []
	init() {}
	
	var count: Int {
		return containers.count
	}
	
	var top: Any? {
		return containers.last
	}
	
	mutating func pushKeyedContainer() -> NSMutableDictionary {
		let reference = NSMutableDictionary()
		containers.append(reference)
		return reference
	}
	
	mutating func pushUnkeyedContainer() -> NSMutableArray {
		let reference = NSMutableArray()
		containers.append(reference)
		return reference
	}
	
	@discardableResult
	mutating func pushValue(_ value: Any) -> Any {
		containers.append(value)
		return value
	}
	
	mutating func popContainer() -> Any {
		precondition(!containers.isEmpty, "Empty container stack.")
		return containers.popLast()!
	}
}
