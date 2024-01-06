//
//  TypeIdentifiers.swift
//
//
//  Created by the Daydream Compiler on 2023-12-22 19:41:33 +0000.
//

import Foundation

import BigNumber
import Datable
import SwiftHexTools

extension Data
{
    public func popVarint() -> (BInt, Data)?
    {
        var working: Data = data

        guard working.count > 0 else
        {
            return nil
        }

        guard let firstByte = working.first else
        {
            return nil
        }
        working = working.dropFirst()

        let count = Int(firstByte)

        guard working.count >= count else
        {
            return nil
        }

        let next: Data
        if count == 1
        {
            guard let first = working.first else
            {
                return nil
            }

            next = Data(array: [first])

            working = working.dropFirst()
        }
        else
        {
            next = Data(working[0..<count])
            working = Data(working[count...])
        }

        let varintBytes = Data(array: [firstByte] + next)
        guard let bint = BInt(varint: varintBytes) else
        {
            return nil
        }

        return (bint, working)
    }

    public func popLength() -> (Int, Data)?
    {
        guard let (bint, rest) = self.popVarint() else
        {
            return nil
        }

        guard let int = bint.asInt() else
        {
            return nil
        }

        return (int, rest)
    }

    public func popLengthAndSlice() -> (Data, Data)?
    {
        guard let (length, rest) = self.popLength() else
        {
            return nil
        }

        guard length <= rest.count else
        {
            return nil
        }

        let head = Data(rest[0..<length])
        let tail = Data(rest[length...])

        return (head, tail)
    }

    public func pushVarint(bint: BInt) -> Data
    {
        return bint.varint + self
    }

    public func pushLength() -> Data
    {
        let bint = BInt(self.count)
        return self.pushVarint(bint: bint)
    }
}

public enum TypeIdentifiers: Int
{
    public var varint: Data
    {
        let bint = BInt(self.rawValue)
        return bint.varint
    }

    public init?(varint: Data)
    {
        guard let bint = BInt(varint: varint) else
        {
            return nil
        }

        guard let int = bint.asInt() else
        {
            return nil
        }

        self.init(rawValue: int)
    }

    case SingletonType = 1
    case BooleanType = 4
    case DatumType = 5
    case EnumType = 6
    case FailureType = 7
    case FalseType = 8
    case GeneralFailureType = 9
    case IdentifierType = 10
    case LengthType = 11
    case ListType = 12
    case ListNaturalType = 13
    case MaybeFailureType = 14
    case MessageType = 15
    case NaturalType = 16
    case NothingType = 17
    case RecordType = 18
    case RequestType = 19
    case RequestIDType = 20
    case ResponseType = 21
    case TrueType = 22
    case VarintType = 23
    case isRunning_requestType = 24
    case isRunning_responseType = 25
    case load_requestType = 26
    case load_responseType = 27
    case pause_requestType = 28
    case pause_responseType = 29
    case resume_requestType = 30
    case resume_responseType = 31
    case run_requestType = 32
    case run_responseType = 33
    case stop_requestType = 34
    case stop_responseType = 35
}

public enum Value: Equatable, Codable
{
    case Boolean(BooleanValue)
    case Datum(DatumValue)
    case Enum
    case Failure(FailureValue)
    case False
    case GeneralFailure
    case Identifier(IdentifierValue)
    case Length(LengthValue)
    case List
    case ListNatural([NaturalValue])
    case MaybeFailure(MaybeFailureValue)
    case Message(MessageValue)
    case Natural(NaturalValue)
    case Nothing
    case Record
    case Request(RequestValue)
    case RequestID(RequestIDValue)
    case Response(ResponseValue)
    case True
    case Varint(BInt)
    case isRunning_request(isRunning_requestValue)
    case isRunning_response(isRunning_responseValue)
    case load_request(load_requestValue)
    case load_response(load_responseValue)
    case pause_request(pause_requestValue)
    case pause_response(pause_responseValue)
    case resume_request(resume_requestValue)
    case resume_response(resume_responseValue)
    case run_request(run_requestValue)
    case run_response(run_responseValue)
    case stop_request(stop_requestValue)
    case stop_response(stop_responseValue)
}

