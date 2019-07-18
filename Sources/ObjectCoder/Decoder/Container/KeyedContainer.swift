//
//  File.swift
//  
//
//  Created by Geoffrey Foster on 2019-07-07.
//

import Foundation

extension _NSObjectDecoder {
	class KeyedContainer<Key>: KeyedDecodingContainerProtocol where Key: CodingKey {
		private let decoder: _NSObjectDecoder
		var codingPath: [CodingKey]
		
		private var container: [String: Any]
		
		init(referencing decoder: _NSObjectDecoder, codingPath: [CodingKey], wrapping container: [String: Any]) {
			self.decoder = decoder
			self.codingPath = codingPath
			self.container = container
		}
		
		private func _errorDescription(of key: CodingKey) -> String {
			return "\(key) (\"\(key.stringValue)\")"
		}
		
		var allKeys: [Key] {
			return container.keys.compactMap { Key(stringValue: $0) }
		}
		
		func contains(_ key: Key) -> Bool {
			return container[key.stringValue] != nil
		}
		
		func decodeNil(forKey key: Key) throws -> Bool {
			guard let entry = self.container[key.stringValue] else {
				throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "No value associated with key \(_errorDescription(of: key))."))
			}
			
			return entry is NSNull
		}
		
		func decode(_ type: Bool.Type, forKey key: Key) throws -> Bool {
			guard let entry = container[key.stringValue] else {
				throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "No value associated with key \(_errorDescription(of: key))."))
			}
			
			decoder.codingPath.append(key)
			defer { decoder.codingPath.removeLast() }
			
			guard let value = try decoder.unbox(entry, as: type) else {
				throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Expected \(type) value but found null instead."))
			}
			
			return value
		}
		
		func decode(_ type: String.Type, forKey key: Key) throws -> String {
			guard let entry = container[key.stringValue] else {
				throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "No value associated with key \(_errorDescription(of: key))."))
			}
			
			decoder.codingPath.append(key)
			defer { decoder.codingPath.removeLast() }
			
			guard let value = try decoder.unbox(entry, as: type) else {
				throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Expected \(type) value but found null instead."))
			}
			
			return value
		}
		
		func decode(_ type: Double.Type, forKey key: Key) throws -> Double {
			guard let entry = container[key.stringValue] else {
				throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "No value associated with key \(_errorDescription(of: key))."))
			}
			
			decoder.codingPath.append(key)
			defer { decoder.codingPath.removeLast() }
			
			guard let value = try decoder.unbox(entry, as: type) else {
				throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Expected \(type) value but found null instead."))
			}
			
			return value
		}
		
		func decode(_ type: Float.Type, forKey key: Key) throws -> Float {
			guard let entry = container[key.stringValue] else {
				throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "No value associated with key \(_errorDescription(of: key))."))
			}
			
			decoder.codingPath.append(key)
			defer { decoder.codingPath.removeLast() }
			
			guard let value = try decoder.unbox(entry, as: type) else {
				throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Expected \(type) value but found null instead."))
			}
			
			return value
		}
		
		func decode(_ type: Int.Type, forKey key: Key) throws -> Int {
			guard let entry = container[key.stringValue] else {
				throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "No value associated with key \(_errorDescription(of: key))."))
			}
			
			decoder.codingPath.append(key)
			defer { decoder.codingPath.removeLast() }
			
			guard let value = try decoder.unbox(entry, as: type) else {
				throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Expected \(type) value but found null instead."))
			}
			
			return value
		}
		
		func decode(_ type: Int8.Type, forKey key: Key) throws -> Int8 {
			guard let entry = container[key.stringValue] else {
				throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "No value associated with key \(_errorDescription(of: key))."))
			}
			
			decoder.codingPath.append(key)
			defer { decoder.codingPath.removeLast() }
			
			guard let value = try decoder.unbox(entry, as: type) else {
				throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Expected \(type) value but found null instead."))
			}
			
			return value
		}
		
		func decode(_ type: Int16.Type, forKey key: Key) throws -> Int16 {
			guard let entry = container[key.stringValue] else {
				throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "No value associated with key \(_errorDescription(of: key))."))
			}
			
			decoder.codingPath.append(key)
			defer { decoder.codingPath.removeLast() }
			
			guard let value = try decoder.unbox(entry, as: type) else {
				throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Expected \(type) value but found null instead."))
			}
			
			return value
		}
		
		func decode(_ type: Int32.Type, forKey key: Key) throws -> Int32 {
			guard let entry = container[key.stringValue] else {
				throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "No value associated with key \(_errorDescription(of: key))."))
			}
			
			decoder.codingPath.append(key)
			defer { decoder.codingPath.removeLast() }
			
			guard let value = try decoder.unbox(entry, as: type) else {
				throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Expected \(type) value but found null instead."))
			}
			
			return value
		}
		
		func decode(_ type: Int64.Type, forKey key: Key) throws -> Int64 {
			guard let entry = container[key.stringValue] else {
				throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "No value associated with key \(_errorDescription(of: key))."))
			}
			
			decoder.codingPath.append(key)
			defer { decoder.codingPath.removeLast() }
			
			guard let value = try decoder.unbox(entry, as: type) else {
				throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Expected \(type) value but found null instead."))
			}
			
			return value
		}
		
		func decode(_ type: UInt.Type, forKey key: Key) throws -> UInt {
			guard let entry = container[key.stringValue] else {
				throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "No value associated with key \(_errorDescription(of: key))."))
			}
			
			decoder.codingPath.append(key)
			defer { decoder.codingPath.removeLast() }
			
			guard let value = try decoder.unbox(entry, as: type) else {
				throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Expected \(type) value but found null instead."))
			}
			
			return value
		}
		
		func decode(_ type: UInt8.Type, forKey key: Key) throws -> UInt8 {
			guard let entry = container[key.stringValue] else {
				throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "No value associated with key \(_errorDescription(of: key))."))
			}
			
			decoder.codingPath.append(key)
			defer { decoder.codingPath.removeLast() }
			
			guard let value = try decoder.unbox(entry, as: type) else {
				throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Expected \(type) value but found null instead."))
			}
			
			return value
		}
		
		func decode(_ type: UInt16.Type, forKey key: Key) throws -> UInt16 {
			guard let entry = container[key.stringValue] else {
				throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "No value associated with key \(_errorDescription(of: key))."))
			}
			
			decoder.codingPath.append(key)
			defer { decoder.codingPath.removeLast() }
			
			guard let value = try decoder.unbox(entry, as: type) else {
				throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Expected \(type) value but found null instead."))
			}
			
			return value
		}
		
		func decode(_ type: UInt32.Type, forKey key: Key) throws -> UInt32 {
			guard let entry = container[key.stringValue] else {
				throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "No value associated with key \(_errorDescription(of: key))."))
			}
			
			decoder.codingPath.append(key)
			defer { decoder.codingPath.removeLast() }
			
			guard let value = try decoder.unbox(entry, as: type) else {
				throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Expected \(type) value but found null instead."))
			}
			
			return value
		}
		
		func decode(_ type: UInt64.Type, forKey key: Key) throws -> UInt64 {
			guard let entry = container[key.stringValue] else {
				throw DecodingError.keyNotFound(key, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "No value associated with key \(_errorDescription(of: key))."))
			}
			
			decoder.codingPath.append(key)
			defer { decoder.codingPath.removeLast() }
			
			guard let value = try decoder.unbox(entry, as: type) else {
				throw DecodingError.valueNotFound(type, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Expected \(type) value but found null instead."))
			}
			
			return value
		}
		
		func decode<T>(_ type: T.Type, forKey key: Key) throws -> T where T: Decodable {
			fatalError()
		}
		
		func nestedContainer<NestedKey>(keyedBy type: NestedKey.Type, forKey key: Key) throws -> KeyedDecodingContainer<NestedKey> where NestedKey: CodingKey {
			fatalError()
		}
		
		func nestedUnkeyedContainer(forKey key: Key) throws -> UnkeyedDecodingContainer {
			fatalError()
		}
		
		func superDecoder() throws -> Decoder {
			fatalError()
		}
		
		func superDecoder(forKey key: Key) throws -> Decoder {
			fatalError()
		}
	}
}
