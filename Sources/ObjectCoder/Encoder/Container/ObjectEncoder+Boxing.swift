//
//  File.swift
//  
//
//  Created by Geoffrey Foster on 2019-07-21.
//

import Foundation

protocol Wrapper {
	var supports: Any.Type { get }
	func wrap<T>(_ item: T) -> Any
}

extension Wrapper {
	func matchDistance(to other: Any.Type) -> Int? {
			return Self.matchDistance(from: other, to: supports)
		}
	
	private static func matchDistance(from: Any.Type, to: Any.Type) -> Int? {
		if from == to { return 0 }
		guard let from = from as? AnyClass else { return nil }
		guard let fromSuperclass = from.superclass() else { return nil }
		guard let distance = matchDistance(from: fromSuperclass, to: to) else { return nil }
		return distance + 1
	}
}

struct _Wrapper: Wrapper {
	var supports: Any.Type
	var transformer: (Any) -> Any
	
	init<T, E>(_ transformer: @escaping (T) -> E) {
		self.transformer = {
			return transformer($0 as! T)
		}
		self.supports = T.self
	}
	
	func wrap<T>(_ item: T) -> Any {
		return transformer(item)
	}
}

extension ObjectEncoder {
	public final class Boxer {
		private var transformers: [Wrapper] = []
		private var cache: [ObjectIdentifier: Wrapper] = [:]
		
		public var encodedNull: (_ encoder: ObjectEncoder) -> Encoded
		public var encodedBool: (_ value: Bool, _ encoder: ObjectEncoder) throws -> Encoded
		public var encodedString: (_ value: String, _ encoder: ObjectEncoder) throws -> Encoded
		public var encodedDouble: (_ value: Double, _ encoder: ObjectEncoder) throws -> Encoded
		public var encodedFloat: (_ value: Float, _ encoder: ObjectEncoder) throws -> Encoded
		public var encodedInt: (_ value: Int, _ encoder: ObjectEncoder) throws -> Encoded
		public var encodedInt8: (_ value: Int8, _ encoder: ObjectEncoder) throws -> Encoded
		public var encodedInt16: (_ value: Int16, _ encoder: ObjectEncoder) throws -> Encoded
		public var encodedInt32: (_ value: Int32, _ encoder: ObjectEncoder) throws -> Encoded
		public var encodedInt64: (_ value: Int64, _ encoder: ObjectEncoder) throws -> Encoded
		public var encodedUInt: (_ value: UInt, _ encoder: ObjectEncoder) throws -> Encoded
		public var encodedUInt8: (_ value: UInt8, _ encoder: ObjectEncoder) throws -> Encoded
		public var encodedUInt16: (_ value: UInt16, _ encoder: ObjectEncoder) throws -> Encoded
		public var encodedUInt32: (_ value: UInt32, _ encoder: ObjectEncoder) throws -> Encoded
		public var encodedUInt64: (_ value: UInt64, _ encoder: ObjectEncoder) throws -> Encoded

		public init(
			encodedNull: @escaping (_ encoder: ObjectEncoder) -> Encoded,
			encodedBool: @escaping (_ value: Bool, _ encoder: ObjectEncoder) throws -> Encoded,
			encodedString: @escaping (_ value: String, _ encoder: ObjectEncoder) throws -> Encoded,
			encodedDouble: @escaping (_ value: Double, _ encoder: ObjectEncoder) throws -> Encoded,
			encodedFloat: @escaping (_ value: Float, _ encoder: ObjectEncoder) throws -> Encoded,
			encodedInt: @escaping (_ value: Int, _ encoder: ObjectEncoder) throws -> Encoded,
			encodedInt8: @escaping (_ value: Int8, _ encoder: ObjectEncoder) throws -> Encoded,
			encodedInt16: @escaping (_ value: Int16, _ encoder: ObjectEncoder) throws -> Encoded,
			encodedInt32: @escaping (_ value: Int32, _ encoder: ObjectEncoder) throws -> Encoded,
			encodedInt64: @escaping (_ value: Int64, _ encoder: ObjectEncoder) throws -> Encoded,
			encodedUInt: @escaping (_ value: UInt, _ encoder: ObjectEncoder) throws -> Encoded,
			encodedUInt8: @escaping (_ value: UInt8, _ encoder: ObjectEncoder) throws -> Encoded,
			encodedUInt16: @escaping (_ value: UInt16, _ encoder: ObjectEncoder) throws -> Encoded,
			encodedUInt32: @escaping (_ value: UInt32, _ encoder: ObjectEncoder) throws -> Encoded,
			encodedUInt64: @escaping (_ value: UInt64, _ encoder: ObjectEncoder) throws -> Encoded
		) {
			self.encodedNull = encodedNull
			self.encodedBool = encodedBool
			self.encodedString = encodedString
			self.encodedDouble = encodedDouble
			self.encodedFloat = encodedFloat
			self.encodedInt = encodedInt
			self.encodedInt8 = encodedInt8
			self.encodedInt16 = encodedInt16
			self.encodedInt32 = encodedInt32
			self.encodedInt64 = encodedInt64
			self.encodedUInt = encodedUInt
			self.encodedUInt8 = encodedUInt8
			self.encodedUInt16 = encodedUInt16
			self.encodedUInt32 = encodedUInt32
			self.encodedUInt64 = encodedUInt64
		}
		