public enum BooleanValue: Equatable, Codable
{
    public var data: Data
    {
        switch self
        {
            case .True:
                return TypeIdentifiers.TrueType.varint

            case .False:
                return TypeIdentifiers.FalseType.varint
        }
    }

    public init?(data: Data)
    {
        guard let (bint, rest) = data.popVarint() else
        {
            return nil
        }

        guard let int = bint.asInt() else
        {
            return nil
        }

        guard let type = TypeIdentifiers(rawValue: int) else
        {
            return nil
        }

        switch type
        {
            case .TrueType:
                self = .True

            case .FalseType:
                self = .False

            default:
                return nil
        }
    }

    case True
    case False
}

public struct DatumValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data.pushLength() + self.field2.data.pushLength()
    }

    // Public Fields
    public let field1: LengthValue
    public let field2: [NaturalValue]

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let (payload1, rest1) = working.popLengthAndSlice() else
        {
            return nil
        }

        guard let fieldValue1 = LengthValue(data: payload1) else
        {
            return nil
        }

        self.field1 = fieldValue1
        working = rest1

        guard let (payload2, rest2) = working.popLengthAndSlice() else
        {
            return nil
        }

        guard let fieldValue2 = [NaturalValue](data: payload2) else
        {
            return nil
        }

        self.field2 = fieldValue2
        working = rest2
    }

    public init(_ field1: LengthValue, _ field2: [NaturalValue])
    {
        self.field1 = field1
        self.field2 = field2
    }
}

public enum FailureValue: Equatable, Codable
{
    public var data: Data
    {
        switch self
        {
            case .GeneralFailure:
                return TypeIdentifiers.GeneralFailureType.varint
        }
    }

    public init?(data: Data)
    {
        guard let (bint, rest) = data.popVarint() else
        {
            return nil
        }

        guard let int = bint.asInt() else
        {
            return nil
        }

        guard let type = TypeIdentifiers(rawValue: int) else
        {
            return nil
        }

        switch type
        {
            case .GeneralFailureType:
                self = .GeneralFailure

            default:
                return nil
        }
    }

    case GeneralFailure
}

public struct IdentifierValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data
    }

    // Public Fields
    public let field1: NaturalValue

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let fieldValue = NaturalValue(data: working) else
        {
            return nil
        }

        self.field1 = fieldValue
        working = Data()
    }

    public init(_ field1: NaturalValue)
    {
        self.field1 = field1
    }
}

public struct LengthValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data
    }

    // Public Fields
    public let field1: NaturalValue

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let fieldValue = NaturalValue(data: working) else
        {
            return nil
        }

        self.field1 = fieldValue
        working = Data()
    }

    public init(_ field1: NaturalValue)
    {
        self.field1 = field1
    }
}

extension [NaturalValue]
{
    public var data: Data
    {
        var result: Data = Data()
        result.append(TypeIdentifiers.ListNaturalType.varint)
        result.append(BInt(self.count).varint)

        for item in self
        {
            result.append(item.data)
        }

        return result
    }

    public init?(data: Data)
    {
        var results: [NaturalValue] = []
        var working = data

        while working.count > 0
        {
            guard let (valueData, rest) = working.popLengthAndSlice() else
            {
                self = results
                return
            }

            guard let value = NaturalValue(data: valueData) else
            {
                return nil
            }

            results.append(value)
            working = rest
        }

        self = results
    }
}

public enum MaybeFailureValue: Equatable, Codable
{
    public var data: Data
    {
        switch self
        {
            case .Failure(let subtype):
                return TypeIdentifiers.FailureType.varint + subtype.data

            case .Nothing:
                return TypeIdentifiers.NothingType.varint
        }
    }

    public init?(data: Data)
    {
        guard let (bint, rest) = data.popVarint() else
        {
            return nil
        }

        guard let int = bint.asInt() else
        {
            return nil
        }

        guard let type = TypeIdentifiers(rawValue: int) else
        {
            return nil
        }

        switch type
        {
            case .FailureType:
                guard let value = FailureValue(data: rest) else
                {
                    return nil
                }

                self = .Failure(value)
                return

            case .NothingType:
                self = .Nothing

            default:
                return nil
        }
    }

