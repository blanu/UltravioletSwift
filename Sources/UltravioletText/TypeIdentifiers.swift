//
//  TypeIdentifiers.swift
//
//
//  Created by the Daydream Compiler on 2024-01-06 17:49:38 +0000.
//

import Foundation

import BigNumber
import Datable
import SwiftHexTools
import Text

extension Bool: MaybeDatable
{
    public var data: Data
    {
        if self
        {
            return UInt8(0).data
        }
        else
        {
            return UInt8(1).data
        }
    }

    public init?(data: Data)
    {
        guard data.count == 1 else
        {
            return nil
        }

        if data.count == 0
        {
            self = false
        }
        else if data.count == 1
        {
            self = true
        }
        else
        {
            return nil
        }
    }
}

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
    case BoolType = 6
    case BooleanType = 7
    case DataType = 8
    case FalseType = 9
    case IntType = 10
    case ListVarintType = 11
    case MutableTextType = 12
    case NothingType = 13
    case StringType = 14
    case TextType = 15
    case TextListType = 16
    case TrueType = 17
    case VarintType = 18
    case becomFirstType = 19
    case becomeType = 20
    case becomeDropFirstType = 21
    case becomeLastType = 22
    case becomeReverseType = 23
    case becomeTrimmedType = 24
    case becomeUppercaseType = 25
    case becomeUppercaseFirstLetterType = 26
    case convertFromBase64Type = 27
    case convertFromHexType = 28
    case convertToBase64Type = 29
    case convertToHexType = 30
    case countType = 31
    case count_returnType = 32
    case dropFirstType = 33
    case dropFirst_returnType = 34
    case fanType = 35
    case fan_returnType = 36
    case firstType = 37
    case first_returnType = 38
    case isEmptyType = 39
    case isEmpty_returnType = 40
    case lastType = 41
    case last_returnType = 42
    case reverseType = 43
    case reverse_returnType = 44
    case toBase64Type = 45
    case toBase64_returnType = 46
    case toHexType = 47
    case toHex_returnType = 48
    case toTextType = 49
    case toText_returnType = 50
    case toUTF8DataType = 51
    case toUTF8Data_returnType = 52
    case toUTF8StringType = 53
    case toUTF8String_returnType = 54
    case trimType = 55
    case trim_returnType = 56
    case uppercaseType = 57
    case uppercaseFirstLetterType = 58
    case uppercaseFirstLetter_returnType = 59
    case uppercase_returnType = 60
}

public enum Value: Equatable, Codable
{
    case BoolBuiltin(Bool)
    case Boolean(BooleanValue)
    case DataBuiltin(Data)
    case False
    case IntBuiltin(Int)
    case ListVarint([BInt])
    case MutableText(MutableTextValue)
    case Nothing
    case StringBuiltin(String)
    case TextBuiltin(Text)
    case TextList([Text])
    case True
    case Varint(BInt)
    case becomFirst
    case become(becomeValue)
    case becomeDropFirst
    case becomeLast
    case becomeReverse
    case becomeTrimmed
    case becomeUppercase
    case becomeUppercaseFirstLetter
    case convertFromBase64
    case convertFromHex
    case convertToBase64
    case convertToHex
    case count(countValue)
    case count_return(count_returnValue)
    case dropFirst(dropFirstValue)
    case dropFirst_return(dropFirst_returnValue)
    case fan(fanValue)
    case fan_return(fan_returnValue)
    case first(firstValue)
    case first_return(first_returnValue)
    case isEmpty(isEmptyValue)
    case isEmpty_return(isEmpty_returnValue)
    case last(lastValue)
    case last_return(last_returnValue)
    case reverse(reverseValue)
    case reverse_return(reverse_returnValue)
    case toBase64(toBase64Value)
    case toBase64_return(toBase64_returnValue)
    case toHex(toHexValue)
    case toHex_return(toHex_returnValue)
    case toText(toTextValue)
    case toText_return(toText_returnValue)
    case toUTF8Data(toUTF8DataValue)
    case toUTF8Data_return(toUTF8Data_returnValue)
    case toUTF8String(toUTF8StringValue)
    case toUTF8String_return(toUTF8String_returnValue)
    case trim(trimValue)
    case trim_return(trim_returnValue)
    case uppercase(uppercaseValue)
    case uppercaseFirstLetter(uppercaseFirstLetterValue)
    case uppercaseFirstLetter_return(uppercaseFirstLetter_returnValue)
    case uppercase_return(uppercase_returnValue)
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
                guard rest.isEmpty else
                {
                    return nil
                }

