//
//  TypeIdentifiers.swift
//
//
//  Created by the Daydream Compiler on 2024-01-16 23:32:18 +0000.
//

import Foundation

import BigNumber
import Datable
import Daydream
import SwiftHexTools
import Text
import Transmission

public enum TypeIdentifiers: Int
{
    public var bint: BInt
    {
        return BInt(self.rawValue)
    }

    public init?(bint: BInt)
    {
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
    case ErrorType = 9
    case FalseType = 10
    case IntType = 11
    case ListVarintType = 12
    case MutableTextType = 13
    case MutableTextRequestType = 14
    case MutableTextResponseType = 15
    case NothingType = 16
    case StringType = 17
    case TextType = 18
    case TextListType = 19
    case TrueType = 20
    case VarintType = 21
    case becomeDropFirstType = 22
    case becomeDropFirst_requestType = 23
    case becomeDropFirst_responseType = 24
    case becomeFirstType = 25
    case becomeFirst_requestType = 26
    case becomeFirst_responseType = 27
    case becomeLastType = 28
    case becomeLast_requestType = 29
    case becomeLast_responseType = 30
    case becomeReverseType = 31
    case becomeReverse_requestType = 32
    case becomeReverse_responseType = 33
    case becomeTrimmedType = 34
    case becomeTrimmed_requestType = 35
    case becomeTrimmed_responseType = 36
    case becomeUppercaseType = 37
    case becomeUppercaseFirstLetterType = 38
    case becomeUppercaseFirstLetter_requestType = 39
    case becomeUppercaseFirstLetter_responseType = 40
    case becomeUppercase_requestType = 41
    case becomeUppercase_responseType = 42
    case convertFromBase64Type = 43
    case convertFromBase64_requestType = 44
    case convertFromBase64_responseType = 45
    case convertFromHexType = 46
    case convertFromHex_requestType = 47
    case convertFromHex_responseType = 48
    case convertToBase64Type = 49
    case convertToBase64_requestType = 50
    case convertToBase64_responseType = 51
    case convertToHexType = 52
    case convertToHex_requestType = 53
    case convertToHex_responseType = 54
    case countType = 55
    case count_requestType = 56
    case count_responseType = 57
    case dropFirstType = 58
    case dropFirst_requestType = 59
    case dropFirst_responseType = 60
    case dropFirst_response_valueType = 61
    case fanType = 62
    case fan_requestType = 63
    case fan_responseType = 64
    case firstType = 65
    case first_requestType = 66
    case first_responseType = 67
    case first_response_valueType = 68
    case isEmptyType = 69
    case isEmpty_requestType = 70
    case isEmpty_responseType = 71
    case lastType = 72
    case last_requestType = 73
    case last_responseType = 74
    case last_response_valueType = 75
    case reverseType = 76
    case reverse_requestType = 77
    case reverse_responseType = 78
    case toBase64Type = 79
    case toBase64_requestType = 80
    case toBase64_responseType = 81
    case toHexType = 82
    case toHex_requestType = 83
    case toHex_responseType = 84
    case toTextType = 85
    case toText_requestType = 86
    case toText_responseType = 87
    case toUTF8DataType = 88
    case toUTF8Data_requestType = 89
    case toUTF8Data_responseType = 90
    case toUTF8StringType = 91
    case toUTF8String_requestType = 92
    case toUTF8String_responseType = 93
    case trimType = 94
    case trim_requestType = 95
    case trim_responseType = 96
    case uppercaseType = 97
    case uppercaseFirstLetterType = 98
    case uppercaseFirstLetter_requestType = 99
    case uppercaseFirstLetter_responseType = 100
    case uppercaseFirstLetter_response_valueType = 101
    case uppercase_requestType = 102
    case uppercase_responseType = 103
}

extension TypeIdentifiers: Daydreamable
{
    public init(daydream connection: Transmission.Connection) throws
    {
        let bint = try BInt(daydream: connection)

        guard let type = Self(bint: bint) else
        {
            throw DaydreamError.conversionFailed
        }

        self = type
    }

    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        try self.bint.saveDaydream(connection)
    }
}

public enum Value: Equatable, Codable
{
    case BoolBuiltin(Bool)
    case Boolean(BooleanValue)
    case DataBuiltin(Data)
    case Error(ErrorValue)
    case False
    case IntBuiltin(Int)
    case ListVarint([BInt])
    case MutableText(MutableTextValue)
    case MutableTextRequest(MutableTextRequestValue)
    case MutableTextResponse(MutableTextResponseValue)
    case Nothing
    case StringBuiltin(String)
    case TextBuiltin(Text)
    case TextList([Text])
    case True
    case Varint(BInt)
    case becomeDropFirst
    case becomeDropFirst_request
    case becomeDropFirst_response(becomeDropFirst_responseValue)
    case becomeFirst
    case becomeFirst_request
    case becomeFirst_response(becomeFirst_responseValue)
    case becomeLast
    case becomeLast_request
    case becomeLast_response(becomeLast_responseValue)
    case becomeReverse
    case becomeReverse_request
    case becomeReverse_response
    case becomeTrimmed
    case becomeTrimmed_request
    case becomeTrimmed_response
    case becomeUppercase
    case becomeUppercaseFirstLetter
    case becomeUppercaseFirstLetter_request
    case becomeUppercaseFirstLetter_response(becomeUppercaseFirstLetter_responseValue)
    case becomeUppercase_request
    case becomeUppercase_response
    case convertFromBase64
    case convertFromBase64_request
    case convertFromBase64_response(convertFromBase64_responseValue)
    case convertFromHex
    case convertFromHex_request
    case convertFromHex_response(convertFromHex_responseValue)
    case convertToBase64
    case convertToBase64_request
    case convertToBase64_response
    case convertToHex
    case convertToHex_request
    case convertToHex_response
    case count
    case count_request
    case count_response(count_responseValue)
    case dropFirst
    case dropFirst_request
    case dropFirst_response(dropFirst_responseValue)
    case dropFirst_response_value(dropFirst_response_valueValue)
    case fan
    case fan_request
    case fan_response(fan_responseValue)
    case first
    case first_request
    case first_response(first_responseValue)
    case first_response_value(first_response_valueValue)
    case isEmpty
    case isEmpty_request
    case isEmpty_response(isEmpty_responseValue)
    case last
    case last_request
    case last_response(last_responseValue)
    case last_response_value(last_response_valueValue)
    case reverse
    case reverse_request
    case reverse_response(reverse_responseValue)
    case toBase64
    case toBase64_request
    case toBase64_response(toBase64_responseValue)
    case toHex
    case toHex_request
    case toHex_response(toHex_responseValue)
    case toText
    case toText_request
    case toText_response(toText_responseValue)
    case toUTF8Data
    case toUTF8Data_request
    case toUTF8Data_response(toUTF8Data_responseValue)
    case toUTF8String
    case toUTF8String_request
    case toUTF8String_response(toUTF8String_responseValue)
    case trim
    case trim_request
    case trim_response(trim_responseValue)
    case uppercase
    case uppercaseFirstLetter
    case uppercaseFirstLetter_request
    case uppercaseFirstLetter_response(uppercaseFirstLetter_responseValue)
    case uppercaseFirstLetter_response_value(uppercaseFirstLetter_response_valueValue)
    case uppercase_request
    case uppercase_response(uppercase_responseValue)
}

public enum BooleanValue: Equatable, Codable, Daydreamable
{
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        switch self
        {
            case .True:
                try TypeIdentifiers.TrueType.saveDaydream(connection)

            case .False:
                try TypeIdentifiers.FalseType.saveDaydream(connection)
        }
    }

    public init(daydream connection: Transmission.Connection) throws
    {
        let bint = try BInt(daydream: connection)

        guard let int = bint.asInt() else
        {
            throw DaydreamError.conversionFailed
        }

        guard let type = TypeIdentifiers(rawValue: int) else
        {
            throw DaydreamError.conversionFailed
        }

        switch type
        {
            case .TrueType:
                self = .True

            case .FalseType:
                self = .False

            default:
                throw DaydreamError.conversionFailed
        }
    }

    case True
    case False
}