    case Failure(FailureValue)
    case Nothing
}

public enum MessageValue: Equatable, Codable
{
    public var data: Data
    {
        switch self
        {
            case .Request(let subtype):
                return TypeIdentifiers.RequestType.varint + subtype.data

            case .Response(let subtype):
                return TypeIdentifiers.ResponseType.varint + subtype.data
        }
    }

    public init?(data: Data)
    {
        guard let (bint, rest) = data.popVarint() else
        {
            return nil
        }

        guard let int = bint.asInt() else
        {
            return nil
        }

        guard let type = TypeIdentifiers(rawValue: int) else
        {
            return nil
        }

        switch type
        {
            case .RequestType:
                guard let value = RequestValue(data: rest) else
                {
                    return nil
                }

                self = .Request(value)
                return

            case .ResponseType:
                guard let value = ResponseValue(data: rest) else
                {
                    return nil
                }

                self = .Response(value)
                return

            default:
                return nil
        }
    }

    case Request(RequestValue)
    case Response(ResponseValue)
}

public struct NaturalValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.varint
    }

    // Public Fields
    public let field1: BInt

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let fieldValue = BInt(varint: working) else
        {
            return nil
        }

        self.field1 = fieldValue
        working = Data()
    }

    public init(_ field1: BInt)
    {
        self.field1 = field1
    }
}

public enum RequestValue: Equatable, Codable
{
    public var data: Data
    {
        switch self
        {
            case .load_request(let subtype):
                return TypeIdentifiers.load_requestType.varint + subtype.data

            case .run_request(let subtype):
                return TypeIdentifiers.run_requestType.varint + subtype.data

            case .isRunning_request(let subtype):
                return TypeIdentifiers.isRunning_requestType.varint + subtype.data

            case .pause_request(let subtype):
                return TypeIdentifiers.pause_requestType.varint + subtype.data

            case .resume_request(let subtype):
                return TypeIdentifiers.resume_requestType.varint + subtype.data

            case .stop_request(let subtype):
                return TypeIdentifiers.stop_requestType.varint + subtype.data
        }
    }

    public init?(data: Data)
    {
        guard let (bint, rest) = data.popVarint() else
        {
            return nil
        }

        guard let int = bint.asInt() else
        {
            return nil
        }

        guard let type = TypeIdentifiers(rawValue: int) else
        {
            return nil
        }

        switch type
        {
            case .load_requestType:
                guard let value = load_requestValue(data: rest) else
                {
                    return nil
                }

                self = .load_request(value)
                return

            case .run_requestType:
                guard let value = run_requestValue(data: rest) else
                {
                    return nil
                }

                self = .run_request(value)
                return

            case .isRunning_requestType:
                guard let value = isRunning_requestValue(data: rest) else
                {
                    return nil
                }

                self = .isRunning_request(value)
                return

            case .pause_requestType:
                guard let value = pause_requestValue(data: rest) else
                {
                    return nil
                }

                self = .pause_request(value)
                return

            case .resume_requestType:
                guard let value = resume_requestValue(data: rest) else
                {
                    return nil
                }

                self = .resume_request(value)
                return

            case .stop_requestType:
                guard let value = stop_requestValue(data: rest) else
                {
                    return nil
                }

                self = .stop_request(value)
                return

            default:
                return nil
        }
    }

    case load_request(load_requestValue)
    case run_request(run_requestValue)
    case isRunning_request(isRunning_requestValue)
    case pause_request(pause_requestValue)
    case resume_request(resume_requestValue)
    case stop_request(stop_requestValue)
}

public struct RequestIDValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data
    }

    // Public Fields
    public let field1: IdentifierValue

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let fieldValue = IdentifierValue(data: working) else
        {
            return nil
        }

        self.field1 = fieldValue
        working = Data()
    }

    public init(_ field1: IdentifierValue)
    {
        self.field1 = field1
    }
}