                self = .True

            case .FalseType:
                guard rest.isEmpty else
                {
                    return nil
                }

                self = .False

            default:
                return nil
        }
    }

    case True
    case False
}

extension [BInt]
{
    public var data: Data
    {
        var result: Data = Data()
        result.append(TypeIdentifiers.ListVarintType.varint)
        result.append(BInt(self.count).varint)

        for item in self
        {
            result.append(item.data)
        }

        return result
    }

    public init?(data: Data)
    {
        var results: [BInt] = []
        var working = data

        while working.count > 0
        {
            guard let (valueData, rest) = working.popLengthAndSlice() else
            {
                self = results
                return
            }

            guard let value = BInt(data: valueData) else
            {
                return nil
            }

            results.append(value)
            working = rest
        }

        self = results
    }
}

public enum MutableTextValue: Equatable, Codable
{
    public var data: Data
    {
        switch self
        {
            case .toUTF8String(let subtype):
                return TypeIdentifiers.toUTF8StringType.varint + subtype.data

            case .toText(let subtype):
                return TypeIdentifiers.toTextType.varint + subtype.data

            case .toUTF8Data(let subtype):
                return TypeIdentifiers.toUTF8DataType.varint + subtype.data

            case .become(let subtype):
                return TypeIdentifiers.becomeType.varint + subtype.data

            case .toHex(let subtype):
                return TypeIdentifiers.toHexType.varint + subtype.data

            case .convertFromHex:
                return TypeIdentifiers.convertFromHexType.varint

            case .convertToHex:
                return TypeIdentifiers.convertToHexType.varint

            case .toBase64(let subtype):
                return TypeIdentifiers.toBase64Type.varint + subtype.data

            case .convertFromBase64:
                return TypeIdentifiers.convertFromBase64Type.varint

            case .convertToBase64:
                return TypeIdentifiers.convertToBase64Type.varint

            case .trim(let subtype):
                return TypeIdentifiers.trimType.varint + subtype.data

            case .becomeTrimmed:
                return TypeIdentifiers.becomeTrimmedType.varint

            case .count(let subtype):
                return TypeIdentifiers.countType.varint + subtype.data

            case .isEmpty(let subtype):
                return TypeIdentifiers.isEmptyType.varint + subtype.data

            case .dropFirst(let subtype):
                return TypeIdentifiers.dropFirstType.varint + subtype.data

            case .becomeDropFirst:
                return TypeIdentifiers.becomeDropFirstType.varint

            case .uppercase(let subtype):
                return TypeIdentifiers.uppercaseType.varint + subtype.data

            case .becomeUppercase:
                return TypeIdentifiers.becomeUppercaseType.varint

            case .uppercaseFirstLetter(let subtype):
                return TypeIdentifiers.uppercaseFirstLetterType.varint + subtype.data

            case .becomeUppercaseFirstLetter:
                return TypeIdentifiers.becomeUppercaseFirstLetterType.varint

            case .first(let subtype):
                return TypeIdentifiers.firstType.varint + subtype.data

            case .becomFirst:
                return TypeIdentifiers.becomFirstType.varint

            case .last(let subtype):
                return TypeIdentifiers.lastType.varint + subtype.data

            case .becomeLast:
                return TypeIdentifiers.becomeLastType.varint

            case .fan(let subtype):
                return TypeIdentifiers.fanType.varint + subtype.data

            case .reverse(let subtype):
                return TypeIdentifiers.reverseType.varint + subtype.data

            case .becomeReverse:
                return TypeIdentifiers.becomeReverseType.varint
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
            case .toUTF8StringType:
                guard let value = toUTF8StringValue(data: rest) else
                {
                    return nil
                }

                self = .toUTF8String(value)
                return

            case .toTextType:
                guard let value = toTextValue(data: rest) else
                {
                    return nil
                }

                self = .toText(value)
                return

            case .toUTF8DataType:
                guard let value = toUTF8DataValue(data: rest) else
                {
                    return nil
                }

                self = .toUTF8Data(value)
                return

            case .becomeType:
                guard let value = becomeValue(data: rest) else
                {
                    return nil
                }

                self = .become(value)
                return

            case .toHexType:
                guard let value = toHexValue(data: rest) else
                {
                    return nil
                }

                self = .toHex(value)
                return

            case .convertFromHexType:
                guard rest.isEmpty else
                {
                    return nil
                }

                self = .convertFromHex

            case .convertToHexType:
                guard rest.isEmpty else
                {
                    return nil
                }

                self = .convertToHex

            case .toBase64Type:
                guard let value = toBase64Value(data: rest) else
                {
                    return nil
                }

                self = .toBase64(value)
                return

            case .convertFromBase64Type:
                guard rest.isEmpty else
                {
                    return nil
                }

                self = .convertFromBase64

            case .convertToBase64Type:
                guard rest.isEmpty else
                {
                    return nil
                }

                self = .convertToBase64

            case .trimType:
                guard let value = trimValue(data: rest) else
                {
                    return nil
                }

                self = .trim(value)
                return

            case .becomeTrimmedType:
                guard rest.isEmpty else
                {
                    return nil
                }

                self = .becomeTrimmed

            case .countType:
                guard let value = countValue(data: rest) else
                {
                    return nil
                }

                self = .count(value)
                return

            case .isEmptyType:
                guard let value = isEmptyValue(data: rest) else
                {
                    return nil
                }

                self = .isEmpty(value)
                return

            case .dropFirstType:
                guard let value = dropFirstValue(data: rest) else
                {
                    return nil
                }

                self = .dropFirst(value)
                return

            case .becomeDropFirstType:
                guard rest.isEmpty else
                {
                    return nil
                }

                self = .becomeDropFirst

            case .uppercaseType:
                guard let value = uppercaseValue(data: rest) else
                {
                    return nil
                }

                self = .uppercase(value)
                return

            case .becomeUppercaseType:
                guard rest.isEmpty else
                {
                    return nil
                }

                self = .becomeUppercase

            case .uppercaseFirstLetterType:
                guard let value = uppercaseFirstLetterValue(data: rest) else
                {
                    return nil
                }

                self = .uppercaseFirstLetter(value)
                return

            case .becomeUppercaseFirstLetterType:
                guard rest.isEmpty else
                {
                    return nil
                }

                self = .becomeUppercaseFirstLetter

            case .firstType:
                guard let value = firstValue(data: rest) else
                {
                    return nil
                }

                self = .first(value)
                return

            case .becomFirstType:
                guard rest.isEmpty else
                {
                    return nil
                }

                self = .becomFirst

            case .lastType:
                guard let value = lastValue(data: rest) else
                {
                    return nil
                }

                self = .last(value)
                return

            case .becomeLastType:
                guard rest.isEmpty else
                {
                    return nil
                }

                self = .becomeLast

            case .fanType:
                guard let value = fanValue(data: rest) else
                {
                    return nil
                }

                self = .fan(value)
                return

            case .reverseType:
                guard let value = reverseValue(data: rest) else
                {
                    return nil
                }

                self = .reverse(value)
                return

            case .becomeReverseType:
                guard rest.isEmpty else
                {
                    return nil
                }

                self = .becomeReverse

            default:
                return nil
        }
    }

