//
//  File.swift
//  
//
//  Created by Geoffrey Foster on 2019-07-07.
//

import Foundation

extension _NSObjectDecoder {
	func unbox<T>(_ value: Any, as type: T.Type) throws -> Bool? {
		guard !(value is NSNull) else { return nil }
		
		if let number = value as? NSNumber {
			// TODO: Add a flag to coerce non-boolean numbers into Bools?
			if number === kCFBooleanTrue as NSNumber {
				return true
			} else if number === kCFBooleanFalse as NSNumber {
				return false
			}
			
			/* FIXME: If swift-corelibs-foundation doesn't change to use NSNumber, this code path will need to be included and tested:
			} else if let bool = value as? Bool {
			return bool
			*/
			
		}
		
		throw DecodingError._typeMismatch(at: self.codingPath, expectation: type, reality: value)
	}
	
	func unbox(_ value: Any, as type: Int.Type) throws -> Int? {
		guard !(value is NSNull) else { return nil }
		
		guard let number = value as? NSNumber, number !== kCFBooleanTrue, number !== kCFBooleanFalse else {
			throw DecodingError._typeMismatch(at: self.codingPath, expectation: type, reality: value)
		}
		
		let int = number.intValue
		guard NSNumber(value: int) == number else {
			throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: self.codingPath, debugDescription: "Parsed JSON number <\(number)> does not fit in \(type)."))
		}
		
		return int
	}
	
	func unbox(_ value: Any, as type: Int8.Type) throws -> Int8? {
		guard !(value is NSNull) else { return nil }
		
		guard let number = value as? NSNumber, number !== kCFBooleanTrue, number !== kCFBooleanFalse else {
			throw DecodingError._typeMismatch(at: self.codingPath, expectation: type, reality: value)
		}
		
		let int8 = number.int8Value
		guard NSNumber(value: int8) == number else {
			throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: self.codingPath, debugDescription: "Parsed JSON number <\(number)> does not fit in \(type)."))
		}
		
		return int8
	}
	
	func unbox(_ value: Any, as type: Int16.Type) throws -> Int16? {
		guard !(value is NSNull) else { return nil }
		
		guard let number = value as? NSNumber, number !== kCFBooleanTrue, number !== kCFBooleanFalse else {
			throw DecodingError._typeMismatch(at: self.codingPath, expectation: type, reality: value)
		}
		
		let int16 = number.int16Value
		guard NSNumber(value: int16) == number else {
			throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: self.codingPath, debugDescription: "Parsed JSON number <\(number)> does not fit in \(type)."))
		}
		
		return int16
	}
	
	func unbox(_ value: Any, as type: Int32.Type) throws -> Int32? {
		guard !(value is NSNull) else { return nil }
		
		guard let number = value as? NSNumber, number !== kCFBooleanTrue, number !== kCFBooleanFalse else {
			throw DecodingError._typeMismatch(at: self.codingPath, expectation: type, reality: value)
		}
		
		let int32 = number.int32Value
		guard NSNumber(value: int32) == number else {
			throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: self.codingPath, debugDescription: "Parsed JSON number <\(number)> does not fit in \(type)."))
		}
		
		return int32
	}
	
	func unbox(_ value: Any, as type: Int64.Type) throws -> Int64? {
		guard !(value is NSNull) else { return nil }
		
		guard let number = value as? NSNumber, number !== kCFBooleanTrue, number !== kCFBooleanFalse else {
			throw DecodingError._typeMismatch(at: self.codingPath, expectation: type, reality: value)
		}
		
		let int64 = number.int64Value
		guard NSNumber(value: int64) == number else {
			throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: self.codingPath, debugDescription: "Parsed JSON number <\(number)> does not fit in \(type)."))
		}
		
		return int64
	}
	
	func unbox(_ value: Any, as type: UInt.Type) throws -> UInt? {
		guard !(value is NSNull) else { return nil }
		
		guard let number = value as? NSNumber, number !== kCFBooleanTrue, number !== kCFBooleanFalse else {
			throw DecodingError._typeMismatch(at: self.codingPath, expectation: type, reality: value)
		}
		
		let uint = number.uintValue
		guard NSNumber(value: uint) == number else {
			throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: self.codingPath, debugDescription: "Parsed JSON number <\(number)> does not fit in \(type)."))
		}
		
		return uint
	}
	
	func unbox(_ value: Any, as type: UInt8.Type) throws -> UInt8? {
		guard !(value is NSNull) else { return nil }
		
		guard let number = value as? NSNumber, number !== kCFBooleanTrue, number !== kCFBooleanFalse else {
			throw DecodingError._typeMismatch(at: self.codingPath, expectation: type, reality: value)
		}
		
		let uint8 = number.uint8Value
		guard NSNumber(value: uint8) == number else {
			throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: self.codingPath, debugDescription: "Parsed JSON number <\(number)> does not fit in \(type)."))
		}
		
		return uint8
	}
	
	func unbox(_ value: Any, as type: UInt16.Type) throws -> UInt16? {
		guard !(value is NSNull) else { return nil }
		
		guard let number = value as? NSNumber, number !== kCFBooleanTrue, number !== kCFBooleanFalse else {
			throw DecodingError._typeMismatch(at: self.codingPath, expectation: type, reality: value)
		}
		
		let uint16 = number.uint16Value
		guard NSNumber(value: uint16) == number else {
			throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: self.codingPath, debugDescription: "Parsed JSON number <\(number)> does not fit in \(type)."))
		}
		
		return uint16
	}
	
	func unbox(_ value: Any, as type: UInt32.Type) throws -> UInt32? {
		guard !(value is NSNull) else { return nil }
		
		guard let number = value as? NSNumber, number !== kCFBooleanTrue, number !== kCFBooleanFalse else {
			throw DecodingError._typeMismatch(at: self.codingPath, expectation: type, reality: value)
		}
		
		let uint32 = number.uint32Value
		guard NSNumber(value: uint32) == number else {
			throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: self.codingPath, debugDescription: "Parsed JSON number <\(number)> does not fit in \(type)."))
		}
		
		return uint32
	}
	
	func unbox(_ value: Any, as type: UInt64.Type) throws -> UInt64? {
		guard !(value is NSNull) else { return nil }
		
		guard let number = value as? NSNumber, number !== kCFBooleanTrue, number !== kCFBooleanFalse else {
			throw DecodingError._typeMismatch(at: self.codingPath, expectation: type, reality: value)
		}
		
		let uint64 = number.uint64Value
		guard NSNumber(value: uint64) == number else {
			throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: self.codingPath, debugDescription: "Parsed JSON number <\(number)> does not fit in \(type)."))
		}
		
		return uint64
	}
	
	func unbox(_ value: Any, as type: Float.Type) throws -> Float? {
		guard !(value is NSNull) else { return nil }
		
//		if let number = value as? NSNumber, number !== kCFBooleanTrue, number !== kCFBooleanFalse {
//			// We are willing to return a Float by losing precision:
//			// * If the original value was integral,
//			//   * and the integral value was > Float.greatestFiniteMagnitude, we will fail
//			//   * and the integral value was <= Float.greatestFiniteMagnitude, we are willing to lose precision past 2^24
//			// * If it was a Float, you will get back the precise value
//			// * If it was a Double or Decimal, you will get back the nearest approximation if it will fit
//			let double = number.doubleValue
//			guard abs(double) <= Double(Float.greatestFiniteMagnitude) else {
//				throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: self.codingPath, debugDescription: "Parsed JSON number \(number) does not fit in \(type)."))
//			}
//
//			return Float(double)
//
//			/* FIXME: If swift-corelibs-foundation doesn't change to use NSNumber, this code path will need to be included and tested:
//			} else if let double = value as? Double {
//			if abs(double) <= Double(Float.max) {
//			return Float(double)
//			}
//			overflow = true
//			} else if let int = value as? Int {
//			if let float = Float(exactly: int) {
//			return float
//			}
//			overflow = true
//			*/
//
//		} else if let string = value as? String,
//			case .convertFromString(let posInfString, let negInfString, let nanString) = self.options.nonConformingFloatDecodingStrategy {
//			if string == posInfString {
//				return Float.infinity
//			} else if string == negInfString {
//				return -Float.infinity
//			} else if string == nanString {
//				return Float.nan
//			}
//		}
		
		throw DecodingError._typeMismatch(at: self.codingPath, expectation: type, reality: value)
	}
	
	func unbox(_ value: Any, as type: Double.Type) throws -> Double? {
		guard !(value is NSNull) else { return nil }
		
//		if let number = value as? NSNumber, number !== kCFBooleanTrue, number !== kCFBooleanFalse {
//			// We are always willing to return the number as a Double:
//			// * If the original value was integral, it is guaranteed to fit in a Double; we are willing to lose precision past 2^53 if you encoded a UInt64 but requested a Double
//			// * If it was a Float or Double, you will get back the precise value
//			// * If it was Decimal, you will get back the nearest approximation
//			return number.doubleValue
//			
//			/* FIXME: If swift-corelibs-foundation doesn't change to use NSNumber, this code path will need to be included and tested:
//			} else if let double = value as? Double {
//			return double
//			} else if let int = value as? Int {
//			if let double = Double(exactly: int) {
//			return double
//			}
//			overflow = true
//			*/
//			
//		} else if let string = value as? String,
//			case .convertFromString(let posInfString, let negInfString, let nanString) = self.options.nonConformingFloatDecodingStrategy {
//			if string == posInfString {
//				return Double.infinity
//			} else if string == negInfString {
//				return -Double.infinity
//			} else if string == nanString {
//				return Double.nan
//			}
//		}
		
		throw DecodingError._typeMismatch(at: self.codingPath, expectation: type, reality: value)
	}
	
	func unbox(_ value: Any, as type: String.Type) throws -> String? {
		guard !(value is NSNull) else { return nil }
		
		guard let string = value as? String else {
			throw DecodingError._typeMismatch(at: self.codingPath, expectation: type, reality: value)
		}
		
		return string
	}
}