public enum ResponseValue: Equatable, Codable
{
    public var data: Data
    {
        switch self
        {
            case .load_response(let subtype):
                return TypeIdentifiers.load_responseType.varint + subtype.data

            case .run_response(let subtype):
                return TypeIdentifiers.run_responseType.varint + subtype.data

            case .isRunning_response(let subtype):
                return TypeIdentifiers.isRunning_responseType.varint + subtype.data

            case .pause_response(let subtype):
                return TypeIdentifiers.pause_responseType.varint + subtype.data

            case .resume_response(let subtype):
                return TypeIdentifiers.resume_responseType.varint + subtype.data

            case .stop_response(let subtype):
                return TypeIdentifiers.stop_responseType.varint + subtype.data
        }
    }

    public init?(data: Data)
    {
        guard let (bint, rest) = data.popVarint() else
        {
            return nil
        }

        guard let int = bint.asInt() else
        {
            return nil
        }

        guard let type = TypeIdentifiers(rawValue: int) else
        {
            return nil
        }

        switch type
        {
            case .load_responseType:
                guard let value = load_responseValue(data: rest) else
                {
                    return nil
                }

                self = .load_response(value)
                return

            case .run_responseType:
                guard let value = run_responseValue(data: rest) else
                {
                    return nil
                }

                self = .run_response(value)
                return

            case .isRunning_responseType:
                guard let value = isRunning_responseValue(data: rest) else
                {
                    return nil
                }

                self = .isRunning_response(value)
                return

            case .pause_responseType:
                guard let value = pause_responseValue(data: rest) else
                {
                    return nil
                }

                self = .pause_response(value)
                return

            case .resume_responseType:
                guard let value = resume_responseValue(data: rest) else
                {
                    return nil
                }

                self = .resume_response(value)
                return

            case .stop_responseType:
                guard let value = stop_responseValue(data: rest) else
                {
                    return nil
                }

                self = .stop_response(value)
                return

            default:
                return nil
        }
    }

    case load_response(load_responseValue)
    case run_response(run_responseValue)
    case isRunning_response(isRunning_responseValue)
    case pause_response(pause_responseValue)
    case resume_response(resume_responseValue)
    case stop_response(stop_responseValue)
}

public struct isRunning_requestValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data
    }

    // Public Fields
    public let field1: RequestIDValue

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let fieldValue = RequestIDValue(data: working) else
        {
            return nil
        }

        self.field1 = fieldValue
        working = Data()
    }

    public init(_ field1: RequestIDValue)
    {
        self.field1 = field1
    }
}

public struct isRunning_responseValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data.pushLength() + self.field2.data.pushLength()
    }

    // Public Fields
    public let field1: RequestIDValue
    public let field2: BooleanValue

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let (payload1, rest1) = working.popLengthAndSlice() else
        {
            return nil
        }

        guard let fieldValue1 = RequestIDValue(data: payload1) else
        {
            return nil
        }

        self.field1 = fieldValue1
        working = rest1

        guard let (payload2, rest2) = working.popLengthAndSlice() else
        {
            return nil
        }

        guard let fieldValue2 = BooleanValue(data: payload2) else
        {
            return nil
        }

        self.field2 = fieldValue2
        working = rest2
    }

    public init(_ field1: RequestIDValue, _ field2: BooleanValue)
    {
        self.field1 = field1
        self.field2 = field2
    }
}

public struct load_requestValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data.pushLength() + self.field2.data.pushLength()
    }

    // Public Fields
    public let field1: RequestIDValue
    public let field2: DatumValue

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let (payload1, rest1) = working.popLengthAndSlice() else
        {
            return nil
        }

        guard let fieldValue1 = RequestIDValue(data: payload1) else
        {
            return nil
        }

        self.field1 = fieldValue1
        working = rest1

        guard let (payload2, rest2) = working.popLengthAndSlice() else
        {
            return nil
        }

        guard let fieldValue2 = DatumValue(data: payload2) else
        {
            return nil
        }

        self.field2 = fieldValue2
        working = rest2
    }

    public init(_ field1: RequestIDValue, _ field2: DatumValue)
    {
        self.field1 = field1
        self.field2 = field2
    }
}