    case toUTF8String(toUTF8StringValue)
    case toText(toTextValue)
    case toUTF8Data(toUTF8DataValue)
    case become(becomeValue)
    case toHex(toHexValue)
    case convertFromHex
    case convertToHex
    case toBase64(toBase64Value)
    case convertFromBase64
    case convertToBase64
    case trim(trimValue)
    case becomeTrimmed
    case count(countValue)
    case isEmpty(isEmptyValue)
    case dropFirst(dropFirstValue)
    case becomeDropFirst
    case uppercase(uppercaseValue)
    case becomeUppercase
    case uppercaseFirstLetter(uppercaseFirstLetterValue)
    case becomeUppercaseFirstLetter
    case first(firstValue)
    case becomFirst
    case last(lastValue)
    case becomeLast
    case fan(fanValue)
    case reverse(reverseValue)
    case becomeReverse
}

extension [Text]
{
    public var data: Data
    {
        var result: Data = Data()
        result.append(TypeIdentifiers.TextListType.varint)
        result.append(BInt(self.count).varint)

        for item in self
        {
            result.append(item.data)
        }

        return result
    }

    public init?(data: Data)
    {
        var results: [Text] = []
        var working = data

        while working.count > 0
        {
            guard let (valueData, rest) = working.popLengthAndSlice() else
            {
                self = results
                return
            }

            guard let value = Text(data: valueData) else
            {
                return nil
            }

            results.append(value)
            working = rest
        }

        self = results
    }
}

public struct becomeValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data
    }

    // Public Fields
    public let field1: Text

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let fieldValue = Text(data: working) else
        {
            return nil
        }

        self.field1 = fieldValue

        working = Data()
    }

    public init(_ field1: Text)
    {
        self.field1 = field1
    }
}