public struct ErrorValue: Equatable, Codable, Daydreamable
{
    // Public computed properties
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        try self.field1.saveDaydream(connection)
    }

    // Public Fields
    public let field1: String

    // Public Inits
    public init(daydream connection: Transmission.Connection) throws
    {
        self.field1 = try String(daydream: connection)
    }

    public init(_ field1: String)
    {
        self.field1 = field1
    }
}



public enum MutableTextValue: Equatable, Codable, Daydreamable
{
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        switch self
        {
            case .toUTF8String:
                try TypeIdentifiers.toUTF8StringType.saveDaydream(connection)

            case .toText:
                try TypeIdentifiers.toTextType.saveDaydream(connection)

            case .toUTF8Data:
                try TypeIdentifiers.toUTF8DataType.saveDaydream(connection)

            case .toHex:
                try TypeIdentifiers.toHexType.saveDaydream(connection)

            case .convertFromHex:
                try TypeIdentifiers.convertFromHexType.saveDaydream(connection)

            case .convertToHex:
                try TypeIdentifiers.convertToHexType.saveDaydream(connection)

            case .toBase64:
                try TypeIdentifiers.toBase64Type.saveDaydream(connection)

            case .convertFromBase64:
                try TypeIdentifiers.convertFromBase64Type.saveDaydream(connection)

            case .convertToBase64:
                try TypeIdentifiers.convertToBase64Type.saveDaydream(connection)

            case .trim:
                try TypeIdentifiers.trimType.saveDaydream(connection)

            case .becomeTrimmed:
                try TypeIdentifiers.becomeTrimmedType.saveDaydream(connection)

            case .count:
                try TypeIdentifiers.countType.saveDaydream(connection)

            case .isEmpty:
                try TypeIdentifiers.isEmptyType.saveDaydream(connection)

            case .dropFirst:
                try TypeIdentifiers.dropFirstType.saveDaydream(connection)

            case .becomeDropFirst:
                try TypeIdentifiers.becomeDropFirstType.saveDaydream(connection)

            case .uppercase:
                try TypeIdentifiers.uppercaseType.saveDaydream(connection)

            case .becomeUppercase:
                try TypeIdentifiers.becomeUppercaseType.saveDaydream(connection)

            case .uppercaseFirstLetter:
                try TypeIdentifiers.uppercaseFirstLetterType.saveDaydream(connection)

            case .becomeUppercaseFirstLetter:
                try TypeIdentifiers.becomeUppercaseFirstLetterType.saveDaydream(connection)

            case .first:
                try TypeIdentifiers.firstType.saveDaydream(connection)

            case .becomeFirst:
                try TypeIdentifiers.becomeFirstType.saveDaydream(connection)

            case .last:
                try TypeIdentifiers.lastType.saveDaydream(connection)

            case .becomeLast:
                try TypeIdentifiers.becomeLastType.saveDaydream(connection)

            case .fan:
                try TypeIdentifiers.fanType.saveDaydream(connection)

            case .reverse:
                try TypeIdentifiers.reverseType.saveDaydream(connection)

            case .becomeReverse:
                try TypeIdentifiers.becomeReverseType.saveDaydream(connection)
        }
    }

    public init(daydream connection: Transmission.Connection) throws
    {
        let bint = try BInt(daydream: connection)

        guard let int = bint.asInt() else
        {
            throw DaydreamError.conversionFailed
        }

        guard let type = TypeIdentifiers(rawValue: int) else
        {
            throw DaydreamError.conversionFailed
        }

        switch type
        {
            case .toUTF8StringType:
                self = .toUTF8String

            case .toTextType:
                self = .toText

            case .toUTF8DataType:
                self = .toUTF8Data

            case .toHexType:
                self = .toHex

            case .convertFromHexType:
                self = .convertFromHex

            case .convertToHexType:
                self = .convertToHex

            case .toBase64Type:
                self = .toBase64

            case .convertFromBase64Type:
                self = .convertFromBase64

            case .convertToBase64Type:
                self = .convertToBase64

            case .trimType:
                self = .trim

            case .becomeTrimmedType:
                self = .becomeTrimmed

            case .countType:
                self = .count

            case .isEmptyType:
                self = .isEmpty

            case .dropFirstType:
                self = .dropFirst

            case .becomeDropFirstType:
                self = .becomeDropFirst

            case .uppercaseType:
                self = .uppercase

            case .becomeUppercaseType:
                self = .becomeUppercase

            case .uppercaseFirstLetterType:
                self = .uppercaseFirstLetter

            case .becomeUppercaseFirstLetterType:
                self = .becomeUppercaseFirstLetter

            case .firstType:
                self = .first

            case .becomeFirstType:
                self = .becomeFirst

            case .lastType:
                self = .last

            case .becomeLastType:
                self = .becomeLast

            case .fanType:
                self = .fan

            case .reverseType:
                self = .reverse

            case .becomeReverseType:
                self = .becomeReverse

            default:
                throw DaydreamError.conversionFailed
        }
    }

    case toUTF8String
    case toText
    case toUTF8Data
    case toHex
    case convertFromHex
    case convertToHex
    case toBase64
    case convertFromBase64
    case convertToBase64
    case trim
    case becomeTrimmed
    case count
    case isEmpty
    case dropFirst
    case becomeDropFirst
    case uppercase
    case becomeUppercase
    case uppercaseFirstLetter
    case becomeUppercaseFirstLetter
    case first
    case becomeFirst
    case last
    case becomeLast
    case fan
    case reverse
    case becomeReverse
}