public struct load_responseValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data.pushLength() + self.field2.data.pushLength()
    }

    // Public Fields
    public let field1: RequestIDValue
    public let field2: MaybeFailureValue

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let (payload1, rest1) = working.popLengthAndSlice() else
        {
            return nil
        }

        guard let fieldValue1 = RequestIDValue(data: payload1) else
        {
            return nil
        }

        self.field1 = fieldValue1
        working = rest1

        guard let (payload2, rest2) = working.popLengthAndSlice() else
        {
            return nil
        }

        guard let fieldValue2 = MaybeFailureValue(data: payload2) else
        {
            return nil
        }

        self.field2 = fieldValue2
        working = rest2
    }

    public init(_ field1: RequestIDValue, _ field2: MaybeFailureValue)
    {
        self.field1 = field1
        self.field2 = field2
    }
}

public struct pause_requestValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data
    }

    // Public Fields
    public let field1: RequestIDValue

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let fieldValue = RequestIDValue(data: working) else
        {
            return nil
        }

        self.field1 = fieldValue
        working = Data()
    }

    public init(_ field1: RequestIDValue)
    {
        self.field1 = field1
    }
}

public struct pause_responseValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data.pushLength() + self.field2.data.pushLength()
    }

    // Public Fields
    public let field1: RequestIDValue
    public let field2: MaybeFailureValue

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let (payload1, rest1) = working.popLengthAndSlice() else
        {
            return nil
        }

        guard let fieldValue1 = RequestIDValue(data: payload1) else
        {
            return nil
        }

        self.field1 = fieldValue1
        working = rest1

        guard let (payload2, rest2) = working.popLengthAndSlice() else
        {
            return nil
        }

        guard let fieldValue2 = MaybeFailureValue(data: payload2) else
        {
            return nil
        }

        self.field2 = fieldValue2
        working = rest2
    }

    public init(_ field1: RequestIDValue, _ field2: MaybeFailureValue)
    {
        self.field1 = field1
        self.field2 = field2
    }
}

public struct resume_requestValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data
    }

    // Public Fields
    public let field1: RequestIDValue

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let fieldValue = RequestIDValue(data: working) else
        {
            return nil
        }

        self.field1 = fieldValue
        working = Data()
    }

    public init(_ field1: RequestIDValue)
    {
        self.field1 = field1
    }
}

public struct resume_responseValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data.pushLength() + self.field2.data.pushLength()
    }

    // Public Fields
    public let field1: RequestIDValue
    public let field2: MaybeFailureValue

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let (payload1, rest1) = working.popLengthAndSlice() else
        {
            return nil
        }

        guard let fieldValue1 = RequestIDValue(data: payload1) else
        {
            return nil
        }

        self.field1 = fieldValue1
        working = rest1

        guard let (payload2, rest2) = working.popLengthAndSlice() else
        {
            return nil
        }

        guard let fieldValue2 = MaybeFailureValue(data: payload2) else
        {
            return nil
        }

        self.field2 = fieldValue2
        working = rest2
    }

    public init(_ field1: RequestIDValue, _ field2: MaybeFailureValue)
    {
        self.field1 = field1
        self.field2 = field2
    }
}

public struct run_requestValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data
    }

    // Public Fields
    public let field1: RequestIDValue

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let fieldValue = RequestIDValue(data: working) else
        {
            return nil
        }

        self.field1 = fieldValue
        working = Data()
    }

    public init(_ field1: RequestIDValue)
    {
        self.field1 = field1
    }
}

public struct run_responseValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data.pushLength() + self.field2.data.pushLength()
    }

    // Public Fields
    public let field1: RequestIDValue
    public let field2: MaybeFailureValue

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let (payload1, rest1) = working.popLengthAndSlice() else
        {
            return nil
        }

        guard let fieldValue1 = RequestIDValue(data: payload1) else
        {
            return nil
        }

        self.field1 = fieldValue1
        working = rest1

        guard let (payload2, rest2) = working.popLengthAndSlice() else
        {
            return nil
        }

        guard let fieldValue2 = MaybeFailureValue(data: payload2) else
        {
            return nil
        }

        self.field2 = fieldValue2
        working = rest2
    }

    public init(_ field1: RequestIDValue, _ field2: MaybeFailureValue)
    {
        self.field1 = field1
        self.field2 = field2
    }
}

