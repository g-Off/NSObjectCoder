//
//  SingleValueContainer.swift
//  
//
//  Created by Geoffrey Foster on 2019-07-18.
//

import Foundation

extension ObjectEncoder {
	struct SingleValueContainer {
		private let encoder: ObjectEncoder
		var codingPath: [CodingKey]
		
		init(referencing encoder: ObjectEncoder, codingPath: [CodingKey]) {
			self.encoder = encoder
			self.codingPath = codingPath
		}
	}
}

extension ObjectEncoder.SingleValueContainer: SingleValueEncodingContainer {
	private func assertCanEncodeNewValue() {
		precondition(encoder.canEncodeNewValue, "Attempt to encode value through single value container when previously value already encoded.")
	}
	
	mutating func encodeNil() throws {
		encoder.storage.pushValue(encoder.boxer.encodedNull(encoder))
	}
	
	mutating func encode(_ value: Bool) throws {
		assertCanEncodeNewValue()
		encoder.storage.pushValue(try encoder.boxer.encodedBool(value, encoder))
	}
	
	mutating func encode(_ value: String) throws {
		assertCanEncodeNewValue()
		encoder.storage.pushValue(try encoder.boxer.encodedString(value, encoder))
	}
	
	mutating func encode(_ value: Double) throws {
		assertCanEncodeNewValue()
		encoder.storage.pushValue(try encoder.boxer.encodedDouble(value, encoder))
	}
	
	mutating func encode(_ value: Float) throws {
		assertCanEncodeNewValue()
		encoder.storage.pushValue(try encoder.boxer.encodedFloat(value, encoder))
	}
	
	mutating func encode(_ value: Int) throws {
		assertCanEncodeNewValue()
		encoder.storage.pushValue(try encoder.boxer.encodedInt(value, encoder))
	}
	
	mutating func encode(_ value: Int8) throws {
		assertCanEncodeNewValue()
		encoder.storage.pushValue(try encoder.boxer.encodedInt8(value, encoder))
	}
	
	mutating func encode(_ value: Int16) throws {
		assertCanEncodeNewValue()
		encoder.storage.pushValue(try encoder.boxer.encodedInt16(value, encoder))
	}
	
	mutating func encode(_ value: Int32) throws {
		assertCanEncodeNewValue()
		encoder.storage.pushValue(try encoder.boxer.encodedInt32(value, encoder))
	}
	
	mutating func encode(_ value: Int64) throws {
		assertCanEncodeNewValue()
		encoder.storage.pushValue(try encoder.boxer.encodedInt64(value, encoder))
	}
	
	mutating func encode(_ value: UInt) throws {
		assertCanEncodeNewValue()
		encoder.storage.pushValue(try encoder.boxer.encodedUInt(value, encoder))
	}
	
	mutating func encode(_ value: UInt8) throws {
		assertCanEncodeNewValue()
		encoder.storage.pushValue(try encoder.boxer.encodedUInt8(value, encoder))
	}
	
	mutating func encode(_ value: UInt16) throws {
		assertCanEncodeNewValue()
		encoder.storage.pushValue(try encoder.boxer.encodedUInt16(value, encoder))
	}
	
	mutating func encode(_ value: UInt32) throws {
		assertCanEncodeNewValue()
		encoder.storage.pushValue(try encoder.boxer.encodedUInt32(value, encoder))
	}
	
	mutating func encode(_ value: UInt64) throws {
		assertCanEncodeNewValue()
		encoder.storage.pushValue(try encoder.boxer.encodedUInt64(value, encoder))
	}
	
	mutating func encode<T>(_ value: T) throws where T: Encodable {
		assertCanEncodeNewValue()
		encoder.storage.pushValue(try encoder.boxer.encoded(value, in: encoder))
	}
}