public struct countValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data
    }

    // Public Fields
    public let field1: count_returnValue

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let fieldValue = count_returnValue(data: working) else
        {
            return nil
        }

        self.field1 = fieldValue

        working = Data()
    }

    public init(_ field1: count_returnValue)
    {
        self.field1 = field1
    }
}

public struct count_returnValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data
    }

    // Public Fields
    public let field1: Int

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let fieldValue = Int(data: working) else
        {
            return nil
        }

        self.field1 = fieldValue

        working = Data()
    }

    public init(_ field1: Int)
    {
        self.field1 = field1
    }
}

public struct dropFirstValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data
    }

    // Public Fields
    public let field1: dropFirst_returnValue

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let fieldValue = dropFirst_returnValue(data: working) else
        {
            return nil
        }

        self.field1 = fieldValue

        working = Data()
    }

    public init(_ field1: dropFirst_returnValue)
    {
        self.field1 = field1
    }
}

public struct dropFirst_returnValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data
    }

    // Public Fields
    public let field1: Text

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let fieldValue = Text(data: working) else
        {
            return nil
        }

        self.field1 = fieldValue

        working = Data()
    }

    public init(_ field1: Text)
    {
        self.field1 = field1
    }
}

public struct fanValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data
    }

    // Public Fields
    public let field1: fan_returnValue

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let fieldValue = fan_returnValue(data: working) else
        {
            return nil
        }

        self.field1 = fieldValue

        working = Data()
    }

    public init(_ field1: fan_returnValue)
    {
        self.field1 = field1
    }
}

public struct fan_returnValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data
    }

    // Public Fields
    public let field1: [Text]

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let fieldValue = [Text](data: working) else
        {
            return nil
        }

        self.field1 = fieldValue

        working = Data()
    }

    public init(_ field1: [Text])
    {
        self.field1 = field1
    }
}

public struct firstValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data
    }

    // Public Fields
    public let field1: first_returnValue

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let fieldValue = first_returnValue(data: working) else
        {
            return nil
        }

        self.field1 = fieldValue

        working = Data()
    }

    public init(_ field1: first_returnValue)
    {
        self.field1 = field1
    }
}

public struct first_returnValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data
    }

    // Public Fields
    public let field1: Text

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let fieldValue = Text(data: working) else
        {
            return nil
        }

        self.field1 = fieldValue

        working = Data()
    }

    public init(_ field1: Text)
    {
        self.field1 = field1
    }
}

public struct isEmptyValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data
    }

    // Public Fields
    public let field1: isEmpty_returnValue

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let fieldValue = isEmpty_returnValue(data: working) else
        {
            return nil
        }

        self.field1 = fieldValue

        working = Data()
    }

    public init(_ field1: isEmpty_returnValue)
    {
        self.field1 = field1
    }
}

public struct isEmpty_returnValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data
    }

    // Public Fields
    public let field1: Bool

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let fieldValue = Bool(data: working) else
        {
            return nil
        }

        self.field1 = fieldValue

        working = Data()
    }

    public init(_ field1: Bool)
    {
        self.field1 = field1
    }
}

public struct lastValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data
    }

    // Public Fields
    public let field1: last_returnValue

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let fieldValue = last_returnValue(data: working) else
        {
            return nil
        }

        self.field1 = fieldValue

        working = Data()
    }

    public init(_ field1: last_returnValue)
    {
        self.field1 = field1
    }
}

public struct last_returnValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data
    }

    // Public Fields
    public let field1: Text

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let fieldValue = Text(data: working) else
        {
            return nil
        }

        self.field1 = fieldValue

        working = Data()
    }

    public init(_ field1: Text)
    {
        self.field1 = field1
    }
}

public struct reverseValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data
    }

    // Public Fields
    public let field1: reverse_returnValue

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let fieldValue = reverse_returnValue(data: working) else
        {
            return nil
        }

        self.field1 = fieldValue

        working = Data()
    }

    public init(_ field1: reverse_returnValue)
    {
        self.field1 = field1
    }
}

public struct reverse_returnValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data
    }

    // Public Fields
    public let field1: Text

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let fieldValue = Text(data: working) else
        {
            return nil
        }

        self.field1 = fieldValue

        working = Data()
    }

    public init(_ field1: Text)
    {
        self.field1 = field1
    }
}