public struct stop_requestValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data
    }

    // Public Fields
    public let field1: RequestIDValue

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let fieldValue = RequestIDValue(data: working) else
        {
            return nil
        }

        self.field1 = fieldValue
        working = Data()
    }

    public init(_ field1: RequestIDValue)
    {
        self.field1 = field1
    }
}

public struct stop_responseValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data.pushLength() + self.field2.data.pushLength()
    }

    // Public Fields
    public let field1: RequestIDValue
    public let field2: MaybeFailureValue

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let (payload1, rest1) = working.popLengthAndSlice() else
        {
            return nil
        }

        guard let fieldValue1 = RequestIDValue(data: payload1) else
        {
            return nil
        }

        self.field1 = fieldValue1
        working = rest1

        guard let (payload2, rest2) = working.popLengthAndSlice() else
        {
            return nil
        }

        guard let fieldValue2 = MaybeFailureValue(data: payload2) else
        {
            return nil
        }

        self.field2 = fieldValue2
        working = rest2
    }

    public init(_ field1: RequestIDValue, _ field2: MaybeFailureValue)
    {
        self.field1 = field1
        self.field2 = field2
    }
}

extension Value
{
    public var data: Data
    {
        switch self
        {
            case .Boolean(let subtype):
                let typeData = TypeIdentifiers.BooleanType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .Datum(let subtype):
                let typeData = TypeIdentifiers.DatumType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .Enum:
                let typeData = TypeIdentifiers.EnumType.varint
                return typeData

            case .Failure(let subtype):
                let typeData = TypeIdentifiers.FailureType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .False:
                let typeData = TypeIdentifiers.FalseType.varint
                return typeData

            case .GeneralFailure:
                let typeData = TypeIdentifiers.GeneralFailureType.varint
                return typeData

            case .Identifier(let subtype):
                let typeData = TypeIdentifiers.IdentifierType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .Length(let subtype):
                let typeData = TypeIdentifiers.LengthType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .List:
                let typeData = TypeIdentifiers.ListType.varint
                return typeData

            case .ListNatural:
                return self.data.pushLength()

            case .MaybeFailure(let subtype):
                let typeData = TypeIdentifiers.MaybeFailureType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .Message(let subtype):
                let typeData = TypeIdentifiers.MessageType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .Natural(let subtype):
                let typeData = TypeIdentifiers.NaturalType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .Nothing:
                let typeData = TypeIdentifiers.NothingType.varint
                return typeData

            case .Record:
                let typeData = TypeIdentifiers.RecordType.varint
                return typeData

            case .Request(let subtype):
                let typeData = TypeIdentifiers.RequestType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .RequestID(let subtype):
                let typeData = TypeIdentifiers.RequestIDType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .Response(let subtype):
                let typeData = TypeIdentifiers.ResponseType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .True:
                let typeData = TypeIdentifiers.TrueType.varint
                return typeData

            case .Varint(let bignum):
                let typeData = TypeIdentifiers.VarintType.varint
                let valueData = bignum.varint
                return typeData + valueData

            case .isRunning_request(let subtype):
                let typeData = TypeIdentifiers.isRunning_requestType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .isRunning_response(let subtype):
                let typeData = TypeIdentifiers.isRunning_responseType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .load_request(let subtype):
                let typeData = TypeIdentifiers.load_requestType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .load_response(let subtype):
                let typeData = TypeIdentifiers.load_responseType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .pause_request(let subtype):
                let typeData = TypeIdentifiers.pause_requestType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .pause_response(let subtype):
                let typeData = TypeIdentifiers.pause_responseType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .resume_request(let subtype):
                let typeData = TypeIdentifiers.resume_requestType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .resume_response(let subtype):
                let typeData = TypeIdentifiers.resume_responseType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .run_request(let subtype):
                let typeData = TypeIdentifiers.run_requestType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .run_response(let subtype):
                let typeData = TypeIdentifiers.run_responseType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .stop_request(let subtype):
                let typeData = TypeIdentifiers.stop_requestType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .stop_response(let subtype):
                let typeData = TypeIdentifiers.stop_responseType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData
        }
    }

