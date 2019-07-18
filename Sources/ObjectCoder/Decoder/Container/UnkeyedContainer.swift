//
//  File.swift
//  
//
//  Created by Geoffrey Foster on 2019-07-07.
//

import Foundation

extension _NSObjectDecoder {
	class UnkeyedContainer: UnkeyedDecodingContainer {
		
		var count: Int? {
			return container.count
		}
		
		var isAtEnd: Bool {
			return self.currentIndex >= self.count!
		}
		
		var currentIndex: Int
		
		private let decoder: _NSObjectDecoder
		var codingPath: [CodingKey]
		
		private let container: NSArray
		
		init(referencing decoder: _NSObjectDecoder, codingPath: [CodingKey], wrapping container: NSArray) {
			self.decoder = decoder
			self.codingPath = codingPath
			self.container = container
			self.currentIndex = 0
		}
		
		func decodeNil() throws -> Bool {
			guard !self.isAtEnd else {
				throw DecodingError.valueNotFound(Any?.self, DecodingError.Context(codingPath: self.decoder.codingPath + [AnyCodingKey(index: self.currentIndex)], debugDescription: "Unkeyed container is at end."))
			}
			
			if self.container[self.currentIndex] is NSNull {
				self.currentIndex += 1
				return true
			} else {
				return false
			}
		}
		
//		func decode(_ type: Bool.Type) throws -> Bool {
//			guard !self.isAtEnd else {
//				throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.decoder.codingPath + [AnyCodingKey(index: self.currentIndex)], debugDescription: "Unkeyed container is at end."))
//			}
//
//			self.decoder.codingPath.append(AnyCodingKey(index: self.currentIndex))
//			defer { self.decoder.codingPath.removeLast() }
//
//			guard let decoded = try self.decoder.unbox(self.container[self.currentIndex], as: type) else {
//				throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.decoder.codingPath + [AnyCodingKey(index: self.currentIndex)], debugDescription: "Expected \(type) but found null instead."))
//			}
//
//			self.currentIndex += 1
//			return decoded
//		}
//
//		func decode(_ type: String.Type) throws -> String {
//			fatalError()
//		}
//
//		func decode(_ type: Double.Type) throws -> Double {
//			fatalError()
//		}
//
//		func decode(_ type: Float.Type) throws -> Float {
//			fatalError()
//		}
//
//		func decode(_ type: Int.Type) throws -> Int {
//			fatalError()
//		}
//
//		func decode(_ type: Int8.Type) throws -> Int8 {
//			fatalError()
//		}
//
//		func decode(_ type: Int16.Type) throws -> Int16 {
//			fatalError()
//		}
//
//		func decode(_ type: Int32.Type) throws -> Int32 {
//			fatalError()
//		}
//
//		func decode(_ type: Int64.Type) throws -> Int64 {
//			fatalError()
//		}
//
//		func decode(_ type: UInt.Type) throws -> UInt {
//			fatalError()
//		}
//
//		func decode(_ type: UInt8.Type) throws -> UInt8 {
//			fatalError()
//		}
//
//		func decode(_ type: UInt16.Type) throws -> UInt16 {
//			fatalError()
//		}
//
//		func decode(_ type: UInt32.Type) throws -> UInt32 {
//			fatalError()
//		}
//
//		func decode(_ type: UInt64.Type) throws -> UInt64 {
//			fatalError()
//		}
		
		func decode<T>(_ type: T.Type) throws -> T where T: Decodable {
//			guard !self.isAtEnd else {
//				throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.decoder.codingPath + [AnyCodingKey(index: self.currentIndex)], debugDescription: "Unkeyed container is at end."))
//			}
//			
//			self.decoder.codingPath.append(AnyCodingKey(index: self.currentIndex))
//			defer { self.decoder.codingPath.removeLast() }
//			
//			guard let decoded = try self.decoder.unbox(self.container[self.currentIndex], as: T.self) else {
//				throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: self.decoder.codingPath + [AnyCodingKey(index: self.currentIndex)], debugDescription: "Expected \(type) but found null instead."))
//			}
//			
//			self.currentIndex += 1
//			return decoded
			fatalError()
		}
		
		func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type) throws -> KeyedDecodingContainer<NestedKey> where NestedKey: CodingKey {
			fatalError()
		}
		
		func nestedUnkeyedContainer() throws -> UnkeyedDecodingContainer {
			fatalError()
		}
		
		func superDecoder() throws -> Decoder {
			fatalError()
		}
	}
}