public struct toBase64Value: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data
    }

    // Public Fields
    public let field1: toBase64_returnValue

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let fieldValue = toBase64_returnValue(data: working) else
        {
            return nil
        }

        self.field1 = fieldValue

        working = Data()
    }

    public init(_ field1: toBase64_returnValue)
    {
        self.field1 = field1
    }
}

public struct toBase64_returnValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data
    }

    // Public Fields
    public let field1: Text

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let fieldValue = Text(data: working) else
        {
            return nil
        }

        self.field1 = fieldValue

        working = Data()
    }

    public init(_ field1: Text)
    {
        self.field1 = field1
    }
}

public struct toHexValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data
    }

    // Public Fields
    public let field1: toHex_returnValue

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let fieldValue = toHex_returnValue(data: working) else
        {
            return nil
        }

        self.field1 = fieldValue

        working = Data()
    }

    public init(_ field1: toHex_returnValue)
    {
        self.field1 = field1
    }
}

public struct toHex_returnValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data
    }

    // Public Fields
    public let field1: Text

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let fieldValue = Text(data: working) else
        {
            return nil
        }

        self.field1 = fieldValue

        working = Data()
    }

    public init(_ field1: Text)
    {
        self.field1 = field1
    }
}

public struct toTextValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data
    }

    // Public Fields
    public let field1: toText_returnValue

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let fieldValue = toText_returnValue(data: working) else
        {
            return nil
        }

        self.field1 = fieldValue

        working = Data()
    }

    public init(_ field1: toText_returnValue)
    {
        self.field1 = field1
    }
}

public struct toText_returnValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data
    }

    // Public Fields
    public let field1: Text

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let fieldValue = Text(data: working) else
        {
            return nil
        }

        self.field1 = fieldValue

        working = Data()
    }

    public init(_ field1: Text)
    {
        self.field1 = field1
    }
}

public struct toUTF8DataValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data
    }

    // Public Fields
    public let field1: toUTF8Data_returnValue

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let fieldValue = toUTF8Data_returnValue(data: working) else
        {
            return nil
        }

        self.field1 = fieldValue

        working = Data()
    }

    public init(_ field1: toUTF8Data_returnValue)
    {
        self.field1 = field1
    }
}

public struct toUTF8Data_returnValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1
    }

    // Public Fields
    public let field1: Data

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        self.field1 = working

        working = Data()
    }

    public init(_ field1: Data)
    {
        self.field1 = field1
    }
}

public struct toUTF8StringValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data
    }

    // Public Fields
    public let field1: toUTF8String_returnValue

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let fieldValue = toUTF8String_returnValue(data: working) else
        {
            return nil
        }

        self.field1 = fieldValue

        working = Data()
    }

    public init(_ field1: toUTF8String_returnValue)
    {
        self.field1 = field1
    }
}

public struct toUTF8String_returnValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data
    }

    // Public Fields
    public let field1: String

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        self.field1 = String(data: working)

        working = Data()
    }

    public init(_ field1: String)
    {
        self.field1 = field1
    }
}

public struct trimValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data
    }

    // Public Fields
    public let field1: trim_returnValue

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let fieldValue = trim_returnValue(data: working) else
        {
            return nil
        }

        self.field1 = fieldValue

        working = Data()
    }

    public init(_ field1: trim_returnValue)
    {
        self.field1 = field1
    }
}

public struct trim_returnValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data
    }

    // Public Fields
    public let field1: Text

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let fieldValue = Text(data: working) else
        {
            return nil
        }

        self.field1 = fieldValue

        working = Data()
    }

    public init(_ field1: Text)
    {
        self.field1 = field1
    }
}

public struct uppercaseValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data
    }

    // Public Fields
    public let field1: uppercase_returnValue

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let fieldValue = uppercase_returnValue(data: working) else
        {
            return nil
        }

        self.field1 = fieldValue

        working = Data()
    }

    public init(_ field1: uppercase_returnValue)
    {
        self.field1 = field1
    }
}

public struct uppercaseFirstLetterValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data
    }

    // Public Fields
    public let field1: uppercaseFirstLetter_returnValue

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let fieldValue = uppercaseFirstLetter_returnValue(data: working) else
        {
            return nil
        }

        self.field1 = fieldValue

        working = Data()
    }

    public init(_ field1: uppercaseFirstLetter_returnValue)
    {
        self.field1 = field1
    }
}