    public init?(data: Data)
    {
        guard let (bint, working) = data.popVarint() else
        {
            return nil
        }

        guard let int = bint.asInt() else
        {
            return nil
        }

        guard let type = TypeIdentifiers(rawValue: int) else
        {
            return nil
        }

        switch type
        {
            case .BooleanType:
                guard let subtype = BooleanValue(data: working) else
                {
                    return nil
                }
                self = .Boolean(subtype)

            case .DatumType:
                guard let subtype = DatumValue(data: working) else
                {
                    return nil
                }
                self = .Datum(subtype)

            case .EnumType:
                self = .Enum

            case .FailureType:
                guard let subtype = FailureValue(data: working) else
                {
                    return nil
                }
                self = .Failure(subtype)

            case .FalseType:
                self = .False

            case .GeneralFailureType:
                self = .GeneralFailure

            case .IdentifierType:
                guard let subtype = IdentifierValue(data: working) else
                {
                    return nil
                }
                self = .Identifier(subtype)

            case .LengthType:
                guard let subtype = LengthValue(data: working) else
                {
                    return nil
                }
                self = .Length(subtype)

            case .ListType:
                self = .List

                guard let subtype = [NaturalValue](data: working) else
                {
                    return nil
                }
                self = .ListNatural(subtype)

            case .MaybeFailureType:
                guard let subtype = MaybeFailureValue(data: working) else
                {
                    return nil
                }
                self = .MaybeFailure(subtype)

            case .MessageType:
                guard let subtype = MessageValue(data: working) else
                {
                    return nil
                }
                self = .Message(subtype)

            case .NaturalType:
                guard let subtype = NaturalValue(data: working) else
                {
                    return nil
                }
                self = .Natural(subtype)

            case .NothingType:
                self = .Nothing

            case .RecordType:
                self = .Record

            case .RequestType:
                guard let subtype = RequestValue(data: working) else
                {
                    return nil
                }
                self = .Request(subtype)

            case .RequestIDType:
                guard let subtype = RequestIDValue(data: working) else
                {
                    return nil
                }
                self = .RequestID(subtype)

            case .ResponseType:
                guard let subtype = ResponseValue(data: working) else
                {
                    return nil
                }
                self = .Response(subtype)

            case .TrueType:
                self = .True

            case .VarintType:
                guard let bignum = BInt(varint: working) else
                {
                    return nil
                }

                self = .Varint(bignum)

            case .isRunning_requestType:
                guard let subtype = isRunning_requestValue(data: working) else
                {
                    return nil
                }
                self = .isRunning_request(subtype)

            case .isRunning_responseType:
                guard let subtype = isRunning_responseValue(data: working) else
                {
                    return nil
                }
                self = .isRunning_response(subtype)

            case .load_requestType:
                guard let subtype = load_requestValue(data: working) else
                {
                    return nil
                }
                self = .load_request(subtype)

            case .load_responseType:
                guard let subtype = load_responseValue(data: working) else
                {
                    return nil
                }
                self = .load_response(subtype)

            case .pause_requestType:
                guard let subtype = pause_requestValue(data: working) else
                {
                    return nil
                }
                self = .pause_request(subtype)

            case .pause_responseType:
                guard let subtype = pause_responseValue(data: working) else
                {
                    return nil
                }
                self = .pause_response(subtype)

            case .resume_requestType:
                guard let subtype = resume_requestValue(data: working) else
                {
                    return nil
                }
                self = .resume_request(subtype)

            case .resume_responseType:
                guard let subtype = resume_responseValue(data: working) else
                {
                    return nil
                }
                self = .resume_response(subtype)

            case .run_requestType:
                guard let subtype = run_requestValue(data: working) else
                {
                    return nil
                }
                self = .run_request(subtype)

            case .run_responseType:
                guard let subtype = run_responseValue(data: working) else
                {
                    return nil
                }
                self = .run_response(subtype)

            case .stop_requestType:
                guard let subtype = stop_requestValue(data: working) else
                {
                    return nil
                }
                self = .stop_request(subtype)

            case .stop_responseType:
                guard let subtype = stop_responseValue(data: working) else
                {
                    return nil
                }
                self = .stop_response(subtype)

            default:
                return nil
        }
    }
}