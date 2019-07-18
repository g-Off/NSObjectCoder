//
//  KeyedContainer.swift
//  
//
//  Created by Geoffrey Foster on 2019-07-18.
//

import Foundation

extension ObjectEncoder {
	struct KeyedContainer<Key> where Key: CodingKey {
		private let encoder: ObjectEncoder
		var codingPath: [CodingKey]
		
		private var container: NSMutableDictionary
		
		init(referencing encoder: ObjectEncoder, codingPath: [CodingKey], wrapping container: NSMutableDictionary) {
			self.encoder = encoder
			self.codingPath = codingPath
			self.container = container
		}
	}
}

extension ObjectEncoder.KeyedContainer: KeyedEncodingContainerProtocol {
	private func _converted(_ key: CodingKey) -> CodingKey {
		return encoder.options.keyEncodingStrategy.transform(codingKey: key, codingPath: codingPath)
	}
	
	mutating func encodeNil(forKey key: Key) throws {
		container[_converted(key)] = encoder.boxer.encodedNull(encoder)
	}
	
	mutating func encode(_ value: Bool, forKey key: Key) throws {
		encoder.codingPath.append(key)
		defer { encoder.codingPath.removeLast() }
		container[_converted(key).stringValue] = try encoder.boxer.encodedBool(value, encoder)
	}
	
	mutating func encode(_ value: String, forKey key: Key) throws {
		encoder.codingPath.append(key)
		defer { encoder.codingPath.removeLast() }
		container[_converted(key).stringValue] = try encoder.boxer.encodedString(value, encoder)
	}
	
	mutating func encode(_ value: Double, forKey key: Key) throws {
		encoder.codingPath.append(key)
		defer { encoder.codingPath.removeLast() }
		container[_converted(key).stringValue] = try encoder.boxer.encodedDouble(value, encoder)
	}
	
	mutating func encode(_ value: Float, forKey key: Key) throws {
		encoder.codingPath.append(key)
		defer { encoder.codingPath.removeLast() }
		container[_converted(key).stringValue] = try encoder.boxer.encodedFloat(value, encoder)
	}
	
	mutating func encode(_ value: Int, forKey key: Key) throws {
		encoder.codingPath.append(key)
		defer { encoder.codingPath.removeLast() }
		container[_converted(key).stringValue] = try encoder.boxer.encodedInt(value, encoder)
	}
	
	mutating func encode(_ value: Int8, forKey key: Key) throws {
		encoder.codingPath.append(key)
		defer { encoder.codingPath.removeLast() }
		container[_converted(key).stringValue] = try encoder.boxer.encodedInt8(value, encoder)
	}
	
	mutating func encode(_ value: Int16, forKey key: Key) throws {
		encoder.codingPath.append(key)
		defer { encoder.codingPath.removeLast() }
		container[_converted(key).stringValue] = try encoder.boxer.encodedInt16(value, encoder)
	}
	
	mutating func encode(_ value: Int32, forKey key: Key) throws {
		encoder.codingPath.append(key)
		defer { encoder.codingPath.removeLast() }
		container[_converted(key).stringValue] = try encoder.boxer.encodedInt32(value, encoder)
	}
	
	mutating func encode(_ value: Int64, forKey key: Key) throws {
		encoder.codingPath.append(key)
		defer { encoder.codingPath.removeLast() }
		container[_converted(key).stringValue] = try encoder.boxer.encodedInt64(value, encoder)
	}
	
	mutating func encode(_ value: UInt, forKey key: Key) throws {
		encoder.codingPath.append(key)
		defer { encoder.codingPath.removeLast() }
		container[_converted(key).stringValue] = try encoder.boxer.encodedUInt(value, encoder)
	}
	
	mutating func encode(_ value: UInt8, forKey key: Key) throws {
		encoder.codingPath.append(key)
		defer { encoder.codingPath.removeLast() }
		container[_converted(key).stringValue] = try encoder.boxer.encodedUInt8(value, encoder)
	}
	
	mutating func encode(_ value: UInt16, forKey key: Key) throws {
		encoder.codingPath.append(key)
		defer { encoder.codingPath.removeLast() }
		container[_converted(key).stringValue] = try encoder.boxer.encodedUInt16(value, encoder)
	}
	
	mutating func encode(_ value: UInt32, forKey key: Key) throws {
		encoder.codingPath.append(key)
		defer { encoder.codingPath.removeLast() }
		container[_converted(key).stringValue] = try encoder.boxer.encodedUInt32(value, encoder)
	}
	
	mutating func encode(_ value: UInt64, forKey key: Key) throws {
		encoder.codingPath.append(key)
		defer { encoder.codingPath.removeLast() }
		container[_converted(key).stringValue] = try encoder.boxer.encodedUInt64(value, encoder)
	}
	
	mutating func encode<T>(_ value: T, forKey key: Key) throws where T: Encodable {
		encoder.codingPath.append(key)
		defer { encoder.codingPath.removeLast() }
		container[_converted(key).stringValue] = try encoder.boxer.encoded(value, in: encoder)
	}
	
	mutating func nestedContainer<NestedKey>(keyedBy keyType: NestedKey.Type, forKey key: Key) -> KeyedEncodingContainer<NestedKey> where NestedKey: CodingKey {
		fatalError()
	}
	
	mutating func nestedUnkeyedContainer(forKey key: Key) -> UnkeyedEncodingContainer {
		fatalError()
	}
	
	mutating func superEncoder() -> Encoder {
		fatalError()
	}
	
	mutating func superEncoder(forKey key: Key) -> Encoder {
		fatalError()
	}
}