		// TODO: instead of NSObject ideally return an `Any`, but even then, ideally this is restricted
		// to ReferenceConvertible types so that they would be able to be stored in the NSDictionary okay
		// Seems like `_ObjectiveCBridgeable` is the required constraint
		public func addWrapper<T>(_ transformer: @escaping (T) -> Encoded) {
			precondition(T.self != Bool.self, "Use encodedBool")
			precondition(T.self != String.self, "Use encodedString")
			let wrapper = _Wrapper(transformer)
			transformers.append(wrapper)
		}
		
		func encoded<T>(_ value: T, in encoder: ObjectEncoder) throws -> Any where T: Encodable {
			if let transformer = wrapper(type: T.self) {
				return transformer.wrap(value)
			}
			
			try value.encode(to: encoder)
			return encoder.storage.popContainer()
		}
		
		private func wrapper(type: Any.Type) -> Wrapper? {
			let objectIdentifier = ObjectIdentifier(type)
			if let wrapper = cache[objectIdentifier] {
				return wrapper
			}
			
			let matching: [(Wrapper, Int)] = transformers.compactMap {
				guard let distance = $0.matchDistance(to: type) else { return nil }
				return ($0, distance)
			}
			let wrapper = matching.sorted { (lhs, rhs) in
				return lhs.1 < rhs.1
			}.first.flatMap {
				$0.0
			}
			if let wrapper = wrapper {
				cache[objectIdentifier] = wrapper
			}
			
			return wrapper
		}
	}
}

extension ObjectEncoder.Boxer where Encoded == NSObject {
	public convenience init() {
		self.init(
			encodedNull: { (_) -> Encoded in
				return NSNull()
		},
			encodedBool: { (value, _) -> Encoded in
				return NSNumber(value: value)
		},
			encodedString: { (value, _) -> Encoded in
				return NSString(string: value)
		},
			encodedDouble: { (value, _) -> Encoded in
				return NSNumber(value: value)
		},
			encodedFloat: { (value, _) -> Encoded in
				return NSNumber(value: value)
		},
			encodedInt: { (value, _) -> Encoded in
				return NSNumber(value: value)
		},
			encodedInt8: { (value, _) -> Encoded in
				return NSNumber(value: value)
		},
			encodedInt16: { (value, _) -> Encoded in
				return NSNumber(value: value)
		},
			encodedInt32: { (value, _) -> Encoded in
				return NSNumber(value: value)
		},
			encodedInt64: { (value, _) -> Encoded in
				return NSNumber(value: value)
		},
			encodedUInt: { (value, _) -> Encoded in
				return NSNumber(value: value)
		},
			encodedUInt8: { (value, _) -> Encoded in
				return NSNumber(value: value)
		},
			encodedUInt16: { (value, _) -> Encoded in
				return NSNumber(value: value)
		},
			encodedUInt32: { (value, _) -> Encoded in
				return NSNumber(value: value)
		},
			encodedUInt64: { (value, _) -> Encoded in
				return NSNumber(value: value)
		})
	}
}