public enum MutableTextRequestValue: Equatable, Codable, Daydreamable
{
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        switch self
        {
            case .toUTF8String_request:
                try TypeIdentifiers.toUTF8String_requestType.saveDaydream(connection)

            case .toText_request:
                try TypeIdentifiers.toText_requestType.saveDaydream(connection)

            case .toUTF8Data_request:
                try TypeIdentifiers.toUTF8Data_requestType.saveDaydream(connection)

            case .toHex_request:
                try TypeIdentifiers.toHex_requestType.saveDaydream(connection)

            case .convertFromHex_request:
                try TypeIdentifiers.convertFromHex_requestType.saveDaydream(connection)

            case .convertToHex_request:
                try TypeIdentifiers.convertToHex_requestType.saveDaydream(connection)

            case .toBase64_request:
                try TypeIdentifiers.toBase64_requestType.saveDaydream(connection)

            case .convertFromBase64_request:
                try TypeIdentifiers.convertFromBase64_requestType.saveDaydream(connection)

            case .convertToBase64_request:
                try TypeIdentifiers.convertToBase64_requestType.saveDaydream(connection)

            case .trim_request:
                try TypeIdentifiers.trim_requestType.saveDaydream(connection)

            case .becomeTrimmed_request:
                try TypeIdentifiers.becomeTrimmed_requestType.saveDaydream(connection)

            case .count_request:
                try TypeIdentifiers.count_requestType.saveDaydream(connection)

            case .isEmpty_request:
                try TypeIdentifiers.isEmpty_requestType.saveDaydream(connection)

            case .dropFirst_request:
                try TypeIdentifiers.dropFirst_requestType.saveDaydream(connection)

            case .becomeDropFirst_request:
                try TypeIdentifiers.becomeDropFirst_requestType.saveDaydream(connection)

            case .uppercase_request:
                try TypeIdentifiers.uppercase_requestType.saveDaydream(connection)

            case .becomeUppercase_request:
                try TypeIdentifiers.becomeUppercase_requestType.saveDaydream(connection)

            case .uppercaseFirstLetter_request:
                try TypeIdentifiers.uppercaseFirstLetter_requestType.saveDaydream(connection)

            case .becomeUppercaseFirstLetter_request:
                try TypeIdentifiers.becomeUppercaseFirstLetter_requestType.saveDaydream(connection)

            case .first_request:
                try TypeIdentifiers.first_requestType.saveDaydream(connection)

            case .becomeFirst_request:
                try TypeIdentifiers.becomeFirst_requestType.saveDaydream(connection)

            case .last_request:
                try TypeIdentifiers.last_requestType.saveDaydream(connection)

            case .becomeLast_request:
                try TypeIdentifiers.becomeLast_requestType.saveDaydream(connection)

            case .fan_request:
                try TypeIdentifiers.fan_requestType.saveDaydream(connection)

            case .reverse_request:
                try TypeIdentifiers.reverse_requestType.saveDaydream(connection)

            case .becomeReverse_request:
                try TypeIdentifiers.becomeReverse_requestType.saveDaydream(connection)
        }
    }

    public init(daydream connection: Transmission.Connection) throws
    {
        let bint = try BInt(daydream: connection)

        guard let int = bint.asInt() else
        {
            throw DaydreamError.conversionFailed
        }

        guard let type = TypeIdentifiers(rawValue: int) else
        {
            throw DaydreamError.conversionFailed
        }

        switch type
        {
            case .toUTF8String_requestType:
                self = .toUTF8String_request

            case .toText_requestType:
                self = .toText_request

            case .toUTF8Data_requestType:
                self = .toUTF8Data_request

            case .toHex_requestType:
                self = .toHex_request

            case .convertFromHex_requestType:
                self = .convertFromHex_request

            case .convertToHex_requestType:
                self = .convertToHex_request

            case .toBase64_requestType:
                self = .toBase64_request

            case .convertFromBase64_requestType:
                self = .convertFromBase64_request

            case .convertToBase64_requestType:
                self = .convertToBase64_request

            case .trim_requestType:
                self = .trim_request

            case .becomeTrimmed_requestType:
                self = .becomeTrimmed_request

            case .count_requestType:
                self = .count_request

            case .isEmpty_requestType:
                self = .isEmpty_request

            case .dropFirst_requestType:
                self = .dropFirst_request

            case .becomeDropFirst_requestType:
                self = .becomeDropFirst_request

            case .uppercase_requestType:
                self = .uppercase_request

            case .becomeUppercase_requestType:
                self = .becomeUppercase_request

            case .uppercaseFirstLetter_requestType:
                self = .uppercaseFirstLetter_request

            case .becomeUppercaseFirstLetter_requestType:
                self = .becomeUppercaseFirstLetter_request

            case .first_requestType:
                self = .first_request

            case .becomeFirst_requestType:
                self = .becomeFirst_request

            case .last_requestType:
                self = .last_request

            case .becomeLast_requestType:
                self = .becomeLast_request

            case .fan_requestType:
                self = .fan_request

            case .reverse_requestType:
                self = .reverse_request

            case .becomeReverse_requestType:
                self = .becomeReverse_request

            default:
                throw DaydreamError.conversionFailed
        }
    }

    case toUTF8String_request
    case toText_request
    case toUTF8Data_request
    case toHex_request
    case convertFromHex_request
    case convertToHex_request
    case toBase64_request
    case convertFromBase64_request
    case convertToBase64_request
    case trim_request
    case becomeTrimmed_request
    case count_request
    case isEmpty_request
    case dropFirst_request
    case becomeDropFirst_request
    case uppercase_request
    case becomeUppercase_request
    case uppercaseFirstLetter_request
    case becomeUppercaseFirstLetter_request
    case first_request
    case becomeFirst_request
    case last_request
    case becomeLast_request
    case fan_request
    case reverse_request
    case becomeReverse_request
}

public enum MutableTextResponseValue: Equatable, Codable, Daydreamable
{
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        print("MutableTextResponseValue.saveDaydream() - \(self)")

        switch self
        {
            case .toUTF8String_response(let subtype):
                try TypeIdentifiers.toUTF8String_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .toText_response(let subtype):
                try TypeIdentifiers.toText_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .toUTF8Data_response(let subtype):
                try TypeIdentifiers.toUTF8Data_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .toHex_response(let subtype):
                try TypeIdentifiers.toHex_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .convertFromHex_response(let subtype):
                try TypeIdentifiers.convertFromHex_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .convertToHex_response:
                try TypeIdentifiers.convertToHex_responseType.saveDaydream(connection)

            case .toBase64_response(let subtype):
                try TypeIdentifiers.toBase64_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .convertFromBase64_response(let subtype):
                try TypeIdentifiers.convertFromBase64_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .convertToBase64_response:
                try TypeIdentifiers.convertToBase64_responseType.saveDaydream(connection)

            case .trim_response(let subtype):
                try TypeIdentifiers.trim_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeTrimmed_response:
                try TypeIdentifiers.becomeTrimmed_responseType.saveDaydream(connection)

            case .count_response(let subtype):
                try TypeIdentifiers.count_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .isEmpty_response(let subtype):
                try TypeIdentifiers.isEmpty_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .dropFirst_response(let subtype):
                try TypeIdentifiers.dropFirst_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeDropFirst_response(let subtype):
                try TypeIdentifiers.becomeDropFirst_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .uppercase_response(let subtype):
                try TypeIdentifiers.uppercase_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeUppercase_response:
                try TypeIdentifiers.becomeUppercase_responseType.saveDaydream(connection)

            case .uppercaseFirstLetter_response(let subtype):
                try TypeIdentifiers.uppercaseFirstLetter_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeUppercaseFirstLetter_response(let subtype):
                try TypeIdentifiers.becomeUppercaseFirstLetter_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .first_response(let subtype):
                try TypeIdentifiers.first_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeFirst_response(let subtype):
                try TypeIdentifiers.becomeFirst_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .last_response(let subtype):
                try TypeIdentifiers.last_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeLast_response(let subtype):
                try TypeIdentifiers.becomeLast_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .fan_response(let subtype):
                try TypeIdentifiers.fan_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .reverse_response(let subtype):
                try TypeIdentifiers.reverse_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeReverse_response:
                try TypeIdentifiers.becomeReverse_responseType.saveDaydream(connection)
        }
    }

    public init(daydream connection: Transmission.Connection) throws
    {
        print("MutableTextResponseValue.init(daydream:)")

        let bint = try BInt(daydream: connection)

        print("MutableTextResponseValue.init(daydream:) - bint: \(bint)")

        guard let int = bint.asInt() else
        {
            throw DaydreamError.conversionFailed
        }

        print("MutableTextResponseValue.init(daydream:) - int: \(int)")

        guard let type = TypeIdentifiers(rawValue: int) else
        {
            throw DaydreamError.conversionFailed
        }

        switch type
        {
            case .toUTF8String_responseType:
                let value = try toUTF8String_responseValue(daydream: connection)

                self = .toUTF8String_response(value)
                return

            case .toText_responseType:
                let value = try toText_responseValue(daydream: connection)

                self = .toText_response(value)
                return

            case .toUTF8Data_responseType:
                let value = try toUTF8Data_responseValue(daydream: connection)

                self = .toUTF8Data_response(value)
                return

            case .toHex_responseType:
                let value = try toHex_responseValue(daydream: connection)

                self = .toHex_response(value)
                return

            case .convertFromHex_responseType:
                let value = try convertFromHex_responseValue(daydream: connection)

                self = .convertFromHex_response(value)
                return

            case .convertToHex_responseType:
                self = .convertToHex_response

            case .toBase64_responseType:
                let value = try toBase64_responseValue(daydream: connection)

                self = .toBase64_response(value)
                return

            case .convertFromBase64_responseType:
                let value = try convertFromBase64_responseValue(daydream: connection)

                self = .convertFromBase64_response(value)
                return

            case .convertToBase64_responseType:
                self = .convertToBase64_response

            case .trim_responseType:
                let value = try trim_responseValue(daydream: connection)

                self = .trim_response(value)
                return

            case .becomeTrimmed_responseType:
                self = .becomeTrimmed_response

            case .count_responseType:
                let value = try count_responseValue(daydream: connection)

                self = .count_response(value)
                return

            case .isEmpty_responseType:
                let value = try isEmpty_responseValue(daydream: connection)

                self = .isEmpty_response(value)
                return

            case .dropFirst_responseType:
                let value = try dropFirst_responseValue(daydream: connection)

                self = .dropFirst_response(value)
                return

            case .becomeDropFirst_responseType:
                let value = try becomeDropFirst_responseValue(daydream: connection)

                self = .becomeDropFirst_response(value)
                return

            case .uppercase_responseType:
                let value = try uppercase_responseValue(daydream: connection)

                self = .uppercase_response(value)
                return

            case .becomeUppercase_responseType:
                self = .becomeUppercase_response

            case .uppercaseFirstLetter_responseType:
                let value = try uppercaseFirstLetter_responseValue(daydream: connection)

                self = .uppercaseFirstLetter_response(value)
                return

            case .becomeUppercaseFirstLetter_responseType:
                let value = try becomeUppercaseFirstLetter_responseValue(daydream: connection)

                self = .becomeUppercaseFirstLetter_response(value)
                return

            case .first_responseType:
                let value = try first_responseValue(daydream: connection)

                self = .first_response(value)
                return

            case .becomeFirst_responseType:
                let value = try becomeFirst_responseValue(daydream: connection)

                self = .becomeFirst_response(value)
                return

            case .last_responseType:
                let value = try last_responseValue(daydream: connection)

                self = .last_response(value)
                return

            case .becomeLast_responseType:
                let value = try becomeLast_responseValue(daydream: connection)

                self = .becomeLast_response(value)
                return

            case .fan_responseType:
                let value = try fan_responseValue(daydream: connection)

                self = .fan_response(value)
                return

            case .reverse_responseType:
                let value = try reverse_responseValue(daydream: connection)

                self = .reverse_response(value)
                return

            case .becomeReverse_responseType:
                self = .becomeReverse_response

            default:
                throw DaydreamError.conversionFailed
        }
    }

    case toUTF8String_response(toUTF8String_responseValue)
    case toText_response(toText_responseValue)
    case toUTF8Data_response(toUTF8Data_responseValue)
    case toHex_response(toHex_responseValue)
    case convertFromHex_response(convertFromHex_responseValue)
    case convertToHex_response
    case toBase64_response(toBase64_responseValue)
    case convertFromBase64_response(convertFromBase64_responseValue)
    case convertToBase64_response
    case trim_response(trim_responseValue)
    case becomeTrimmed_response
    case count_response(count_responseValue)
    case isEmpty_response(isEmpty_responseValue)
    case dropFirst_response(dropFirst_responseValue)
    case becomeDropFirst_response(becomeDropFirst_responseValue)
    case uppercase_response(uppercase_responseValue)
    case becomeUppercase_response
    case uppercaseFirstLetter_response(uppercaseFirstLetter_responseValue)
    case becomeUppercaseFirstLetter_response(becomeUppercaseFirstLetter_responseValue)
    case first_response(first_responseValue)
    case becomeFirst_response(becomeFirst_responseValue)
    case last_response(last_responseValue)
    case becomeLast_response(becomeLast_responseValue)
    case fan_response(fan_responseValue)
    case reverse_response(reverse_responseValue)
    case becomeReverse_response
}



