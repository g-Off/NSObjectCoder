//
//  PBXDecoder.swift
//  
//
//  Created by Geoffrey Foster on 2019-07-07.
//

import Foundation

extension DecodingError {
	/// Returns a `.typeMismatch` error describing the expected type.
	///
	/// - parameter path: The path of `CodingKey`s taken to decode a value of this type.
	/// - parameter expectation: The type expected to be encountered.
	/// - parameter reality: The value that was encountered instead of the expected type.
	/// - returns: A `DecodingError` with the appropriate path and debug description.
	internal static func _typeMismatch(at path: [CodingKey], expectation: Any.Type, reality: Any) -> DecodingError {
		let description = "Expected to decode \(expectation) but found \(_typeDescription(of: reality)) instead."
		return .typeMismatch(expectation, Context(codingPath: path, debugDescription: description))
	}
	
	/// Returns a description of the type of `value` appropriate for an error message.
	///
	/// - parameter value: The value whose type to describe.
	/// - returns: A string describing `value`.
	/// - precondition: `value` is one of the types below.
	fileprivate static func _typeDescription(of value: Any) -> String {
		if value is NSNull {
			return "a null value"
		} else if value is NSNumber /* FIXME: If swift-corelibs-foundation isn't updated to use NSNumber, this check will be necessary: || value is Int || value is Double */ {
			return "a number"
		} else if value is String {
			return "a string/data"
		} else if value is [Any] {
			return "an array"
		} else if value is [String : Any] {
			return "a dictionary"
		} else {
			return "\(type(of: value))"
		}
	}
}

class _NSObjectDecoder: Decoder {
	var codingPath: [CodingKey]
	
	var userInfo: [CodingUserInfoKey: Any]
	
	func container<Key>(keyedBy type: Key.Type) throws -> KeyedDecodingContainer<Key> where Key: CodingKey {
		fatalError()
	}
	
	func unkeyedContainer() throws -> UnkeyedDecodingContainer {
		fatalError()
	}
	
	func singleValueContainer() throws -> SingleValueDecodingContainer {
		fatalError()
	}
	
	init(values: [String: AnyObject]) {
		fatalError()
	}
}