public struct uppercaseFirstLetter_returnValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data
    }

    // Public Fields
    public let field1: Text

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let fieldValue = Text(data: working) else
        {
            return nil
        }

        self.field1 = fieldValue

        working = Data()
    }

    public init(_ field1: Text)
    {
        self.field1 = field1
    }
}

public struct uppercase_returnValue: Equatable, Codable
{
    // Public computed properties
    public var data: Data
    {
        return self.field1.data
    }

    // Public Fields
    public let field1: Text

    // Public Inits
    public init?(data: Data)
    {
        var working: Data = data

        guard let fieldValue = Text(data: working) else
        {
            return nil
        }

        self.field1 = fieldValue

        working = Data()
    }

    public init(_ field1: Text)
    {
        self.field1 = field1
    }
}

extension Value
{
    public var data: Data
    {
        switch self
        {
            case .BoolBuiltin(let subtype):
                let typeData = TypeIdentifiers.BoolType.varint
                let valueData = subtype.data
                return typeData + valueData

            case .Boolean(let subtype):
                let typeData = TypeIdentifiers.BooleanType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .DataBuiltin(let subtype):
                let typeData = TypeIdentifiers.DataType.varint
                let valueData = subtype.data
                return typeData + valueData

            case .False:
                let typeData = TypeIdentifiers.FalseType.varint
                return typeData

            case .IntBuiltin(let subtype):
                let typeData = TypeIdentifiers.IntType.varint
                let valueData = subtype.data
                return typeData + valueData

            case .ListVarint(let subtype):
                let typeData = TypeIdentifiers.ListVarintType.varint
                let valueData = subtype.data
                return typeData + valueData

            case .MutableText(let subtype):
                let typeData = TypeIdentifiers.MutableTextType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .Nothing:
                let typeData = TypeIdentifiers.NothingType.varint
                return typeData

            case .StringBuiltin(let subtype):
                let typeData = TypeIdentifiers.StringType.varint
                let valueData = subtype.data
                return typeData + valueData

            case .TextBuiltin(let subtype):
                let typeData = TypeIdentifiers.TextType.varint
                let valueData = subtype.data
                return typeData + valueData

            case .TextList(let subtype):
                let typeData = TypeIdentifiers.TextListType.varint
                let valueData = subtype.data
                return typeData + valueData

            case .True:
                let typeData = TypeIdentifiers.TrueType.varint
                return typeData

            case .Varint(let bignum):
                let typeData = TypeIdentifiers.VarintType.varint
                let valueData = bignum.varint
                return typeData + valueData

            case .becomFirst:
                let typeData = TypeIdentifiers.becomFirstType.varint
                return typeData

            case .become(let subtype):
                let typeData = TypeIdentifiers.becomeType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .becomeDropFirst:
                let typeData = TypeIdentifiers.becomeDropFirstType.varint
                return typeData

            case .becomeLast:
                let typeData = TypeIdentifiers.becomeLastType.varint
                return typeData

            case .becomeReverse:
                let typeData = TypeIdentifiers.becomeReverseType.varint
                return typeData

            case .becomeTrimmed:
                let typeData = TypeIdentifiers.becomeTrimmedType.varint
                return typeData

            case .becomeUppercase:
                let typeData = TypeIdentifiers.becomeUppercaseType.varint
                return typeData

            case .becomeUppercaseFirstLetter:
                let typeData = TypeIdentifiers.becomeUppercaseFirstLetterType.varint
                return typeData

            case .convertFromBase64:
                let typeData = TypeIdentifiers.convertFromBase64Type.varint
                return typeData

            case .convertFromHex:
                let typeData = TypeIdentifiers.convertFromHexType.varint
                return typeData

            case .convertToBase64:
                let typeData = TypeIdentifiers.convertToBase64Type.varint
                return typeData

            case .convertToHex:
                let typeData = TypeIdentifiers.convertToHexType.varint
                return typeData

            case .count(let subtype):
                let typeData = TypeIdentifiers.countType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .count_return(let subtype):
                let typeData = TypeIdentifiers.count_returnType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .dropFirst(let subtype):
                let typeData = TypeIdentifiers.dropFirstType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .dropFirst_return(let subtype):
                let typeData = TypeIdentifiers.dropFirst_returnType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .fan(let subtype):
                let typeData = TypeIdentifiers.fanType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .fan_return(let subtype):
                let typeData = TypeIdentifiers.fan_returnType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .first(let subtype):
                let typeData = TypeIdentifiers.firstType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .first_return(let subtype):
                let typeData = TypeIdentifiers.first_returnType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .isEmpty(let subtype):
                let typeData = TypeIdentifiers.isEmptyType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .isEmpty_return(let subtype):
                let typeData = TypeIdentifiers.isEmpty_returnType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .last(let subtype):
                let typeData = TypeIdentifiers.lastType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .last_return(let subtype):
                let typeData = TypeIdentifiers.last_returnType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .reverse(let subtype):
                let typeData = TypeIdentifiers.reverseType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .reverse_return(let subtype):
                let typeData = TypeIdentifiers.reverse_returnType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .toBase64(let subtype):
                let typeData = TypeIdentifiers.toBase64Type.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .toBase64_return(let subtype):
                let typeData = TypeIdentifiers.toBase64_returnType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .toHex(let subtype):
                let typeData = TypeIdentifiers.toHexType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .toHex_return(let subtype):
                let typeData = TypeIdentifiers.toHex_returnType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .toText(let subtype):
                let typeData = TypeIdentifiers.toTextType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .toText_return(let subtype):
                let typeData = TypeIdentifiers.toText_returnType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .toUTF8Data(let subtype):
                let typeData = TypeIdentifiers.toUTF8DataType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .toUTF8Data_return(let subtype):
                let typeData = TypeIdentifiers.toUTF8Data_returnType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .toUTF8String(let subtype):
                let typeData = TypeIdentifiers.toUTF8StringType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .toUTF8String_return(let subtype):
                let typeData = TypeIdentifiers.toUTF8String_returnType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .trim(let subtype):
                let typeData = TypeIdentifiers.trimType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .trim_return(let subtype):
                let typeData = TypeIdentifiers.trim_returnType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .uppercase(let subtype):
                let typeData = TypeIdentifiers.uppercaseType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .uppercaseFirstLetter(let subtype):
                let typeData = TypeIdentifiers.uppercaseFirstLetterType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .uppercaseFirstLetter_return(let subtype):
                let typeData = TypeIdentifiers.uppercaseFirstLetter_returnType.varint
                let valueData = subtype.data
                print("typeData: \(typeData.hex)")
                print("valueData: \(valueData.hex)")
                return typeData + valueData

            case .uppercase_return(let subtype):
                let typeData = TypeIdentifiers.uppercase_returnType.varint
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
            case .BoolType:
                guard let subtype = Bool(data: working) else
                {
                    return nil
                }
                self = .BoolBuiltin(subtype)

            case .BooleanType:
                guard let subtype = BooleanValue(data: working) else
                {
                    return nil
                }
                self = .Boolean(subtype)

            case .DataType:
                self = .DataBuiltin(working)

            case .FalseType:
                self = .False

            case .IntType:
                guard let subtype = Int(data: working) else
                {
                    return nil
                }
                self = .IntBuiltin(subtype)

            case .ListVarintType:
                guard let subtype = [BInt](data: working) else
                {
                    return nil
                }
                self = .ListVarint(subtype)

            case .MutableTextType:
                guard let subtype = MutableTextValue(data: working) else
                {
                    return nil
                }
                self = .MutableText(subtype)

            case .NothingType:
                self = .Nothing

            case .StringType:
                self = .StringBuiltin(String(data: working))

            case .TextType:
                guard let subtype = Text(data: working) else
                {
                    return nil
                }
                self = .TextBuiltin(subtype)

            case .TextListType:
                guard let subtype = [Text](data: working) else
                {
                    return nil
                }
                self = .TextList(subtype)

            case .TrueType:
                self = .True

            case .VarintType:
                guard let bignum = BInt(varint: working) else
                {
                    return nil
                }

                self = .Varint(bignum)

            case .becomFirstType:
                self = .becomFirst

            case .becomeType:
                guard let subtype = becomeValue(data: working) else
                {
                    return nil
                }
                self = .become(subtype)

            case .becomeDropFirstType:
                self = .becomeDropFirst

            case .becomeLastType:
                self = .becomeLast

            case .becomeReverseType:
                self = .becomeReverse

            case .becomeTrimmedType:
                self = .becomeTrimmed

            case .becomeUppercaseType:
                self = .becomeUppercase

            case .becomeUppercaseFirstLetterType:
                self = .becomeUppercaseFirstLetter

            case .convertFromBase64Type:
                self = .convertFromBase64

            case .convertFromHexType:
                self = .convertFromHex

            case .convertToBase64Type:
                self = .convertToBase64

            case .convertToHexType:
                self = .convertToHex

            case .countType:
                guard let subtype = countValue(data: working) else
                {
                    return nil
                }
                self = .count(subtype)

            case .count_returnType:
                guard let subtype = count_returnValue(data: working) else
                {
                    return nil
                }
                self = .count_return(subtype)

            case .dropFirstType:
                guard let subtype = dropFirstValue(data: working) else
                {
                    return nil
                }
                self = .dropFirst(subtype)

            case .dropFirst_returnType:
                guard let subtype = dropFirst_returnValue(data: working) else
                {
                    return nil
                }
                self = .dropFirst_return(subtype)

            case .fanType:
                guard let subtype = fanValue(data: working) else
                {
                    return nil
                }
                self = .fan(subtype)

            case .fan_returnType:
                guard let subtype = fan_returnValue(data: working) else
                {
                    return nil
                }
                self = .fan_return(subtype)

            case .firstType:
                guard let subtype = firstValue(data: working) else
                {
                    return nil
                }
                self = .first(subtype)

            case .first_returnType:
                guard let subtype = first_returnValue(data: working) else
                {
                    return nil
                }
                self = .first_return(subtype)

            case .isEmptyType:
                guard let subtype = isEmptyValue(data: working) else
                {
                    return nil
                }
                self = .isEmpty(subtype)

            case .isEmpty_returnType:
                guard let subtype = isEmpty_returnValue(data: working) else
                {
                    return nil
                }
                self = .isEmpty_return(subtype)

            case .lastType:
                guard let subtype = lastValue(data: working) else
                {
                    return nil
                }
                self = .last(subtype)

            case .last_returnType:
                guard let subtype = last_returnValue(data: working) else
                {
                    return nil
                }
                self = .last_return(subtype)

            case .reverseType:
                guard let subtype = reverseValue(data: working) else
                {
                    return nil
                }
                self = .reverse(subtype)

            case .reverse_returnType:
                guard let subtype = reverse_returnValue(data: working) else
                {
                    return nil
                }
                self = .reverse_return(subtype)

            case .toBase64Type:
                guard let subtype = toBase64Value(data: working) else
                {
                    return nil
                }
                self = .toBase64(subtype)

            case .toBase64_returnType:
                guard let subtype = toBase64_returnValue(data: working) else
                {
                    return nil
                }
                self = .toBase64_return(subtype)

            case .toHexType:
                guard let subtype = toHexValue(data: working) else
                {
                    return nil
                }
                self = .toHex(subtype)

            case .toHex_returnType:
                guard let subtype = toHex_returnValue(data: working) else
                {
                    return nil
                }
                self = .toHex_return(subtype)

            case .toTextType:
                guard let subtype = toTextValue(data: working) else
                {
                    return nil
                }
                self = .toText(subtype)

            case .toText_returnType:
                guard let subtype = toText_returnValue(data: working) else
                {
                    return nil
                }
                self = .toText_return(subtype)

            case .toUTF8DataType:
                guard let subtype = toUTF8DataValue(data: working) else
                {
                    return nil
                }
                self = .toUTF8Data(subtype)

            case .toUTF8Data_returnType:
                guard let subtype = toUTF8Data_returnValue(data: working) else
                {
                    return nil
                }
                self = .toUTF8Data_return(subtype)

            case .toUTF8StringType:
                guard let subtype = toUTF8StringValue(data: working) else
                {
                    return nil
                }
                self = .toUTF8String(subtype)

            case .toUTF8String_returnType:
                guard let subtype = toUTF8String_returnValue(data: working) else
                {
                    return nil
                }
                self = .toUTF8String_return(subtype)

            case .trimType:
                guard let subtype = trimValue(data: working) else
                {
                    return nil
                }
                self = .trim(subtype)

            case .trim_returnType:
                guard let subtype = trim_returnValue(data: working) else
                {
                    return nil
                }
                self = .trim_return(subtype)

            case .uppercaseType:
                guard let subtype = uppercaseValue(data: working) else
                {
                    return nil
                }
                self = .uppercase(subtype)

            case .uppercaseFirstLetterType:
                guard let subtype = uppercaseFirstLetterValue(data: working) else
                {
                    return nil
                }
                self = .uppercaseFirstLetter(subtype)

            case .uppercaseFirstLetter_returnType:
                guard let subtype = uppercaseFirstLetter_returnValue(data: working) else
                {
                    return nil
                }
                self = .uppercaseFirstLetter_return(subtype)

            case .uppercase_returnType:
                guard let subtype = uppercase_returnValue(data: working) else
                {
                    return nil
                }
                self = .uppercase_return(subtype)

            default:
                return nil
        }
    }
}