public enum becomeDropFirst_responseValue: Equatable, Codable, Daydreamable
{
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        switch self
        {
            case .Nothing:
                try TypeIdentifiers.NothingType.saveDaydream(connection)

            case .Error(let subtype):
                try TypeIdentifiers.ErrorType.saveDaydream(connection)
                try subtype.saveDaydream(connection)
        }
    }

    public init(daydream connection: Transmission.Connection) throws
    {
        let bint = try BInt(daydream: connection)

        guard let int = bint.asInt() else
        {
            throw DaydreamError.conversionFailed
        }

        guard let type = TypeIdentifiers(rawValue: int) else
        {
            throw DaydreamError.conversionFailed
        }

        switch type
        {
            case .NothingType:
                self = .Nothing

            case .ErrorType:
                let value = try ErrorValue(daydream: connection)

                self = .Error(value)
                return

            default:
                throw DaydreamError.conversionFailed
        }
    }

    case Nothing
    case Error(ErrorValue)
}

public enum becomeFirst_responseValue: Equatable, Codable, Daydreamable
{
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        switch self
        {
            case .Nothing:
                try TypeIdentifiers.NothingType.saveDaydream(connection)

            case .Error(let subtype):
                try TypeIdentifiers.ErrorType.saveDaydream(connection)
                try subtype.saveDaydream(connection)
        }
    }

    public init(daydream connection: Transmission.Connection) throws
    {
        let bint = try BInt(daydream: connection)

        guard let int = bint.asInt() else
        {
            throw DaydreamError.conversionFailed
        }

        guard let type = TypeIdentifiers(rawValue: int) else
        {
            throw DaydreamError.conversionFailed
        }

        switch type
        {
            case .NothingType:
                self = .Nothing

            case .ErrorType:
                let value = try ErrorValue(daydream: connection)

                self = .Error(value)
                return

            default:
                throw DaydreamError.conversionFailed
        }
    }

    case Nothing
    case Error(ErrorValue)
}

public enum becomeLast_responseValue: Equatable, Codable, Daydreamable
{
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        switch self
        {
            case .Nothing:
                try TypeIdentifiers.NothingType.saveDaydream(connection)

            case .Error(let subtype):
                try TypeIdentifiers.ErrorType.saveDaydream(connection)
                try subtype.saveDaydream(connection)
        }
    }

    public init(daydream connection: Transmission.Connection) throws
    {
        let bint = try BInt(daydream: connection)

        guard let int = bint.asInt() else
        {
            throw DaydreamError.conversionFailed
        }

        guard let type = TypeIdentifiers(rawValue: int) else
        {
            throw DaydreamError.conversionFailed
        }

        switch type
        {
            case .NothingType:
                self = .Nothing

            case .ErrorType:
                let value = try ErrorValue(daydream: connection)

                self = .Error(value)
                return

            default:
                throw DaydreamError.conversionFailed
        }
    }

    case Nothing
    case Error(ErrorValue)
}

public enum becomeUppercaseFirstLetter_responseValue: Equatable, Codable, Daydreamable
{
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        switch self
        {
            case .Nothing:
                try TypeIdentifiers.NothingType.saveDaydream(connection)

            case .Error(let subtype):
                try TypeIdentifiers.ErrorType.saveDaydream(connection)
                try subtype.saveDaydream(connection)
        }
    }

    public init(daydream connection: Transmission.Connection) throws
    {
        let bint = try BInt(daydream: connection)

        guard let int = bint.asInt() else
        {
            throw DaydreamError.conversionFailed
        }

        guard let type = TypeIdentifiers(rawValue: int) else
        {
            throw DaydreamError.conversionFailed
        }

        switch type
        {
            case .NothingType:
                self = .Nothing

            case .ErrorType:
                let value = try ErrorValue(daydream: connection)

                self = .Error(value)
                return

            default:
                throw DaydreamError.conversionFailed
        }
    }

    case Nothing
    case Error(ErrorValue)
}

