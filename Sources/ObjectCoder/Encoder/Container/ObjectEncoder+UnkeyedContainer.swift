//
//  UnkeyedContainer.swift
//  
//
//  Created by Geoffrey Foster on 2019-07-18.
//

import Foundation

extension ObjectEncoder {
	struct UnkeyedContainer {
		private let encoder: ObjectEncoder
		var codingPath: [CodingKey]
		
		private var container: NSMutableArray
		
		init(referencing encoder: ObjectEncoder, codingPath: [CodingKey], wrapping container: NSMutableArray) {
			self.encoder = encoder
			self.codingPath = codingPath
			self.container = container
		}
	}
}

extension ObjectEncoder.UnkeyedContainer: UnkeyedEncodingContainer {
	var count: Int {
		return container.count
	}
	
	mutating func encodeNil() throws {
		container.add(encoder.boxer.encodedNull(encoder))
	}
	
	mutating func encode(_ value: Bool) throws {
		encoder.codingPath.append(AnyCodingKey(index: count))
		defer { encoder.codingPath.removeLast() }
		container.add(try encoder.boxer.encodedBool(value, encoder))
	}
	
	mutating func encode(_ value: String) throws {
		encoder.codingPath.append(AnyCodingKey(index: count))
		defer { encoder.codingPath.removeLast() }
		container.add(try encoder.boxer.encodedString(value, encoder))
	}
	
	mutating func encode(_ value: Double) throws {
		encoder.codingPath.append(AnyCodingKey(index: count))
		defer { encoder.codingPath.removeLast() }
		container.add(try encoder.boxer.encodedDouble(value, encoder))
	}
	
	mutating func encode(_ value: Float) throws {
		encoder.codingPath.append(AnyCodingKey(index: count))
		defer { encoder.codingPath.removeLast() }
		container.add(try encoder.boxer.encodedFloat(value, encoder))
	}
	
	mutating func encode(_ value: Int) throws {
		encoder.codingPath.append(AnyCodingKey(index: count))
		defer { encoder.codingPath.removeLast() }
		container.add(try encoder.boxer.encodedInt(value, encoder))
	}
	
	mutating func encode(_ value: Int8) throws {
		encoder.codingPath.append(AnyCodingKey(index: count))
		defer { encoder.codingPath.removeLast() }
		container.add(try encoder.boxer.encodedInt8(value, encoder))
	}
	
	mutating func encode(_ value: Int16) throws {
		encoder.codingPath.append(AnyCodingKey(index: count))
		defer { encoder.codingPath.removeLast() }
		container.add(try encoder.boxer.encodedInt16(value, encoder))
	}
	
	mutating func encode(_ value: Int32) throws {
		encoder.codingPath.append(AnyCodingKey(index: count))
		defer { encoder.codingPath.removeLast() }
		container.add(try encoder.boxer.encodedInt32(value, encoder))
	}
	
	mutating func encode(_ value: Int64) throws {
		encoder.codingPath.append(AnyCodingKey(index: count))
		defer { encoder.codingPath.removeLast() }
		container.add(try encoder.boxer.encodedInt64(value, encoder))
	}
	
	mutating func encode(_ value: UInt) throws {
		encoder.codingPath.append(AnyCodingKey(index: count))
		defer { encoder.codingPath.removeLast() }
		container.add(try encoder.boxer.encodedUInt(value, encoder))
	}
	
	mutating func encode(_ value: UInt8) throws {
		encoder.codingPath.append(AnyCodingKey(index: count))
		defer { encoder.codingPath.removeLast() }
		container.add(try encoder.boxer.encodedUInt8(value, encoder))
	}
	
	mutating func encode(_ value: UInt16) throws {
		encoder.codingPath.append(AnyCodingKey(index: count))
		defer { encoder.codingPath.removeLast() }
		container.add(try encoder.boxer.encodedUInt16(value, encoder))
	}
	
	mutating func encode(_ value: UInt32) throws {
		encoder.codingPath.append(AnyCodingKey(index: count))
		defer { encoder.codingPath.removeLast() }
		container.add(try encoder.boxer.encodedUInt32(value, encoder))
	}
	
	mutating func encode(_ value: UInt64) throws {
		encoder.codingPath.append(AnyCodingKey(index: count))
		defer { encoder.codingPath.removeLast() }
		container.add(try encoder.boxer.encodedUInt64(value, encoder))
	}
	
	mutating func encode<T>(_ value: T) throws where T: Encodable {
		encoder.codingPath.append(AnyCodingKey(index: count))
		defer { encoder.codingPath.removeLast() }
		container.add(try encoder.boxer.encoded(value, in: encoder))
	}
	
	mutating func nestedContainer<NestedKey>(keyedBy keyType: NestedKey.Type) -> KeyedEncodingContainer<NestedKey> where NestedKey : CodingKey {
		fatalError()
	}
	
	mutating func nestedUnkeyedContainer() -> UnkeyedEncodingContainer {
		fatalError()
	}
	
	mutating func superEncoder() -> Encoder {
		fatalError()
	}
}