public enum convertFromBase64_responseValue: Equatable, Codable, Daydreamable
{
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        switch self
        {
            case .Nothing:
                try TypeIdentifiers.NothingType.saveDaydream(connection)

            case .Error(let subtype):
                try TypeIdentifiers.ErrorType.saveDaydream(connection)
                try subtype.saveDaydream(connection)
        }
    }

    public init(daydream connection: Transmission.Connection) throws
    {
        let bint = try BInt(daydream: connection)

        guard let int = bint.asInt() else
        {
            throw DaydreamError.conversionFailed
        }

        guard let type = TypeIdentifiers(rawValue: int) else
        {
            throw DaydreamError.conversionFailed
        }

        switch type
        {
            case .NothingType:
                self = .Nothing

            case .ErrorType:
                let value = try ErrorValue(daydream: connection)

                self = .Error(value)
                return

            default:
                throw DaydreamError.conversionFailed
        }
    }

    case Nothing
    case Error(ErrorValue)
}

public enum convertFromHex_responseValue: Equatable, Codable, Daydreamable
{
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        switch self
        {
            case .Nothing:
                try TypeIdentifiers.NothingType.saveDaydream(connection)

            case .Error(let subtype):
                try TypeIdentifiers.ErrorType.saveDaydream(connection)
                try subtype.saveDaydream(connection)
        }
    }

    public init(daydream connection: Transmission.Connection) throws
    {
        let bint = try BInt(daydream: connection)

        guard let int = bint.asInt() else
        {
            throw DaydreamError.conversionFailed
        }

        guard let type = TypeIdentifiers(rawValue: int) else
        {
            throw DaydreamError.conversionFailed
        }

        switch type
        {
            case .NothingType:
                self = .Nothing

            case .ErrorType:
                let value = try ErrorValue(daydream: connection)

                self = .Error(value)
                return

            default:
                throw DaydreamError.conversionFailed
        }
    }

    case Nothing
    case Error(ErrorValue)
}

public struct count_responseValue: Equatable, Codable, Daydreamable
{
    // Public computed properties
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        try self.field1.saveDaydream(connection)
    }

    // Public Fields
    public let field1: Int

    // Public Inits
    public init(daydream connection: Transmission.Connection) throws
    {
        self.field1 = try Int(daydream: connection)
    }

    public init(_ field1: Int)
    {
        self.field1 = field1
    }
}

public enum dropFirst_responseValue: Equatable, Codable, Daydreamable
{
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        switch self
        {
            case .dropFirst_response_value(let subtype):
                try TypeIdentifiers.dropFirst_response_valueType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .Error(let subtype):
                try TypeIdentifiers.ErrorType.saveDaydream(connection)
                try subtype.saveDaydream(connection)
        }
    }

    public init(daydream connection: Transmission.Connection) throws
    {
        let bint = try BInt(daydream: connection)

        guard let int = bint.asInt() else
        {
            throw DaydreamError.conversionFailed
        }

        guard let type = TypeIdentifiers(rawValue: int) else
        {
            throw DaydreamError.conversionFailed
        }

        switch type
        {
            case .dropFirst_response_valueType:
                let value = try dropFirst_response_valueValue(daydream: connection)

                self = .dropFirst_response_value(value)
                return

            case .ErrorType:
                let value = try ErrorValue(daydream: connection)

                self = .Error(value)
                return

            default:
                throw DaydreamError.conversionFailed
        }
    }

    case dropFirst_response_value(dropFirst_response_valueValue)
    case Error(ErrorValue)
}

public struct dropFirst_response_valueValue: Equatable, Codable, Daydreamable
{
    // Public computed properties
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        try self.field1.saveDaydream(connection)
    }

    // Public Fields
    public let field1: Text

    // Public Inits
    public init(daydream connection: Transmission.Connection) throws
    {
        self.field1 = try Text(daydream: connection)
    }

    public init(_ field1: Text)
    {
        self.field1 = field1
    }
}

public struct fan_responseValue: Equatable, Codable, Daydreamable
{
    // Public computed properties
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        try self.field1.saveDaydream(connection)
    }

    // Public Fields
    public let field1: [Text]

    // Public Inits
    public init(daydream connection: Transmission.Connection) throws
    {
        self.field1 = try [Text](daydream: connection)
    }

    public init(_ field1: [Text])
    {
        self.field1 = field1
    }
}

public enum first_responseValue: Equatable, Codable, Daydreamable
{
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        switch self
        {
            case .first_response_value(let subtype):
                try TypeIdentifiers.first_response_valueType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .Error(let subtype):
                try TypeIdentifiers.ErrorType.saveDaydream(connection)
                try subtype.saveDaydream(connection)
        }
    }

    public init(daydream connection: Transmission.Connection) throws
    {
        let bint = try BInt(daydream: connection)

        guard let int = bint.asInt() else
        {
            throw DaydreamError.conversionFailed
        }

        guard let type = TypeIdentifiers(rawValue: int) else
        {
            throw DaydreamError.conversionFailed
        }

        switch type
        {
            case .first_response_valueType:
                let value = try first_response_valueValue(daydream: connection)

                self = .first_response_value(value)
                return

            case .ErrorType:
                let value = try ErrorValue(daydream: connection)

                self = .Error(value)
                return

            default:
                throw DaydreamError.conversionFailed
        }
    }

    case first_response_value(first_response_valueValue)
    case Error(ErrorValue)
}

public struct first_response_valueValue: Equatable, Codable, Daydreamable
{
    // Public computed properties
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        try self.field1.saveDaydream(connection)
    }

    // Public Fields
    public let field1: Text

    // Public Inits
    public init(daydream connection: Transmission.Connection) throws
    {
        self.field1 = try Text(daydream: connection)
    }

    public init(_ field1: Text)
    {
        self.field1 = field1
    }
}

public struct isEmpty_responseValue: Equatable, Codable, Daydreamable
{
    // Public computed properties
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        try self.field1.saveDaydream(connection)
    }

    // Public Fields
    public let field1: Bool

    // Public Inits
    public init(daydream connection: Transmission.Connection) throws
    {
        self.field1 = try Bool(daydream: connection)
    }

    public init(_ field1: Bool)
    {
        self.field1 = field1
    }
}

public enum last_responseValue: Equatable, Codable, Daydreamable
{
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        switch self
        {
            case .last_response_value(let subtype):
                try TypeIdentifiers.last_response_valueType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .Error(let subtype):
                try TypeIdentifiers.ErrorType.saveDaydream(connection)
                try subtype.saveDaydream(connection)
        }
    }

    public init(daydream connection: Transmission.Connection) throws
    {
        let bint = try BInt(daydream: connection)

        guard let int = bint.asInt() else
        {
            throw DaydreamError.conversionFailed
        }

        guard let type = TypeIdentifiers(rawValue: int) else
        {
            throw DaydreamError.conversionFailed
        }

        switch type
        {
            case .last_response_valueType:
                let value = try last_response_valueValue(daydream: connection)

                self = .last_response_value(value)
                return

            case .ErrorType:
                let value = try ErrorValue(daydream: connection)

                self = .Error(value)
                return

            default:
                throw DaydreamError.conversionFailed
        }
    }

    case last_response_value(last_response_valueValue)
    case Error(ErrorValue)
}

public struct last_response_valueValue: Equatable, Codable, Daydreamable
{
    // Public computed properties
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        try self.field1.saveDaydream(connection)
    }

    // Public Fields
    public let field1: Text

    // Public Inits
    public init(daydream connection: Transmission.Connection) throws
    {
        self.field1 = try Text(daydream: connection)
    }

    public init(_ field1: Text)
    {
        self.field1 = field1
    }
}

public struct reverse_responseValue: Equatable, Codable, Daydreamable
{
    // Public computed properties
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        try self.field1.saveDaydream(connection)
    }

    // Public Fields
    public let field1: Text

    // Public Inits
    public init(daydream connection: Transmission.Connection) throws
    {
        self.field1 = try Text(daydream: connection)
    }

    public init(_ field1: Text)
    {
        self.field1 = field1
    }
}

public struct toBase64_responseValue: Equatable, Codable, Daydreamable
{
    // Public computed properties
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        try self.field1.saveDaydream(connection)
    }

    // Public Fields
    public let field1: Text

    // Public Inits
    public init(daydream connection: Transmission.Connection) throws
    {
        self.field1 = try Text(daydream: connection)
    }

    public init(_ field1: Text)
    {
        self.field1 = field1
    }
}

public struct toHex_responseValue: Equatable, Codable, Daydreamable
{
    // Public computed properties
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        try self.field1.saveDaydream(connection)
    }

    // Public Fields
    public let field1: Text

    // Public Inits
    public init(daydream connection: Transmission.Connection) throws
    {
        self.field1 = try Text(daydream: connection)
    }

    public init(_ field1: Text)
    {
        self.field1 = field1
    }
}

public struct toText_responseValue: Equatable, Codable, Daydreamable
{
    // Public computed properties
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        try self.field1.saveDaydream(connection)
    }

    // Public Fields
    public let field1: Text

    // Public Inits
    public init(daydream connection: Transmission.Connection) throws
    {
        self.field1 = try Text(daydream: connection)
    }

    public init(_ field1: Text)
    {
        self.field1 = field1
    }
}

public struct toUTF8Data_responseValue: Equatable, Codable, Daydreamable
{
    // Public computed properties
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        try self.field1.saveDaydream(connection)
    }

    // Public Fields
    public let field1: Data

    // Public Inits
    public init(daydream connection: Transmission.Connection) throws
    {
        self.field1 = try Data(daydream: connection)
    }

    public init(_ field1: Data)
    {
        self.field1 = field1
    }
}

public struct toUTF8String_responseValue: Equatable, Codable, Daydreamable
{
    // Public computed properties
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        try self.field1.saveDaydream(connection)
    }

    // Public Fields
    public let field1: String

    // Public Inits
    public init(daydream connection: Transmission.Connection) throws
    {
        self.field1 = try String(daydream: connection)
    }

    public init(_ field1: String)
    {
        self.field1 = field1
    }
}

public struct trim_responseValue: Equatable, Codable, Daydreamable
{
    // Public computed properties
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        try self.field1.saveDaydream(connection)
    }

    // Public Fields
    public let field1: Text

    // Public Inits
    public init(daydream connection: Transmission.Connection) throws
    {
        self.field1 = try Text(daydream: connection)
    }

    public init(_ field1: Text)
    {
        self.field1 = field1
    }
}

public enum uppercaseFirstLetter_responseValue: Equatable, Codable, Daydreamable
{
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        switch self
        {
            case .uppercaseFirstLetter_response_value(let subtype):
                try TypeIdentifiers.uppercaseFirstLetter_response_valueType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .Error(let subtype):
                try TypeIdentifiers.ErrorType.saveDaydream(connection)
                try subtype.saveDaydream(connection)
        }
    }

    public init(daydream connection: Transmission.Connection) throws
    {
        let bint = try BInt(daydream: connection)

        guard let int = bint.asInt() else
        {
            throw DaydreamError.conversionFailed
        }

        guard let type = TypeIdentifiers(rawValue: int) else
        {
            throw DaydreamError.conversionFailed
        }

        switch type
        {
            case .uppercaseFirstLetter_response_valueType:
                let value = try uppercaseFirstLetter_response_valueValue(daydream: connection)

                self = .uppercaseFirstLetter_response_value(value)
                return

            case .ErrorType:
                let value = try ErrorValue(daydream: connection)

                self = .Error(value)
                return

            default:
                throw DaydreamError.conversionFailed
        }
    }

    case uppercaseFirstLetter_response_value(uppercaseFirstLetter_response_valueValue)
    case Error(ErrorValue)
}

public struct uppercaseFirstLetter_response_valueValue: Equatable, Codable, Daydreamable
{
    // Public computed properties
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        try self.field1.saveDaydream(connection)
    }

    // Public Fields
    public let field1: Text

    // Public Inits
    public init(daydream connection: Transmission.Connection) throws
    {
        self.field1 = try Text(daydream: connection)
    }

    public init(_ field1: Text)
    {
        self.field1 = field1
    }
}

public struct uppercase_responseValue: Equatable, Codable, Daydreamable
{
    // Public computed properties
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        try self.field1.saveDaydream(connection)
    }

    // Public Fields
    public let field1: Text

    // Public Inits
    public init(daydream connection: Transmission.Connection) throws
    {
        self.field1 = try Text(daydream: connection)
    }

    public init(_ field1: Text)
    {
        self.field1 = field1
    }
}

extension Value: Daydreamable
{
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        switch self
        {
            case .BoolBuiltin(let subtype):
                try TypeIdentifiers.BoolType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .Boolean(let subtype):
                try TypeIdentifiers.BooleanType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .DataBuiltin(let subtype):
                try TypeIdentifiers.DataType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .Error(let subtype):
                try TypeIdentifiers.ErrorType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .False:
                try TypeIdentifiers.FalseType.saveDaydream(connection)

            case .IntBuiltin(let subtype):
                try TypeIdentifiers.IntType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .ListVarint(let subtype):
                try TypeIdentifiers.ListVarintType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .MutableText(let subtype):
                try TypeIdentifiers.MutableTextType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .MutableTextRequest(let subtype):
                try TypeIdentifiers.MutableTextRequestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .MutableTextResponse(let subtype):
                try TypeIdentifiers.MutableTextResponseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .Nothing:
                try TypeIdentifiers.NothingType.saveDaydream(connection)

            case .StringBuiltin(let subtype):
                try TypeIdentifiers.StringType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .TextBuiltin(let subtype):
                try TypeIdentifiers.TextType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .TextList(let subtype):
                try TypeIdentifiers.TextListType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .True:
                try TypeIdentifiers.TrueType.saveDaydream(connection)

            case .Varint(let bignum):
                try TypeIdentifiers.VarintType.saveDaydream(connection)
                try bignum.saveDaydream(connection)

            case .becomeDropFirst:
                try TypeIdentifiers.becomeDropFirstType.saveDaydream(connection)

            case .becomeDropFirst_request:
                try TypeIdentifiers.becomeDropFirst_requestType.saveDaydream(connection)

            case .becomeDropFirst_response(let subtype):
                try TypeIdentifiers.becomeDropFirst_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeFirst:
                try TypeIdentifiers.becomeFirstType.saveDaydream(connection)

            case .becomeFirst_request:
                try TypeIdentifiers.becomeFirst_requestType.saveDaydream(connection)

            case .becomeFirst_response(let subtype):
                try TypeIdentifiers.becomeFirst_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeLast:
                try TypeIdentifiers.becomeLastType.saveDaydream(connection)

            case .becomeLast_request:
                try TypeIdentifiers.becomeLast_requestType.saveDaydream(connection)

            case .becomeLast_response(let subtype):
                try TypeIdentifiers.becomeLast_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeReverse:
                try TypeIdentifiers.becomeReverseType.saveDaydream(connection)

            case .becomeReverse_request:
                try TypeIdentifiers.becomeReverse_requestType.saveDaydream(connection)

            case .becomeReverse_response:
                try TypeIdentifiers.becomeReverse_responseType.saveDaydream(connection)

            case .becomeTrimmed:
                try TypeIdentifiers.becomeTrimmedType.saveDaydream(connection)

            case .becomeTrimmed_request:
                try TypeIdentifiers.becomeTrimmed_requestType.saveDaydream(connection)

            case .becomeTrimmed_response:
                try TypeIdentifiers.becomeTrimmed_responseType.saveDaydream(connection)

            case .becomeUppercase:
                try TypeIdentifiers.becomeUppercaseType.saveDaydream(connection)

            case .becomeUppercaseFirstLetter:
                try TypeIdentifiers.becomeUppercaseFirstLetterType.saveDaydream(connection)

            case .becomeUppercaseFirstLetter_request:
                try TypeIdentifiers.becomeUppercaseFirstLetter_requestType.saveDaydream(connection)

            case .becomeUppercaseFirstLetter_response(let subtype):
                try TypeIdentifiers.becomeUppercaseFirstLetter_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeUppercase_request:
                try TypeIdentifiers.becomeUppercase_requestType.saveDaydream(connection)

            case .becomeUppercase_response:
                try TypeIdentifiers.becomeUppercase_responseType.saveDaydream(connection)

            case .convertFromBase64:
                try TypeIdentifiers.convertFromBase64Type.saveDaydream(connection)

            case .convertFromBase64_request:
                try TypeIdentifiers.convertFromBase64_requestType.saveDaydream(connection)

            case .convertFromBase64_response(let subtype):
                try TypeIdentifiers.convertFromBase64_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .convertFromHex:
                try TypeIdentifiers.convertFromHexType.saveDaydream(connection)

            case .convertFromHex_request:
                try TypeIdentifiers.convertFromHex_requestType.saveDaydream(connection)

            case .convertFromHex_response(let subtype):
                try TypeIdentifiers.convertFromHex_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .convertToBase64:
                try TypeIdentifiers.convertToBase64Type.saveDaydream(connection)

            case .convertToBase64_request:
                try TypeIdentifiers.convertToBase64_requestType.saveDaydream(connection)

            case .convertToBase64_response:
                try TypeIdentifiers.convertToBase64_responseType.saveDaydream(connection)

            case .convertToHex:
                try TypeIdentifiers.convertToHexType.saveDaydream(connection)

            case .convertToHex_request:
                try TypeIdentifiers.convertToHex_requestType.saveDaydream(connection)

            case .convertToHex_response:
                try TypeIdentifiers.convertToHex_responseType.saveDaydream(connection)

            case .count:
                try TypeIdentifiers.countType.saveDaydream(connection)

            case .count_request:
                try TypeIdentifiers.count_requestType.saveDaydream(connection)

            case .count_response(let subtype):
                try TypeIdentifiers.count_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .dropFirst:
                try TypeIdentifiers.dropFirstType.saveDaydream(connection)

            case .dropFirst_request:
                try TypeIdentifiers.dropFirst_requestType.saveDaydream(connection)

            case .dropFirst_response(let subtype):
                try TypeIdentifiers.dropFirst_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .dropFirst_response_value(let subtype):
                try TypeIdentifiers.dropFirst_response_valueType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .fan:
                try TypeIdentifiers.fanType.saveDaydream(connection)

            case .fan_request:
                try TypeIdentifiers.fan_requestType.saveDaydream(connection)

            case .fan_response(let subtype):
                try TypeIdentifiers.fan_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .first:
                try TypeIdentifiers.firstType.saveDaydream(connection)

            case .first_request:
                try TypeIdentifiers.first_requestType.saveDaydream(connection)

            case .first_response(let subtype):
                try TypeIdentifiers.first_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .first_response_value(let subtype):
                try TypeIdentifiers.first_response_valueType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .isEmpty:
                try TypeIdentifiers.isEmptyType.saveDaydream(connection)

            case .isEmpty_request:
                try TypeIdentifiers.isEmpty_requestType.saveDaydream(connection)

            case .isEmpty_response(let subtype):
                try TypeIdentifiers.isEmpty_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .last:
                try TypeIdentifiers.lastType.saveDaydream(connection)

            case .last_request:
                try TypeIdentifiers.last_requestType.saveDaydream(connection)

            case .last_response(let subtype):
                try TypeIdentifiers.last_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .last_response_value(let subtype):
                try TypeIdentifiers.last_response_valueType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .reverse:
                try TypeIdentifiers.reverseType.saveDaydream(connection)

            case .reverse_request:
                try TypeIdentifiers.reverse_requestType.saveDaydream(connection)

            case .reverse_response(let subtype):
                try TypeIdentifiers.reverse_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .toBase64:
                try TypeIdentifiers.toBase64Type.saveDaydream(connection)

            case .toBase64_request:
                try TypeIdentifiers.toBase64_requestType.saveDaydream(connection)

            case .toBase64_response(let subtype):
                try TypeIdentifiers.toBase64_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .toHex:
                try TypeIdentifiers.toHexType.saveDaydream(connection)

            case .toHex_request:
                try TypeIdentifiers.toHex_requestType.saveDaydream(connection)

            case .toHex_response(let subtype):
                try TypeIdentifiers.toHex_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .toText:
                try TypeIdentifiers.toTextType.saveDaydream(connection)

            case .toText_request:
                try TypeIdentifiers.toText_requestType.saveDaydream(connection)

            case .toText_response(let subtype):
                try TypeIdentifiers.toText_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .toUTF8Data:
                try TypeIdentifiers.toUTF8DataType.saveDaydream(connection)

            case .toUTF8Data_request:
                try TypeIdentifiers.toUTF8Data_requestType.saveDaydream(connection)

            case .toUTF8Data_response(let subtype):
                try TypeIdentifiers.toUTF8Data_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .toUTF8String:
                try TypeIdentifiers.toUTF8StringType.saveDaydream(connection)

            case .toUTF8String_request:
                try TypeIdentifiers.toUTF8String_requestType.saveDaydream(connection)

            case .toUTF8String_response(let subtype):
                try TypeIdentifiers.toUTF8String_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .trim:
                try TypeIdentifiers.trimType.saveDaydream(connection)

            case .trim_request:
                try TypeIdentifiers.trim_requestType.saveDaydream(connection)

            case .trim_response(let subtype):
                try TypeIdentifiers.trim_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .uppercase:
                try TypeIdentifiers.uppercaseType.saveDaydream(connection)

            case .uppercaseFirstLetter:
                try TypeIdentifiers.uppercaseFirstLetterType.saveDaydream(connection)

            case .uppercaseFirstLetter_request:
                try TypeIdentifiers.uppercaseFirstLetter_requestType.saveDaydream(connection)

            case .uppercaseFirstLetter_response(let subtype):
                try TypeIdentifiers.uppercaseFirstLetter_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .uppercaseFirstLetter_response_value(let subtype):
                try TypeIdentifiers.uppercaseFirstLetter_response_valueType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .uppercase_request:
                try TypeIdentifiers.uppercase_requestType.saveDaydream(connection)

            case .uppercase_response(let subtype):
                try TypeIdentifiers.uppercase_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)
        }
    }

    public init(daydream connection: Transmission.Connection) throws
    {
        let type = try TypeIdentifiers(daydream: connection)

        switch type
        {
            case .BoolType:
                let subtype = try Bool(daydream: connection)
                self = .BoolBuiltin(subtype)

            case .BooleanType:
                let subtype = try BooleanValue(daydream: connection)
                self = .Boolean(subtype)

            case .DataType:
                let subtype = try Data(daydream: connection)
                self = .DataBuiltin(subtype)

            case .ErrorType:
                let subtype = try ErrorValue(daydream: connection)
                self = .Error(subtype)

            case .FalseType:
                self = .False

            case .IntType:
                let subtype = try Int(daydream: connection)
                self = .IntBuiltin(subtype)

            case .ListVarintType:
                let subtype = try [BInt](daydream: connection)
                self = .ListVarint(subtype)

            case .MutableTextType:
                let subtype = try MutableTextValue(daydream: connection)
                self = .MutableText(subtype)

            case .MutableTextRequestType:
                let subtype = try MutableTextRequestValue(daydream: connection)
                self = .MutableTextRequest(subtype)

            case .MutableTextResponseType:
                let subtype = try MutableTextResponseValue(daydream: connection)
                self = .MutableTextResponse(subtype)

            case .NothingType:
                self = .Nothing

            case .StringType:
                self = .StringBuiltin(try String(daydream: connection))

            case .TextType:
                let subtype = try Text(daydream: connection)
                self = .TextBuiltin(subtype)

            case .TextListType:
                let subtype = try [Text](daydream: connection)
                self = .TextList(subtype)

            case .TrueType:
                self = .True

            case .VarintType:
                let bignum = try BInt(daydream: connection)
                self = .Varint(bignum)

            case .becomeDropFirstType:
                self = .becomeDropFirst

            case .becomeDropFirst_requestType:
                self = .becomeDropFirst_request

            case .becomeDropFirst_responseType:
                let subtype = try becomeDropFirst_responseValue(daydream: connection)
                self = .becomeDropFirst_response(subtype)

            case .becomeFirstType:
                self = .becomeFirst

            case .becomeFirst_requestType:
                self = .becomeFirst_request

            case .becomeFirst_responseType:
                let subtype = try becomeFirst_responseValue(daydream: connection)
                self = .becomeFirst_response(subtype)

            case .becomeLastType:
                self = .becomeLast

            case .becomeLast_requestType:
                self = .becomeLast_request

            case .becomeLast_responseType:
                let subtype = try becomeLast_responseValue(daydream: connection)
                self = .becomeLast_response(subtype)

            case .becomeReverseType:
                self = .becomeReverse

            case .becomeReverse_requestType:
                self = .becomeReverse_request

            case .becomeReverse_responseType:
                self = .becomeReverse_response

            case .becomeTrimmedType:
                self = .becomeTrimmed

            case .becomeTrimmed_requestType:
                self = .becomeTrimmed_request

            case .becomeTrimmed_responseType:
                self = .becomeTrimmed_response

            case .becomeUppercaseType:
                self = .becomeUppercase

            case .becomeUppercaseFirstLetterType:
                self = .becomeUppercaseFirstLetter

            case .becomeUppercaseFirstLetter_requestType:
                self = .becomeUppercaseFirstLetter_request

            case .becomeUppercaseFirstLetter_responseType:
                let subtype = try becomeUppercaseFirstLetter_responseValue(daydream: connection)
                self = .becomeUppercaseFirstLetter_response(subtype)

            case .becomeUppercase_requestType:
                self = .becomeUppercase_request

            case .becomeUppercase_responseType:
                self = .becomeUppercase_response

            case .convertFromBase64Type:
                self = .convertFromBase64

            case .convertFromBase64_requestType:
                self = .convertFromBase64_request

            case .convertFromBase64_responseType:
                let subtype = try convertFromBase64_responseValue(daydream: connection)
                self = .convertFromBase64_response(subtype)

            case .convertFromHexType:
                self = .convertFromHex

            case .convertFromHex_requestType:
                self = .convertFromHex_request

            case .convertFromHex_responseType:
                let subtype = try convertFromHex_responseValue(daydream: connection)
                self = .convertFromHex_response(subtype)

            case .convertToBase64Type:
                self = .convertToBase64

            case .convertToBase64_requestType:
                self = .convertToBase64_request

            case .convertToBase64_responseType:
                self = .convertToBase64_response

            case .convertToHexType:
                self = .convertToHex

            case .convertToHex_requestType:
                self = .convertToHex_request

            case .convertToHex_responseType:
                self = .convertToHex_response

            case .countType:
                self = .count

            case .count_requestType:
                self = .count_request

            case .count_responseType:
                let subtype = try count_responseValue(daydream: connection)
                self = .count_response(subtype)

            case .dropFirstType:
                self = .dropFirst

            case .dropFirst_requestType:
                self = .dropFirst_request

            case .dropFirst_responseType:
                let subtype = try dropFirst_responseValue(daydream: connection)
                self = .dropFirst_response(subtype)

            case .dropFirst_response_valueType:
                let subtype = try dropFirst_response_valueValue(daydream: connection)
                self = .dropFirst_response_value(subtype)

            case .fanType:
                self = .fan

            case .fan_requestType:
                self = .fan_request

            case .fan_responseType:
                let subtype = try fan_responseValue(daydream: connection)
                self = .fan_response(subtype)

            case .firstType:
                self = .first

            case .first_requestType:
                self = .first_request

            case .first_responseType:
                let subtype = try first_responseValue(daydream: connection)
                self = .first_response(subtype)

            case .first_response_valueType:
                let subtype = try first_response_valueValue(daydream: connection)
                self = .first_response_value(subtype)

            case .isEmptyType:
                self = .isEmpty

            case .isEmpty_requestType:
                self = .isEmpty_request

            case .isEmpty_responseType:
                let subtype = try isEmpty_responseValue(daydream: connection)
                self = .isEmpty_response(subtype)

            case .lastType:
                self = .last

            case .last_requestType:
                self = .last_request

            case .last_responseType:
                let subtype = try last_responseValue(daydream: connection)
                self = .last_response(subtype)

            case .last_response_valueType:
                let subtype = try last_response_valueValue(daydream: connection)
                self = .last_response_value(subtype)

            case .reverseType:
                self = .reverse

            case .reverse_requestType:
                self = .reverse_request

            case .reverse_responseType:
                let subtype = try reverse_responseValue(daydream: connection)
                self = .reverse_response(subtype)

            case .toBase64Type:
                self = .toBase64

            case .toBase64_requestType:
                self = .toBase64_request

            case .toBase64_responseType:
                let subtype = try toBase64_responseValue(daydream: connection)
                self = .toBase64_response(subtype)

            case .toHexType:
                self = .toHex

            case .toHex_requestType:
                self = .toHex_request

            case .toHex_responseType:
                let subtype = try toHex_responseValue(daydream: connection)
                self = .toHex_response(subtype)

            case .toTextType:
                self = .toText

            case .toText_requestType:
                self = .toText_request

            case .toText_responseType:
                let subtype = try toText_responseValue(daydream: connection)
                self = .toText_response(subtype)

            case .toUTF8DataType:
                self = .toUTF8Data

            case .toUTF8Data_requestType:
                self = .toUTF8Data_request

            case .toUTF8Data_responseType:
                let subtype = try toUTF8Data_responseValue(daydream: connection)
                self = .toUTF8Data_response(subtype)

            case .toUTF8StringType:
                self = .toUTF8String

            case .toUTF8String_requestType:
                self = .toUTF8String_request

            case .toUTF8String_responseType:
                let subtype = try toUTF8String_responseValue(daydream: connection)
                self = .toUTF8String_response(subtype)

            case .trimType:
                self = .trim

            case .trim_requestType:
                self = .trim_request

            case .trim_responseType:
                let subtype = try trim_responseValue(daydream: connection)
                self = .trim_response(subtype)

            case .uppercaseType:
                self = .uppercase

            case .uppercaseFirstLetterType:
                self = .uppercaseFirstLetter

            case .uppercaseFirstLetter_requestType:
                self = .uppercaseFirstLetter_request

            case .uppercaseFirstLetter_responseType:
                let subtype = try uppercaseFirstLetter_responseValue(daydream: connection)
                self = .uppercaseFirstLetter_response(subtype)

            case .uppercaseFirstLetter_response_valueType:
                let subtype = try uppercaseFirstLetter_response_valueValue(daydream: connection)
                self = .uppercaseFirstLetter_response_value(subtype)

            case .uppercase_requestType:
                self = .uppercase_request

            case .uppercase_responseType:
                let subtype = try uppercase_responseValue(daydream: connection)
                self = .uppercase_response(subtype)

            default:
                throw DaydreamError.conversionFailed
        }
    }
}

public enum DaydreamError: Error
{
    case conversionFailed
    case readFailed
    case writeFailed
}
