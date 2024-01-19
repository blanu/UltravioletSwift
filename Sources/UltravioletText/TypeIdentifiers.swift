//
//  TypeIdentifiers.swift
//
//
//  Created by the Daydream Compiler on 2024-01-19 22:58:08 +0000.
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
    case MaybeTextType = 13
    case MutableTextType = 14
    case MutableTextRequestType = 15
    case MutableTextResponseType = 16
    case NothingType = 17
    case StringType = 18
    case TextType = 19
    case TextListType = 20
    case TrueType = 21
    case VarintType = 22
    case appendType = 23
    case append_requestType = 24
    case append_responseType = 25
    case append_response_valueType = 26
    case becomeType = 27
    case becomeAppendedType = 28
    case becomeAppended_requestType = 29
    case becomeAppended_responseType = 30
    case becomeDropFirstType = 31
    case becomeDropFirst_requestType = 32
    case becomeDropFirst_responseType = 33
    case becomeDropPrefixType = 34
    case becomeDropPrefix_requestType = 35
    case becomeDropPrefix_responseType = 36
    case becomeFirstType = 37
    case becomeFirst_requestType = 38
    case becomeFirst_responseType = 39
    case becomeJoinedType = 40
    case becomeJoined_requestType = 41
    case becomeJoined_responseType = 42
    case becomeLastType = 43
    case becomeLast_requestType = 44
    case becomeLast_responseType = 45
    case becomePrependedType = 46
    case becomePrepended_requestType = 47
    case becomePrepended_responseType = 48
    case becomeReverseType = 49
    case becomeReverse_requestType = 50
    case becomeReverse_responseType = 51
    case becomeSplitType = 52
    case becomeSplitAtHeadType = 53
    case becomeSplitAtHead_argumentsType = 54
    case becomeSplitAtHead_requestType = 55
    case becomeSplitAtHead_responseType = 56
    case becomeSplitAtTailType = 57
    case becomeSplitAtTail_argumentsType = 58
    case becomeSplitAtTail_requestType = 59
    case becomeSplitAtTail_responseType = 60
    case becomeSplitOnHeadType = 61
    case becomeSplitOnHead_requestType = 62
    case becomeSplitOnHead_responseType = 63
    case becomeSplitOnLastHeadType = 64
    case becomeSplitOnLastHead_requestType = 65
    case becomeSplitOnLastHead_responseType = 66
    case becomeSplitOnLastTailType = 67
    case becomeSplitOnLastTail_requestType = 68
    case becomeSplitOnLastTail_responseType = 69
    case becomeSplitOnTailType = 70
    case becomeSplitOnTail_requestType = 71
    case becomeSplitOnTail_responseType = 72
    case becomeSplit_argumentsType = 73
    case becomeSplit_requestType = 74
    case becomeSplit_responseType = 75
    case becomeSubstringType = 76
    case becomeSubstring_argumentsType = 77
    case becomeSubstring_requestType = 78
    case becomeSubstring_responseType = 79
    case becomeTrimmedType = 80
    case becomeTrimmed_requestType = 81
    case becomeTrimmed_responseType = 82
    case becomeUppercaseType = 83
    case becomeUppercaseFirstLetterType = 84
    case becomeUppercaseFirstLetter_requestType = 85
    case becomeUppercaseFirstLetter_responseType = 86
    case becomeUppercase_requestType = 87
    case becomeUppercase_responseType = 88
    case become_requestType = 89
    case become_responseType = 90
    case containsSubstringType = 91
    case containsSubstring_requestType = 92
    case containsSubstring_responseType = 93
    case containsSubstring_response_valueType = 94
    case convertFromBase64Type = 95
    case convertFromBase64_requestType = 96
    case convertFromBase64_responseType = 97
    case convertFromHexType = 98
    case convertFromHex_requestType = 99
    case convertFromHex_responseType = 100
    case convertToBase64Type = 101
    case convertToBase64_requestType = 102
    case convertToBase64_responseType = 103
    case convertToHexType = 104
    case convertToHex_requestType = 105
    case convertToHex_responseType = 106
    case countType = 107
    case count_requestType = 108
    case count_responseType = 109
    case dropFirstType = 110
    case dropFirst_requestType = 111
    case dropFirst_responseType = 112
    case dropFirst_response_valueType = 113
    case dropPrefixType = 114
    case dropPrefix_requestType = 115
    case dropPrefix_responseType = 116
    case dropPrefix_response_valueType = 117
    case fanType = 118
    case fan_requestType = 119
    case fan_responseType = 120
    case firstType = 121
    case first_requestType = 122
    case first_responseType = 123
    case first_response_valueType = 124
    case indexOfType = 125
    case indexOf_requestType = 126
    case indexOf_responseType = 127
    case indexOf_response_valueType = 128
    case isEmptyType = 129
    case isEmpty_requestType = 130
    case isEmpty_responseType = 131
    case joinType = 132
    case join_requestType = 133
    case join_responseType = 134
    case join_response_valueType = 135
    case lastType = 136
    case lastIndexOfType = 137
    case lastIndexOf_requestType = 138
    case lastIndexOf_responseType = 139
    case lastIndexOf_response_valueType = 140
    case last_requestType = 141
    case last_responseType = 142
    case last_response_valueType = 143
    case linesType = 144
    case lines_requestType = 145
    case lines_responseType = 146
    case lines_response_valueType = 147
    case prependType = 148
    case prepend_requestType = 149
    case prepend_responseType = 150
    case prepend_response_valueType = 151
    case reverseType = 152
    case reverse_requestType = 153
    case reverse_responseType = 154
    case splitType = 155
    case split_requestType = 156
    case split_responseType = 157
    case split_response_valueType = 158
    case startsWithType = 159
    case startsWith_requestType = 160
    case startsWith_responseType = 161
    case startsWith_response_valueType = 162
    case substringType = 163
    case substring_argumentsType = 164
    case substring_requestType = 165
    case substring_responseType = 166
    case substring_response_valueType = 167
    case toBase64Type = 168
    case toBase64_requestType = 169
    case toBase64_responseType = 170
    case toHexType = 171
    case toHex_requestType = 172
    case toHex_responseType = 173
    case toTextType = 174
    case toText_requestType = 175
    case toText_responseType = 176
    case toUTF8DataType = 177
    case toUTF8Data_requestType = 178
    case toUTF8Data_responseType = 179
    case toUTF8StringType = 180
    case toUTF8String_requestType = 181
    case toUTF8String_responseType = 182
    case trimType = 183
    case trim_requestType = 184
    case trim_responseType = 185
    case uppercaseType = 186
    case uppercaseFirstLetterType = 187
    case uppercaseFirstLetter_requestType = 188
    case uppercaseFirstLetter_responseType = 189
    case uppercaseFirstLetter_response_valueType = 190
    case uppercase_requestType = 191
    case uppercase_responseType = 192
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
    case MaybeText(MaybeTextValue)
    case MutableText(MutableTextValue)
    case MutableTextRequest(MutableTextRequestValue)
    case MutableTextResponse(MutableTextResponseValue)
    case Nothing
    case StringBuiltin(String)
    case TextBuiltin(Text)
    case TextList([Text])
    case True
    case Varint(BInt)
    case append
    case append_request(append_requestValue)
    case append_response(append_responseValue)
    case append_response_value(append_response_valueValue)
    case become
    case becomeAppended
    case becomeAppended_request(becomeAppended_requestValue)
    case becomeAppended_response
    case becomeDropFirst
    case becomeDropFirst_request
    case becomeDropFirst_response(becomeDropFirst_responseValue)
    case becomeDropPrefix
    case becomeDropPrefix_request(becomeDropPrefix_requestValue)
    case becomeDropPrefix_response(becomeDropPrefix_responseValue)
    case becomeFirst
    case becomeFirst_request
    case becomeFirst_response(becomeFirst_responseValue)
    case becomeJoined
    case becomeJoined_request(becomeJoined_requestValue)
    case becomeJoined_response
    case becomeLast
    case becomeLast_request
    case becomeLast_response(becomeLast_responseValue)
    case becomePrepended
    case becomePrepended_request(becomePrepended_requestValue)
    case becomePrepended_response
    case becomeReverse
    case becomeReverse_request
    case becomeReverse_response
    case becomeSplit
    case becomeSplitAtHead
    case becomeSplitAtHead_arguments(becomeSplitAtHead_argumentsValue)
    case becomeSplitAtHead_request(becomeSplitAtHead_requestValue)
    case becomeSplitAtHead_response(becomeSplitAtHead_responseValue)
    case becomeSplitAtTail
    case becomeSplitAtTail_arguments(becomeSplitAtTail_argumentsValue)
    case becomeSplitAtTail_request(becomeSplitAtTail_requestValue)
    case becomeSplitAtTail_response(becomeSplitAtTail_responseValue)
    case becomeSplitOnHead
    case becomeSplitOnHead_request(becomeSplitOnHead_requestValue)
    case becomeSplitOnHead_response(becomeSplitOnHead_responseValue)
    case becomeSplitOnLastHead
    case becomeSplitOnLastHead_request(becomeSplitOnLastHead_requestValue)
    case becomeSplitOnLastHead_response(becomeSplitOnLastHead_responseValue)
    case becomeSplitOnLastTail
    case becomeSplitOnLastTail_request(becomeSplitOnLastTail_requestValue)
    case becomeSplitOnLastTail_response(becomeSplitOnLastTail_responseValue)
    case becomeSplitOnTail
    case becomeSplitOnTail_request(becomeSplitOnTail_requestValue)
    case becomeSplitOnTail_response(becomeSplitOnTail_responseValue)
    case becomeSplit_arguments(becomeSplit_argumentsValue)
    case becomeSplit_request(becomeSplit_requestValue)
    case becomeSplit_response(becomeSplit_responseValue)
    case becomeSubstring
    case becomeSubstring_arguments(becomeSubstring_argumentsValue)
    case becomeSubstring_request(becomeSubstring_requestValue)
    case becomeSubstring_response(becomeSubstring_responseValue)
    case becomeTrimmed
    case becomeTrimmed_request
    case becomeTrimmed_response
    case becomeUppercase
    case becomeUppercaseFirstLetter
    case becomeUppercaseFirstLetter_request
    case becomeUppercaseFirstLetter_response(becomeUppercaseFirstLetter_responseValue)
    case becomeUppercase_request
    case becomeUppercase_response
    case become_request(become_requestValue)
    case become_response
    case containsSubstring
    case containsSubstring_request(containsSubstring_requestValue)
    case containsSubstring_response(containsSubstring_responseValue)
    case containsSubstring_response_value(containsSubstring_response_valueValue)
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
    case dropPrefix
    case dropPrefix_request(dropPrefix_requestValue)
    case dropPrefix_response(dropPrefix_responseValue)
    case dropPrefix_response_value(dropPrefix_response_valueValue)
    case fan
    case fan_request
    case fan_response(fan_responseValue)
    case first
    case first_request
    case first_response(first_responseValue)
    case first_response_value(first_response_valueValue)
    case indexOf
    case indexOf_request(indexOf_requestValue)
    case indexOf_response(indexOf_responseValue)
    case indexOf_response_value(indexOf_response_valueValue)
    case isEmpty
    case isEmpty_request
    case isEmpty_response(isEmpty_responseValue)
    case join
    case join_request(join_requestValue)
    case join_response(join_responseValue)
    case join_response_value(join_response_valueValue)
    case last
    case lastIndexOf
    case lastIndexOf_request(lastIndexOf_requestValue)
    case lastIndexOf_response(lastIndexOf_responseValue)
    case lastIndexOf_response_value(lastIndexOf_response_valueValue)
    case last_request
    case last_response(last_responseValue)
    case last_response_value(last_response_valueValue)
    case lines
    case lines_request(lines_requestValue)
    case lines_response(lines_responseValue)
    case lines_response_value(lines_response_valueValue)
    case prepend
    case prepend_request(prepend_requestValue)
    case prepend_response(prepend_responseValue)
    case prepend_response_value(prepend_response_valueValue)
    case reverse
    case reverse_request
    case reverse_response(reverse_responseValue)
    case split
    case split_request(split_requestValue)
    case split_response(split_responseValue)
    case split_response_value(split_response_valueValue)
    case startsWith
    case startsWith_request(startsWith_requestValue)
    case startsWith_response(startsWith_responseValue)
    case startsWith_response_value(startsWith_response_valueValue)
    case substring
    case substring_arguments(substring_argumentsValue)
    case substring_request(substring_requestValue)
    case substring_response(substring_responseValue)
    case substring_response_value(substring_response_valueValue)
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



public enum MaybeTextValue: Equatable, Codable, Daydreamable
{
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        switch self
        {
            case .TextValue(let subtype):
                try TypeIdentifiers.TextType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .Nothing:
                try TypeIdentifiers.NothingType.saveDaydream(connection)
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
            case .TextType:
                let value = try Text(daydream: connection)
                self = .TextValue(value)

            case .NothingType:
                self = .Nothing

            default:
                throw DaydreamError.conversionFailed
        }
    }

    case TextValue(Text)
    case Nothing
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

            case .become:
                try TypeIdentifiers.becomeType.saveDaydream(connection)

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

            case .substring:
                try TypeIdentifiers.substringType.saveDaydream(connection)

            case .becomeSubstring:
                try TypeIdentifiers.becomeSubstringType.saveDaydream(connection)

            case .indexOf:
                try TypeIdentifiers.indexOfType.saveDaydream(connection)

            case .lastIndexOf:
                try TypeIdentifiers.lastIndexOfType.saveDaydream(connection)

            case .split:
                try TypeIdentifiers.splitType.saveDaydream(connection)

            case .becomeSplit:
                try TypeIdentifiers.becomeSplitType.saveDaydream(connection)

            case .becomeSplitOnHead:
                try TypeIdentifiers.becomeSplitOnHeadType.saveDaydream(connection)

            case .becomeSplitOnTail:
                try TypeIdentifiers.becomeSplitOnTailType.saveDaydream(connection)

            case .becomeSplitOnLastHead:
                try TypeIdentifiers.becomeSplitOnLastHeadType.saveDaydream(connection)

            case .becomeSplitOnLastTail:
                try TypeIdentifiers.becomeSplitOnLastTailType.saveDaydream(connection)

            case .becomeSplitAtHead:
                try TypeIdentifiers.becomeSplitAtHeadType.saveDaydream(connection)

            case .becomeSplitAtTail:
                try TypeIdentifiers.becomeSplitAtTailType.saveDaydream(connection)

            case .trim:
                try TypeIdentifiers.trimType.saveDaydream(connection)

            case .becomeTrimmed:
                try TypeIdentifiers.becomeTrimmedType.saveDaydream(connection)

            case .join:
                try TypeIdentifiers.joinType.saveDaydream(connection)

            case .becomeJoined:
                try TypeIdentifiers.becomeJoinedType.saveDaydream(connection)

            case .prepend:
                try TypeIdentifiers.prependType.saveDaydream(connection)

            case .append:
                try TypeIdentifiers.appendType.saveDaydream(connection)

            case .becomePrepended:
                try TypeIdentifiers.becomePrependedType.saveDaydream(connection)

            case .becomeAppended:
                try TypeIdentifiers.becomeAppendedType.saveDaydream(connection)

            case .containsSubstring:
                try TypeIdentifiers.containsSubstringType.saveDaydream(connection)

            case .startsWith:
                try TypeIdentifiers.startsWithType.saveDaydream(connection)

            case .count:
                try TypeIdentifiers.countType.saveDaydream(connection)

            case .isEmpty:
                try TypeIdentifiers.isEmptyType.saveDaydream(connection)

            case .dropFirst:
                try TypeIdentifiers.dropFirstType.saveDaydream(connection)

            case .becomeDropFirst:
                try TypeIdentifiers.becomeDropFirstType.saveDaydream(connection)

            case .dropPrefix:
                try TypeIdentifiers.dropPrefixType.saveDaydream(connection)

            case .becomeDropPrefix:
                try TypeIdentifiers.becomeDropPrefixType.saveDaydream(connection)

            case .uppercase:
                try TypeIdentifiers.uppercaseType.saveDaydream(connection)

            case .becomeUppercase:
                try TypeIdentifiers.becomeUppercaseType.saveDaydream(connection)

            case .uppercaseFirstLetter:
                try TypeIdentifiers.uppercaseFirstLetterType.saveDaydream(connection)

            case .becomeUppercaseFirstLetter:
                try TypeIdentifiers.becomeUppercaseFirstLetterType.saveDaydream(connection)

            case .lines:
                try TypeIdentifiers.linesType.saveDaydream(connection)

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

            case .becomeType:
                self = .become

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

            case .substringType:
                self = .substring

            case .becomeSubstringType:
                self = .becomeSubstring

            case .indexOfType:
                self = .indexOf

            case .lastIndexOfType:
                self = .lastIndexOf

            case .splitType:
                self = .split

            case .becomeSplitType:
                self = .becomeSplit

            case .becomeSplitOnHeadType:
                self = .becomeSplitOnHead

            case .becomeSplitOnTailType:
                self = .becomeSplitOnTail

            case .becomeSplitOnLastHeadType:
                self = .becomeSplitOnLastHead

            case .becomeSplitOnLastTailType:
                self = .becomeSplitOnLastTail

            case .becomeSplitAtHeadType:
                self = .becomeSplitAtHead

            case .becomeSplitAtTailType:
                self = .becomeSplitAtTail

            case .trimType:
                self = .trim

            case .becomeTrimmedType:
                self = .becomeTrimmed

            case .joinType:
                self = .join

            case .becomeJoinedType:
                self = .becomeJoined

            case .prependType:
                self = .prepend

            case .appendType:
                self = .append

            case .becomePrependedType:
                self = .becomePrepended

            case .becomeAppendedType:
                self = .becomeAppended

            case .containsSubstringType:
                self = .containsSubstring

            case .startsWithType:
                self = .startsWith

            case .countType:
                self = .count

            case .isEmptyType:
                self = .isEmpty

            case .dropFirstType:
                self = .dropFirst

            case .becomeDropFirstType:
                self = .becomeDropFirst

            case .dropPrefixType:
                self = .dropPrefix

            case .becomeDropPrefixType:
                self = .becomeDropPrefix

            case .uppercaseType:
                self = .uppercase

            case .becomeUppercaseType:
                self = .becomeUppercase

            case .uppercaseFirstLetterType:
                self = .uppercaseFirstLetter

            case .becomeUppercaseFirstLetterType:
                self = .becomeUppercaseFirstLetter

            case .linesType:
                self = .lines

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
    case become
    case toHex
    case convertFromHex
    case convertToHex
    case toBase64
    case convertFromBase64
    case convertToBase64
    case substring
    case becomeSubstring
    case indexOf
    case lastIndexOf
    case split
    case becomeSplit
    case becomeSplitOnHead
    case becomeSplitOnTail
    case becomeSplitOnLastHead
    case becomeSplitOnLastTail
    case becomeSplitAtHead
    case becomeSplitAtTail
    case trim
    case becomeTrimmed
    case join
    case becomeJoined
    case prepend
    case append
    case becomePrepended
    case becomeAppended
    case containsSubstring
    case startsWith
    case count
    case isEmpty
    case dropFirst
    case becomeDropFirst
    case dropPrefix
    case becomeDropPrefix
    case uppercase
    case becomeUppercase
    case uppercaseFirstLetter
    case becomeUppercaseFirstLetter
    case lines
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

            case .become_request(let subtype):
                try TypeIdentifiers.become_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

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

            case .substring_request(let subtype):
                try TypeIdentifiers.substring_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeSubstring_request(let subtype):
                try TypeIdentifiers.becomeSubstring_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .indexOf_request(let subtype):
                try TypeIdentifiers.indexOf_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .lastIndexOf_request(let subtype):
                try TypeIdentifiers.lastIndexOf_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .split_request(let subtype):
                try TypeIdentifiers.split_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeSplit_request(let subtype):
                try TypeIdentifiers.becomeSplit_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeSplitOnHead_request(let subtype):
                try TypeIdentifiers.becomeSplitOnHead_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeSplitOnTail_request(let subtype):
                try TypeIdentifiers.becomeSplitOnTail_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeSplitOnLastHead_request(let subtype):
                try TypeIdentifiers.becomeSplitOnLastHead_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeSplitOnLastTail_request(let subtype):
                try TypeIdentifiers.becomeSplitOnLastTail_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeSplitAtHead_request(let subtype):
                try TypeIdentifiers.becomeSplitAtHead_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeSplitAtTail_request(let subtype):
                try TypeIdentifiers.becomeSplitAtTail_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .trim_request:
                try TypeIdentifiers.trim_requestType.saveDaydream(connection)

            case .becomeTrimmed_request:
                try TypeIdentifiers.becomeTrimmed_requestType.saveDaydream(connection)

            case .join_request(let subtype):
                try TypeIdentifiers.join_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeJoined_request(let subtype):
                try TypeIdentifiers.becomeJoined_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .prepend_request(let subtype):
                try TypeIdentifiers.prepend_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .append_request(let subtype):
                try TypeIdentifiers.append_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomePrepended_request(let subtype):
                try TypeIdentifiers.becomePrepended_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeAppended_request(let subtype):
                try TypeIdentifiers.becomeAppended_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .containsSubstring_request(let subtype):
                try TypeIdentifiers.containsSubstring_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .startsWith_request(let subtype):
                try TypeIdentifiers.startsWith_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .count_request:
                try TypeIdentifiers.count_requestType.saveDaydream(connection)

            case .isEmpty_request:
                try TypeIdentifiers.isEmpty_requestType.saveDaydream(connection)

            case .dropFirst_request:
                try TypeIdentifiers.dropFirst_requestType.saveDaydream(connection)

            case .becomeDropFirst_request:
                try TypeIdentifiers.becomeDropFirst_requestType.saveDaydream(connection)

            case .dropPrefix_request(let subtype):
                try TypeIdentifiers.dropPrefix_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeDropPrefix_request(let subtype):
                try TypeIdentifiers.becomeDropPrefix_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .uppercase_request:
                try TypeIdentifiers.uppercase_requestType.saveDaydream(connection)

            case .becomeUppercase_request:
                try TypeIdentifiers.becomeUppercase_requestType.saveDaydream(connection)

            case .uppercaseFirstLetter_request:
                try TypeIdentifiers.uppercaseFirstLetter_requestType.saveDaydream(connection)

            case .becomeUppercaseFirstLetter_request:
                try TypeIdentifiers.becomeUppercaseFirstLetter_requestType.saveDaydream(connection)

            case .lines_request(let subtype):
                try TypeIdentifiers.lines_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

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

            case .become_requestType:
                let value = try become_requestValue(daydream: connection)

                self = .become_request(value)
                return

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

            case .substring_requestType:
                let value = try substring_requestValue(daydream: connection)

                self = .substring_request(value)
                return

            case .becomeSubstring_requestType:
                let value = try becomeSubstring_requestValue(daydream: connection)

                self = .becomeSubstring_request(value)
                return

            case .indexOf_requestType:
                let value = try indexOf_requestValue(daydream: connection)

                self = .indexOf_request(value)
                return

            case .lastIndexOf_requestType:
                let value = try lastIndexOf_requestValue(daydream: connection)

                self = .lastIndexOf_request(value)
                return

            case .split_requestType:
                let value = try split_requestValue(daydream: connection)

                self = .split_request(value)
                return

            case .becomeSplit_requestType:
                let value = try becomeSplit_requestValue(daydream: connection)

                self = .becomeSplit_request(value)
                return

            case .becomeSplitOnHead_requestType:
                let value = try becomeSplitOnHead_requestValue(daydream: connection)

                self = .becomeSplitOnHead_request(value)
                return

            case .becomeSplitOnTail_requestType:
                let value = try becomeSplitOnTail_requestValue(daydream: connection)

                self = .becomeSplitOnTail_request(value)
                return

            case .becomeSplitOnLastHead_requestType:
                let value = try becomeSplitOnLastHead_requestValue(daydream: connection)

                self = .becomeSplitOnLastHead_request(value)
                return

            case .becomeSplitOnLastTail_requestType:
                let value = try becomeSplitOnLastTail_requestValue(daydream: connection)

                self = .becomeSplitOnLastTail_request(value)
                return

            case .becomeSplitAtHead_requestType:
                let value = try becomeSplitAtHead_requestValue(daydream: connection)

                self = .becomeSplitAtHead_request(value)
                return

            case .becomeSplitAtTail_requestType:
                let value = try becomeSplitAtTail_requestValue(daydream: connection)

                self = .becomeSplitAtTail_request(value)
                return

            case .trim_requestType:
                self = .trim_request

            case .becomeTrimmed_requestType:
                self = .becomeTrimmed_request

            case .join_requestType:
                let value = try join_requestValue(daydream: connection)

                self = .join_request(value)
                return

            case .becomeJoined_requestType:
                let value = try becomeJoined_requestValue(daydream: connection)

                self = .becomeJoined_request(value)
                return

            case .prepend_requestType:
                let value = try prepend_requestValue(daydream: connection)

                self = .prepend_request(value)
                return

            case .append_requestType:
                let value = try append_requestValue(daydream: connection)

                self = .append_request(value)
                return

            case .becomePrepended_requestType:
                let value = try becomePrepended_requestValue(daydream: connection)

                self = .becomePrepended_request(value)
                return

            case .becomeAppended_requestType:
                let value = try becomeAppended_requestValue(daydream: connection)

                self = .becomeAppended_request(value)
                return

            case .containsSubstring_requestType:
                let value = try containsSubstring_requestValue(daydream: connection)

                self = .containsSubstring_request(value)
                return

            case .startsWith_requestType:
                let value = try startsWith_requestValue(daydream: connection)

                self = .startsWith_request(value)
                return

            case .count_requestType:
                self = .count_request

            case .isEmpty_requestType:
                self = .isEmpty_request

            case .dropFirst_requestType:
                self = .dropFirst_request

            case .becomeDropFirst_requestType:
                self = .becomeDropFirst_request

            case .dropPrefix_requestType:
                let value = try dropPrefix_requestValue(daydream: connection)

                self = .dropPrefix_request(value)
                return

            case .becomeDropPrefix_requestType:
                let value = try becomeDropPrefix_requestValue(daydream: connection)

                self = .becomeDropPrefix_request(value)
                return

            case .uppercase_requestType:
                self = .uppercase_request

            case .becomeUppercase_requestType:
                self = .becomeUppercase_request

            case .uppercaseFirstLetter_requestType:
                self = .uppercaseFirstLetter_request

            case .becomeUppercaseFirstLetter_requestType:
                self = .becomeUppercaseFirstLetter_request

            case .lines_requestType:
                let value = try lines_requestValue(daydream: connection)

                self = .lines_request(value)
                return

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
    case become_request(become_requestValue)
    case toHex_request
    case convertFromHex_request
    case convertToHex_request
    case toBase64_request
    case convertFromBase64_request
    case convertToBase64_request
    case substring_request(substring_requestValue)
    case becomeSubstring_request(becomeSubstring_requestValue)
    case indexOf_request(indexOf_requestValue)
    case lastIndexOf_request(lastIndexOf_requestValue)
    case split_request(split_requestValue)
    case becomeSplit_request(becomeSplit_requestValue)
    case becomeSplitOnHead_request(becomeSplitOnHead_requestValue)
    case becomeSplitOnTail_request(becomeSplitOnTail_requestValue)
    case becomeSplitOnLastHead_request(becomeSplitOnLastHead_requestValue)
    case becomeSplitOnLastTail_request(becomeSplitOnLastTail_requestValue)
    case becomeSplitAtHead_request(becomeSplitAtHead_requestValue)
    case becomeSplitAtTail_request(becomeSplitAtTail_requestValue)
    case trim_request
    case becomeTrimmed_request
    case join_request(join_requestValue)
    case becomeJoined_request(becomeJoined_requestValue)
    case prepend_request(prepend_requestValue)
    case append_request(append_requestValue)
    case becomePrepended_request(becomePrepended_requestValue)
    case becomeAppended_request(becomeAppended_requestValue)
    case containsSubstring_request(containsSubstring_requestValue)
    case startsWith_request(startsWith_requestValue)
    case count_request
    case isEmpty_request
    case dropFirst_request
    case becomeDropFirst_request
    case dropPrefix_request(dropPrefix_requestValue)
    case becomeDropPrefix_request(becomeDropPrefix_requestValue)
    case uppercase_request
    case becomeUppercase_request
    case uppercaseFirstLetter_request
    case becomeUppercaseFirstLetter_request
    case lines_request(lines_requestValue)
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

            case .become_response:
                try TypeIdentifiers.become_responseType.saveDaydream(connection)

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

            case .substring_response(let subtype):
                try TypeIdentifiers.substring_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeSubstring_response(let subtype):
                try TypeIdentifiers.becomeSubstring_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .indexOf_response(let subtype):
                try TypeIdentifiers.indexOf_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .lastIndexOf_response(let subtype):
                try TypeIdentifiers.lastIndexOf_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .split_response(let subtype):
                try TypeIdentifiers.split_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeSplit_response(let subtype):
                try TypeIdentifiers.becomeSplit_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeSplitOnHead_response(let subtype):
                try TypeIdentifiers.becomeSplitOnHead_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeSplitOnTail_response(let subtype):
                try TypeIdentifiers.becomeSplitOnTail_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeSplitOnLastHead_response(let subtype):
                try TypeIdentifiers.becomeSplitOnLastHead_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeSplitOnLastTail_response(let subtype):
                try TypeIdentifiers.becomeSplitOnLastTail_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeSplitAtHead_response(let subtype):
                try TypeIdentifiers.becomeSplitAtHead_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeSplitAtTail_response(let subtype):
                try TypeIdentifiers.becomeSplitAtTail_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .trim_response(let subtype):
                try TypeIdentifiers.trim_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeTrimmed_response:
                try TypeIdentifiers.becomeTrimmed_responseType.saveDaydream(connection)

            case .join_response(let subtype):
                try TypeIdentifiers.join_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeJoined_response:
                try TypeIdentifiers.becomeJoined_responseType.saveDaydream(connection)

            case .prepend_response(let subtype):
                try TypeIdentifiers.prepend_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .append_response(let subtype):
                try TypeIdentifiers.append_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomePrepended_response:
                try TypeIdentifiers.becomePrepended_responseType.saveDaydream(connection)

            case .becomeAppended_response:
                try TypeIdentifiers.becomeAppended_responseType.saveDaydream(connection)

            case .containsSubstring_response(let subtype):
                try TypeIdentifiers.containsSubstring_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .startsWith_response(let subtype):
                try TypeIdentifiers.startsWith_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

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

            case .dropPrefix_response(let subtype):
                try TypeIdentifiers.dropPrefix_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeDropPrefix_response(let subtype):
                try TypeIdentifiers.becomeDropPrefix_responseType.saveDaydream(connection)
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

            case .lines_response(let subtype):
                try TypeIdentifiers.lines_responseType.saveDaydream(connection)
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

            case .become_responseType:
                self = .become_response

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

            case .substring_responseType:
                let value = try substring_responseValue(daydream: connection)

                self = .substring_response(value)
                return

            case .becomeSubstring_responseType:
                let value = try becomeSubstring_responseValue(daydream: connection)

                self = .becomeSubstring_response(value)
                return

            case .indexOf_responseType:
                let value = try indexOf_responseValue(daydream: connection)

                self = .indexOf_response(value)
                return

            case .lastIndexOf_responseType:
                let value = try lastIndexOf_responseValue(daydream: connection)

                self = .lastIndexOf_response(value)
                return

            case .split_responseType:
                let value = try split_responseValue(daydream: connection)

                self = .split_response(value)
                return

            case .becomeSplit_responseType:
                let value = try becomeSplit_responseValue(daydream: connection)

                self = .becomeSplit_response(value)
                return

            case .becomeSplitOnHead_responseType:
                let value = try becomeSplitOnHead_responseValue(daydream: connection)

                self = .becomeSplitOnHead_response(value)
                return

            case .becomeSplitOnTail_responseType:
                let value = try becomeSplitOnTail_responseValue(daydream: connection)

                self = .becomeSplitOnTail_response(value)
                return

            case .becomeSplitOnLastHead_responseType:
                let value = try becomeSplitOnLastHead_responseValue(daydream: connection)

                self = .becomeSplitOnLastHead_response(value)
                return

            case .becomeSplitOnLastTail_responseType:
                let value = try becomeSplitOnLastTail_responseValue(daydream: connection)

                self = .becomeSplitOnLastTail_response(value)
                return

            case .becomeSplitAtHead_responseType:
                let value = try becomeSplitAtHead_responseValue(daydream: connection)

                self = .becomeSplitAtHead_response(value)
                return

            case .becomeSplitAtTail_responseType:
                let value = try becomeSplitAtTail_responseValue(daydream: connection)

                self = .becomeSplitAtTail_response(value)
                return

            case .trim_responseType:
                let value = try trim_responseValue(daydream: connection)

                self = .trim_response(value)
                return

            case .becomeTrimmed_responseType:
                self = .becomeTrimmed_response

            case .join_responseType:
                let value = try join_responseValue(daydream: connection)

                self = .join_response(value)
                return

            case .becomeJoined_responseType:
                self = .becomeJoined_response

            case .prepend_responseType:
                let value = try prepend_responseValue(daydream: connection)

                self = .prepend_response(value)
                return

            case .append_responseType:
                let value = try append_responseValue(daydream: connection)

                self = .append_response(value)
                return

            case .becomePrepended_responseType:
                self = .becomePrepended_response

            case .becomeAppended_responseType:
                self = .becomeAppended_response

            case .containsSubstring_responseType:
                let value = try containsSubstring_responseValue(daydream: connection)

                self = .containsSubstring_response(value)
                return

            case .startsWith_responseType:
                let value = try startsWith_responseValue(daydream: connection)

                self = .startsWith_response(value)
                return

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

            case .dropPrefix_responseType:
                let value = try dropPrefix_responseValue(daydream: connection)

                self = .dropPrefix_response(value)
                return

            case .becomeDropPrefix_responseType:
                let value = try becomeDropPrefix_responseValue(daydream: connection)

                self = .becomeDropPrefix_response(value)
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

            case .lines_responseType:
                let value = try lines_responseValue(daydream: connection)

                self = .lines_response(value)
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
    case become_response
    case toHex_response(toHex_responseValue)
    case convertFromHex_response(convertFromHex_responseValue)
    case convertToHex_response
    case toBase64_response(toBase64_responseValue)
    case convertFromBase64_response(convertFromBase64_responseValue)
    case convertToBase64_response
    case substring_response(substring_responseValue)
    case becomeSubstring_response(becomeSubstring_responseValue)
    case indexOf_response(indexOf_responseValue)
    case lastIndexOf_response(lastIndexOf_responseValue)
    case split_response(split_responseValue)
    case becomeSplit_response(becomeSplit_responseValue)
    case becomeSplitOnHead_response(becomeSplitOnHead_responseValue)
    case becomeSplitOnTail_response(becomeSplitOnTail_responseValue)
    case becomeSplitOnLastHead_response(becomeSplitOnLastHead_responseValue)
    case becomeSplitOnLastTail_response(becomeSplitOnLastTail_responseValue)
    case becomeSplitAtHead_response(becomeSplitAtHead_responseValue)
    case becomeSplitAtTail_response(becomeSplitAtTail_responseValue)
    case trim_response(trim_responseValue)
    case becomeTrimmed_response
    case join_response(join_responseValue)
    case becomeJoined_response
    case prepend_response(prepend_responseValue)
    case append_response(append_responseValue)
    case becomePrepended_response
    case becomeAppended_response
    case containsSubstring_response(containsSubstring_responseValue)
    case startsWith_response(startsWith_responseValue)
    case count_response(count_responseValue)
    case isEmpty_response(isEmpty_responseValue)
    case dropFirst_response(dropFirst_responseValue)
    case becomeDropFirst_response(becomeDropFirst_responseValue)
    case dropPrefix_response(dropPrefix_responseValue)
    case becomeDropPrefix_response(becomeDropPrefix_responseValue)
    case uppercase_response(uppercase_responseValue)
    case becomeUppercase_response
    case uppercaseFirstLetter_response(uppercaseFirstLetter_responseValue)
    case becomeUppercaseFirstLetter_response(becomeUppercaseFirstLetter_responseValue)
    case lines_response(lines_responseValue)
    case first_response(first_responseValue)
    case becomeFirst_response(becomeFirst_responseValue)
    case last_response(last_responseValue)
    case becomeLast_response(becomeLast_responseValue)
    case fan_response(fan_responseValue)
    case reverse_response(reverse_responseValue)
    case becomeReverse_response
}



public struct append_requestValue: Equatable, Codable, Daydreamable
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

public struct append_responseValue: Equatable, Codable, Daydreamable
{
    // Public computed properties
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
    try self.field1.saveDaydream(connection)
    }

    // Public Fields
    public let field1: append_response_valueValue

    // Public Inits
    public init(daydream connection: Transmission.Connection) throws
    {
        self.field1 = try append_response_valueValue(daydream: connection)
    }

    public init(_ field1: append_response_valueValue)
    {
        self.field1 = field1
    }
}

public struct append_response_valueValue: Equatable, Codable, Daydreamable
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

public struct becomeAppended_requestValue: Equatable, Codable, Daydreamable
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

public struct becomeDropPrefix_requestValue: Equatable, Codable, Daydreamable
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

public enum becomeDropPrefix_responseValue: Equatable, Codable, Daydreamable
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

public struct becomeJoined_requestValue: Equatable, Codable, Daydreamable
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

public struct becomePrepended_requestValue: Equatable, Codable, Daydreamable
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

public struct becomeSplitAtHead_argumentsValue: Equatable, Codable, Daydreamable
{
    // Public computed properties
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        try self.field1.saveDaydream(connection)
        try self.field2.saveDaydream(connection)
    }

    // Public Fields
    public let field1: Int
    public let field2: Int

    // Public Inits
    public init(daydream connection: Transmission.Connection) throws
    {
        self.field1 = try Int(daydream: connection)
        self.field2 = try Int(daydream: connection)
    }

    public init(_ field1: Int, _ field2: Int)
    {
        self.field1 = field1
        self.field2 = field2
    }
}

public struct becomeSplitAtHead_requestValue: Equatable, Codable, Daydreamable
{
    // Public computed properties
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
    try self.field1.saveDaydream(connection)
    }

    // Public Fields
    public let field1: becomeSplitAtHead_argumentsValue

    // Public Inits
    public init(daydream connection: Transmission.Connection) throws
    {
        self.field1 = try becomeSplitAtHead_argumentsValue(daydream: connection)
    }

    public init(_ field1: becomeSplitAtHead_argumentsValue)
    {
        self.field1 = field1
    }
}

public enum becomeSplitAtHead_responseValue: Equatable, Codable, Daydreamable
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

public struct becomeSplitAtTail_argumentsValue: Equatable, Codable, Daydreamable
{
    // Public computed properties
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        try self.field1.saveDaydream(connection)
        try self.field2.saveDaydream(connection)
    }

    // Public Fields
    public let field1: Int
    public let field2: Int

    // Public Inits
    public init(daydream connection: Transmission.Connection) throws
    {
        self.field1 = try Int(daydream: connection)
        self.field2 = try Int(daydream: connection)
    }

    public init(_ field1: Int, _ field2: Int)
    {
        self.field1 = field1
        self.field2 = field2
    }
}

public struct becomeSplitAtTail_requestValue: Equatable, Codable, Daydreamable
{
    // Public computed properties
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
    try self.field1.saveDaydream(connection)
    }

    // Public Fields
    public let field1: becomeSplitAtTail_argumentsValue

    // Public Inits
    public init(daydream connection: Transmission.Connection) throws
    {
        self.field1 = try becomeSplitAtTail_argumentsValue(daydream: connection)
    }

    public init(_ field1: becomeSplitAtTail_argumentsValue)
    {
        self.field1 = field1
    }
}

public enum becomeSplitAtTail_responseValue: Equatable, Codable, Daydreamable
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

public struct becomeSplitOnHead_requestValue: Equatable, Codable, Daydreamable
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

public enum becomeSplitOnHead_responseValue: Equatable, Codable, Daydreamable
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

public struct becomeSplitOnLastHead_requestValue: Equatable, Codable, Daydreamable
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

public enum becomeSplitOnLastHead_responseValue: Equatable, Codable, Daydreamable
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

public struct becomeSplitOnLastTail_requestValue: Equatable, Codable, Daydreamable
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

public enum becomeSplitOnLastTail_responseValue: Equatable, Codable, Daydreamable
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

public struct becomeSplitOnTail_requestValue: Equatable, Codable, Daydreamable
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

public enum becomeSplitOnTail_responseValue: Equatable, Codable, Daydreamable
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

public struct becomeSplit_argumentsValue: Equatable, Codable, Daydreamable
{
    // Public computed properties
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        try self.field1.saveDaydream(connection)
        try self.field2.saveDaydream(connection)
    }

    // Public Fields
    public let field1: Text
    public let field2: Int

    // Public Inits
    public init(daydream connection: Transmission.Connection) throws
    {
        self.field1 = try Text(daydream: connection)
        self.field2 = try Int(daydream: connection)
    }

    public init(_ field1: Text, _ field2: Int)
    {
        self.field1 = field1
        self.field2 = field2
    }
}

public struct becomeSplit_requestValue: Equatable, Codable, Daydreamable
{
    // Public computed properties
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
    try self.field1.saveDaydream(connection)
    }

    // Public Fields
    public let field1: becomeSplit_argumentsValue

    // Public Inits
    public init(daydream connection: Transmission.Connection) throws
    {
        self.field1 = try becomeSplit_argumentsValue(daydream: connection)
    }

    public init(_ field1: becomeSplit_argumentsValue)
    {
        self.field1 = field1
    }
}

public enum becomeSplit_responseValue: Equatable, Codable, Daydreamable
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

public struct becomeSubstring_argumentsValue: Equatable, Codable, Daydreamable
{
    // Public computed properties
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        try self.field1.saveDaydream(connection)
        try self.field2.saveDaydream(connection)
    }

    // Public Fields
    public let field1: Int
    public let field2: Int

    // Public Inits
    public init(daydream connection: Transmission.Connection) throws
    {
        self.field1 = try Int(daydream: connection)
        self.field2 = try Int(daydream: connection)
    }

    public init(_ field1: Int, _ field2: Int)
    {
        self.field1 = field1
        self.field2 = field2
    }
}

public struct becomeSubstring_requestValue: Equatable, Codable, Daydreamable
{
    // Public computed properties
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
    try self.field1.saveDaydream(connection)
    }

    // Public Fields
    public let field1: becomeSubstring_argumentsValue

    // Public Inits
    public init(daydream connection: Transmission.Connection) throws
    {
        self.field1 = try becomeSubstring_argumentsValue(daydream: connection)
    }

    public init(_ field1: becomeSubstring_argumentsValue)
    {
        self.field1 = field1
    }
}

public enum becomeSubstring_responseValue: Equatable, Codable, Daydreamable
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

public struct become_requestValue: Equatable, Codable, Daydreamable
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

public struct containsSubstring_requestValue: Equatable, Codable, Daydreamable
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

public struct containsSubstring_responseValue: Equatable, Codable, Daydreamable
{
    // Public computed properties
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
    try self.field1.saveDaydream(connection)
    }

    // Public Fields
    public let field1: containsSubstring_response_valueValue

    // Public Inits
    public init(daydream connection: Transmission.Connection) throws
    {
        self.field1 = try containsSubstring_response_valueValue(daydream: connection)
    }

    public init(_ field1: containsSubstring_response_valueValue)
    {
        self.field1 = field1
    }
}

public struct containsSubstring_response_valueValue: Equatable, Codable, Daydreamable
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

public struct dropPrefix_requestValue: Equatable, Codable, Daydreamable
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

public enum dropPrefix_responseValue: Equatable, Codable, Daydreamable
{
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        switch self
        {
            case .dropPrefix_response_value(let subtype):
                try TypeIdentifiers.dropPrefix_response_valueType.saveDaydream(connection)
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
            case .dropPrefix_response_valueType:
                let value = try dropPrefix_response_valueValue(daydream: connection)

                self = .dropPrefix_response_value(value)
                return

            case .ErrorType:
                let value = try ErrorValue(daydream: connection)

                self = .Error(value)
                return

            default:
                throw DaydreamError.conversionFailed
        }
    }

    case dropPrefix_response_value(dropPrefix_response_valueValue)
    case Error(ErrorValue)
}

public struct dropPrefix_response_valueValue: Equatable, Codable, Daydreamable
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

public struct indexOf_requestValue: Equatable, Codable, Daydreamable
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

public enum indexOf_responseValue: Equatable, Codable, Daydreamable
{
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        switch self
        {
            case .indexOf_response_value(let subtype):
                try TypeIdentifiers.indexOf_response_valueType.saveDaydream(connection)
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
            case .indexOf_response_valueType:
                let value = try indexOf_response_valueValue(daydream: connection)

                self = .indexOf_response_value(value)
                return

            case .ErrorType:
                let value = try ErrorValue(daydream: connection)

                self = .Error(value)
                return

            default:
                throw DaydreamError.conversionFailed
        }
    }

    case indexOf_response_value(indexOf_response_valueValue)
    case Error(ErrorValue)
}

public struct indexOf_response_valueValue: Equatable, Codable, Daydreamable
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

public struct join_requestValue: Equatable, Codable, Daydreamable
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

public struct join_responseValue: Equatable, Codable, Daydreamable
{
    // Public computed properties
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
    try self.field1.saveDaydream(connection)
    }

    // Public Fields
    public let field1: join_response_valueValue

    // Public Inits
    public init(daydream connection: Transmission.Connection) throws
    {
        self.field1 = try join_response_valueValue(daydream: connection)
    }

    public init(_ field1: join_response_valueValue)
    {
        self.field1 = field1
    }
}

public struct join_response_valueValue: Equatable, Codable, Daydreamable
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

public struct lastIndexOf_requestValue: Equatable, Codable, Daydreamable
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

public enum lastIndexOf_responseValue: Equatable, Codable, Daydreamable
{
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        switch self
        {
            case .lastIndexOf_response_value(let subtype):
                try TypeIdentifiers.lastIndexOf_response_valueType.saveDaydream(connection)
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
            case .lastIndexOf_response_valueType:
                let value = try lastIndexOf_response_valueValue(daydream: connection)

                self = .lastIndexOf_response_value(value)
                return

            case .ErrorType:
                let value = try ErrorValue(daydream: connection)

                self = .Error(value)
                return

            default:
                throw DaydreamError.conversionFailed
        }
    }

    case lastIndexOf_response_value(lastIndexOf_response_valueValue)
    case Error(ErrorValue)
}

public struct lastIndexOf_response_valueValue: Equatable, Codable, Daydreamable
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

public struct lines_requestValue: Equatable, Codable, Daydreamable
{
    // Public computed properties
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
    try self.field1.saveDaydream(connection)
    }

    // Public Fields
    public let field1: MaybeTextValue

    // Public Inits
    public init(daydream connection: Transmission.Connection) throws
    {
        self.field1 = try MaybeTextValue(daydream: connection)
    }

    public init(_ field1: MaybeTextValue)
    {
        self.field1 = field1
    }
}

public struct lines_responseValue: Equatable, Codable, Daydreamable
{
    // Public computed properties
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
    try self.field1.saveDaydream(connection)
    }

    // Public Fields
    public let field1: lines_response_valueValue

    // Public Inits
    public init(daydream connection: Transmission.Connection) throws
    {
        self.field1 = try lines_response_valueValue(daydream: connection)
    }

    public init(_ field1: lines_response_valueValue)
    {
        self.field1 = field1
    }
}

public struct lines_response_valueValue: Equatable, Codable, Daydreamable
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

public struct prepend_requestValue: Equatable, Codable, Daydreamable
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

public struct prepend_responseValue: Equatable, Codable, Daydreamable
{
    // Public computed properties
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
    try self.field1.saveDaydream(connection)
    }

    // Public Fields
    public let field1: prepend_response_valueValue

    // Public Inits
    public init(daydream connection: Transmission.Connection) throws
    {
        self.field1 = try prepend_response_valueValue(daydream: connection)
    }

    public init(_ field1: prepend_response_valueValue)
    {
        self.field1 = field1
    }
}

public struct prepend_response_valueValue: Equatable, Codable, Daydreamable
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

public struct split_requestValue: Equatable, Codable, Daydreamable
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

public struct split_responseValue: Equatable, Codable, Daydreamable
{
    // Public computed properties
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
    try self.field1.saveDaydream(connection)
    }

    // Public Fields
    public let field1: split_response_valueValue

    // Public Inits
    public init(daydream connection: Transmission.Connection) throws
    {
        self.field1 = try split_response_valueValue(daydream: connection)
    }

    public init(_ field1: split_response_valueValue)
    {
        self.field1 = field1
    }
}

public struct split_response_valueValue: Equatable, Codable, Daydreamable
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

public struct startsWith_requestValue: Equatable, Codable, Daydreamable
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

public struct startsWith_responseValue: Equatable, Codable, Daydreamable
{
    // Public computed properties
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
    try self.field1.saveDaydream(connection)
    }

    // Public Fields
    public let field1: startsWith_response_valueValue

    // Public Inits
    public init(daydream connection: Transmission.Connection) throws
    {
        self.field1 = try startsWith_response_valueValue(daydream: connection)
    }

    public init(_ field1: startsWith_response_valueValue)
    {
        self.field1 = field1
    }
}

public struct startsWith_response_valueValue: Equatable, Codable, Daydreamable
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

public struct substring_argumentsValue: Equatable, Codable, Daydreamable
{
    // Public computed properties
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        try self.field1.saveDaydream(connection)
        try self.field2.saveDaydream(connection)
    }

    // Public Fields
    public let field1: Int
    public let field2: Int

    // Public Inits
    public init(daydream connection: Transmission.Connection) throws
    {
        self.field1 = try Int(daydream: connection)
        self.field2 = try Int(daydream: connection)
    }

    public init(_ field1: Int, _ field2: Int)
    {
        self.field1 = field1
        self.field2 = field2
    }
}

public struct substring_requestValue: Equatable, Codable, Daydreamable
{
    // Public computed properties
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
    try self.field1.saveDaydream(connection)
    }

    // Public Fields
    public let field1: substring_argumentsValue

    // Public Inits
    public init(daydream connection: Transmission.Connection) throws
    {
        self.field1 = try substring_argumentsValue(daydream: connection)
    }

    public init(_ field1: substring_argumentsValue)
    {
        self.field1 = field1
    }
}

public enum substring_responseValue: Equatable, Codable, Daydreamable
{
    public func saveDaydream(_ connection: Transmission.Connection) throws
    {
        switch self
        {
            case .substring_response_value(let subtype):
                try TypeIdentifiers.substring_response_valueType.saveDaydream(connection)
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
            case .substring_response_valueType:
                let value = try substring_response_valueValue(daydream: connection)

                self = .substring_response_value(value)
                return

            case .ErrorType:
                let value = try ErrorValue(daydream: connection)

                self = .Error(value)
                return

            default:
                throw DaydreamError.conversionFailed
        }
    }

    case substring_response_value(substring_response_valueValue)
    case Error(ErrorValue)
}

public struct substring_response_valueValue: Equatable, Codable, Daydreamable
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

            case .MaybeText(let subtype):
                try TypeIdentifiers.MaybeTextType.saveDaydream(connection)
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

            case .append:
                try TypeIdentifiers.appendType.saveDaydream(connection)

            case .append_request(let subtype):
                try TypeIdentifiers.append_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .append_response(let subtype):
                try TypeIdentifiers.append_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .append_response_value(let subtype):
                try TypeIdentifiers.append_response_valueType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .become:
                try TypeIdentifiers.becomeType.saveDaydream(connection)

            case .becomeAppended:
                try TypeIdentifiers.becomeAppendedType.saveDaydream(connection)

            case .becomeAppended_request(let subtype):
                try TypeIdentifiers.becomeAppended_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeAppended_response:
                try TypeIdentifiers.becomeAppended_responseType.saveDaydream(connection)

            case .becomeDropFirst:
                try TypeIdentifiers.becomeDropFirstType.saveDaydream(connection)

            case .becomeDropFirst_request:
                try TypeIdentifiers.becomeDropFirst_requestType.saveDaydream(connection)

            case .becomeDropFirst_response(let subtype):
                try TypeIdentifiers.becomeDropFirst_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeDropPrefix:
                try TypeIdentifiers.becomeDropPrefixType.saveDaydream(connection)

            case .becomeDropPrefix_request(let subtype):
                try TypeIdentifiers.becomeDropPrefix_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeDropPrefix_response(let subtype):
                try TypeIdentifiers.becomeDropPrefix_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeFirst:
                try TypeIdentifiers.becomeFirstType.saveDaydream(connection)

            case .becomeFirst_request:
                try TypeIdentifiers.becomeFirst_requestType.saveDaydream(connection)

            case .becomeFirst_response(let subtype):
                try TypeIdentifiers.becomeFirst_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeJoined:
                try TypeIdentifiers.becomeJoinedType.saveDaydream(connection)

            case .becomeJoined_request(let subtype):
                try TypeIdentifiers.becomeJoined_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeJoined_response:
                try TypeIdentifiers.becomeJoined_responseType.saveDaydream(connection)

            case .becomeLast:
                try TypeIdentifiers.becomeLastType.saveDaydream(connection)

            case .becomeLast_request:
                try TypeIdentifiers.becomeLast_requestType.saveDaydream(connection)

            case .becomeLast_response(let subtype):
                try TypeIdentifiers.becomeLast_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomePrepended:
                try TypeIdentifiers.becomePrependedType.saveDaydream(connection)

            case .becomePrepended_request(let subtype):
                try TypeIdentifiers.becomePrepended_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomePrepended_response:
                try TypeIdentifiers.becomePrepended_responseType.saveDaydream(connection)

            case .becomeReverse:
                try TypeIdentifiers.becomeReverseType.saveDaydream(connection)

            case .becomeReverse_request:
                try TypeIdentifiers.becomeReverse_requestType.saveDaydream(connection)

            case .becomeReverse_response:
                try TypeIdentifiers.becomeReverse_responseType.saveDaydream(connection)

            case .becomeSplit:
                try TypeIdentifiers.becomeSplitType.saveDaydream(connection)

            case .becomeSplitAtHead:
                try TypeIdentifiers.becomeSplitAtHeadType.saveDaydream(connection)

            case .becomeSplitAtHead_arguments(let subtype):
                try TypeIdentifiers.becomeSplitAtHead_argumentsType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeSplitAtHead_request(let subtype):
                try TypeIdentifiers.becomeSplitAtHead_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeSplitAtHead_response(let subtype):
                try TypeIdentifiers.becomeSplitAtHead_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeSplitAtTail:
                try TypeIdentifiers.becomeSplitAtTailType.saveDaydream(connection)

            case .becomeSplitAtTail_arguments(let subtype):
                try TypeIdentifiers.becomeSplitAtTail_argumentsType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeSplitAtTail_request(let subtype):
                try TypeIdentifiers.becomeSplitAtTail_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeSplitAtTail_response(let subtype):
                try TypeIdentifiers.becomeSplitAtTail_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeSplitOnHead:
                try TypeIdentifiers.becomeSplitOnHeadType.saveDaydream(connection)

            case .becomeSplitOnHead_request(let subtype):
                try TypeIdentifiers.becomeSplitOnHead_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeSplitOnHead_response(let subtype):
                try TypeIdentifiers.becomeSplitOnHead_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeSplitOnLastHead:
                try TypeIdentifiers.becomeSplitOnLastHeadType.saveDaydream(connection)

            case .becomeSplitOnLastHead_request(let subtype):
                try TypeIdentifiers.becomeSplitOnLastHead_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeSplitOnLastHead_response(let subtype):
                try TypeIdentifiers.becomeSplitOnLastHead_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeSplitOnLastTail:
                try TypeIdentifiers.becomeSplitOnLastTailType.saveDaydream(connection)

            case .becomeSplitOnLastTail_request(let subtype):
                try TypeIdentifiers.becomeSplitOnLastTail_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeSplitOnLastTail_response(let subtype):
                try TypeIdentifiers.becomeSplitOnLastTail_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeSplitOnTail:
                try TypeIdentifiers.becomeSplitOnTailType.saveDaydream(connection)

            case .becomeSplitOnTail_request(let subtype):
                try TypeIdentifiers.becomeSplitOnTail_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeSplitOnTail_response(let subtype):
                try TypeIdentifiers.becomeSplitOnTail_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeSplit_arguments(let subtype):
                try TypeIdentifiers.becomeSplit_argumentsType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeSplit_request(let subtype):
                try TypeIdentifiers.becomeSplit_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeSplit_response(let subtype):
                try TypeIdentifiers.becomeSplit_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeSubstring:
                try TypeIdentifiers.becomeSubstringType.saveDaydream(connection)

            case .becomeSubstring_arguments(let subtype):
                try TypeIdentifiers.becomeSubstring_argumentsType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeSubstring_request(let subtype):
                try TypeIdentifiers.becomeSubstring_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .becomeSubstring_response(let subtype):
                try TypeIdentifiers.becomeSubstring_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

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

            case .become_request(let subtype):
                try TypeIdentifiers.become_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .become_response:
                try TypeIdentifiers.become_responseType.saveDaydream(connection)

            case .containsSubstring:
                try TypeIdentifiers.containsSubstringType.saveDaydream(connection)

            case .containsSubstring_request(let subtype):
                try TypeIdentifiers.containsSubstring_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .containsSubstring_response(let subtype):
                try TypeIdentifiers.containsSubstring_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .containsSubstring_response_value(let subtype):
                try TypeIdentifiers.containsSubstring_response_valueType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

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

            case .dropPrefix:
                try TypeIdentifiers.dropPrefixType.saveDaydream(connection)

            case .dropPrefix_request(let subtype):
                try TypeIdentifiers.dropPrefix_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .dropPrefix_response(let subtype):
                try TypeIdentifiers.dropPrefix_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .dropPrefix_response_value(let subtype):
                try TypeIdentifiers.dropPrefix_response_valueType.saveDaydream(connection)
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

            case .indexOf:
                try TypeIdentifiers.indexOfType.saveDaydream(connection)

            case .indexOf_request(let subtype):
                try TypeIdentifiers.indexOf_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .indexOf_response(let subtype):
                try TypeIdentifiers.indexOf_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .indexOf_response_value(let subtype):
                try TypeIdentifiers.indexOf_response_valueType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .isEmpty:
                try TypeIdentifiers.isEmptyType.saveDaydream(connection)

            case .isEmpty_request:
                try TypeIdentifiers.isEmpty_requestType.saveDaydream(connection)

            case .isEmpty_response(let subtype):
                try TypeIdentifiers.isEmpty_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .join:
                try TypeIdentifiers.joinType.saveDaydream(connection)

            case .join_request(let subtype):
                try TypeIdentifiers.join_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .join_response(let subtype):
                try TypeIdentifiers.join_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .join_response_value(let subtype):
                try TypeIdentifiers.join_response_valueType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .last:
                try TypeIdentifiers.lastType.saveDaydream(connection)

            case .lastIndexOf:
                try TypeIdentifiers.lastIndexOfType.saveDaydream(connection)

            case .lastIndexOf_request(let subtype):
                try TypeIdentifiers.lastIndexOf_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .lastIndexOf_response(let subtype):
                try TypeIdentifiers.lastIndexOf_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .lastIndexOf_response_value(let subtype):
                try TypeIdentifiers.lastIndexOf_response_valueType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .last_request:
                try TypeIdentifiers.last_requestType.saveDaydream(connection)

            case .last_response(let subtype):
                try TypeIdentifiers.last_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .last_response_value(let subtype):
                try TypeIdentifiers.last_response_valueType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .lines:
                try TypeIdentifiers.linesType.saveDaydream(connection)

            case .lines_request(let subtype):
                try TypeIdentifiers.lines_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .lines_response(let subtype):
                try TypeIdentifiers.lines_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .lines_response_value(let subtype):
                try TypeIdentifiers.lines_response_valueType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .prepend:
                try TypeIdentifiers.prependType.saveDaydream(connection)

            case .prepend_request(let subtype):
                try TypeIdentifiers.prepend_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .prepend_response(let subtype):
                try TypeIdentifiers.prepend_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .prepend_response_value(let subtype):
                try TypeIdentifiers.prepend_response_valueType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .reverse:
                try TypeIdentifiers.reverseType.saveDaydream(connection)

            case .reverse_request:
                try TypeIdentifiers.reverse_requestType.saveDaydream(connection)

            case .reverse_response(let subtype):
                try TypeIdentifiers.reverse_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .split:
                try TypeIdentifiers.splitType.saveDaydream(connection)

            case .split_request(let subtype):
                try TypeIdentifiers.split_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .split_response(let subtype):
                try TypeIdentifiers.split_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .split_response_value(let subtype):
                try TypeIdentifiers.split_response_valueType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .startsWith:
                try TypeIdentifiers.startsWithType.saveDaydream(connection)

            case .startsWith_request(let subtype):
                try TypeIdentifiers.startsWith_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .startsWith_response(let subtype):
                try TypeIdentifiers.startsWith_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .startsWith_response_value(let subtype):
                try TypeIdentifiers.startsWith_response_valueType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .substring:
                try TypeIdentifiers.substringType.saveDaydream(connection)

            case .substring_arguments(let subtype):
                try TypeIdentifiers.substring_argumentsType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .substring_request(let subtype):
                try TypeIdentifiers.substring_requestType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .substring_response(let subtype):
                try TypeIdentifiers.substring_responseType.saveDaydream(connection)
                try subtype.saveDaydream(connection)

            case .substring_response_value(let subtype):
                try TypeIdentifiers.substring_response_valueType.saveDaydream(connection)
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

            case .MaybeTextType:
                let subtype = try MaybeTextValue(daydream: connection)
                self = .MaybeText(subtype)

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

            case .appendType:
                self = .append

            case .append_requestType:
                let subtype = try append_requestValue(daydream: connection)
                self = .append_request(subtype)

            case .append_responseType:
                let subtype = try append_responseValue(daydream: connection)
                self = .append_response(subtype)

            case .append_response_valueType:
                let subtype = try append_response_valueValue(daydream: connection)
                self = .append_response_value(subtype)

            case .becomeType:
                self = .become

            case .becomeAppendedType:
                self = .becomeAppended

            case .becomeAppended_requestType:
                let subtype = try becomeAppended_requestValue(daydream: connection)
                self = .becomeAppended_request(subtype)

            case .becomeAppended_responseType:
                self = .becomeAppended_response

            case .becomeDropFirstType:
                self = .becomeDropFirst

            case .becomeDropFirst_requestType:
                self = .becomeDropFirst_request

            case .becomeDropFirst_responseType:
                let subtype = try becomeDropFirst_responseValue(daydream: connection)
                self = .becomeDropFirst_response(subtype)

            case .becomeDropPrefixType:
                self = .becomeDropPrefix

            case .becomeDropPrefix_requestType:
                let subtype = try becomeDropPrefix_requestValue(daydream: connection)
                self = .becomeDropPrefix_request(subtype)

            case .becomeDropPrefix_responseType:
                let subtype = try becomeDropPrefix_responseValue(daydream: connection)
                self = .becomeDropPrefix_response(subtype)

            case .becomeFirstType:
                self = .becomeFirst

            case .becomeFirst_requestType:
                self = .becomeFirst_request

            case .becomeFirst_responseType:
                let subtype = try becomeFirst_responseValue(daydream: connection)
                self = .becomeFirst_response(subtype)

            case .becomeJoinedType:
                self = .becomeJoined

            case .becomeJoined_requestType:
                let subtype = try becomeJoined_requestValue(daydream: connection)
                self = .becomeJoined_request(subtype)

            case .becomeJoined_responseType:
                self = .becomeJoined_response

            case .becomeLastType:
                self = .becomeLast

            case .becomeLast_requestType:
                self = .becomeLast_request

            case .becomeLast_responseType:
                let subtype = try becomeLast_responseValue(daydream: connection)
                self = .becomeLast_response(subtype)

            case .becomePrependedType:
                self = .becomePrepended

            case .becomePrepended_requestType:
                let subtype = try becomePrepended_requestValue(daydream: connection)
                self = .becomePrepended_request(subtype)

            case .becomePrepended_responseType:
                self = .becomePrepended_response

            case .becomeReverseType:
                self = .becomeReverse

            case .becomeReverse_requestType:
                self = .becomeReverse_request

            case .becomeReverse_responseType:
                self = .becomeReverse_response

            case .becomeSplitType:
                self = .becomeSplit

            case .becomeSplitAtHeadType:
                self = .becomeSplitAtHead

            case .becomeSplitAtHead_argumentsType:
                let subtype = try becomeSplitAtHead_argumentsValue(daydream: connection)
                self = .becomeSplitAtHead_arguments(subtype)

            case .becomeSplitAtHead_requestType:
                let subtype = try becomeSplitAtHead_requestValue(daydream: connection)
                self = .becomeSplitAtHead_request(subtype)

            case .becomeSplitAtHead_responseType:
                let subtype = try becomeSplitAtHead_responseValue(daydream: connection)
                self = .becomeSplitAtHead_response(subtype)

            case .becomeSplitAtTailType:
                self = .becomeSplitAtTail

            case .becomeSplitAtTail_argumentsType:
                let subtype = try becomeSplitAtTail_argumentsValue(daydream: connection)
                self = .becomeSplitAtTail_arguments(subtype)

            case .becomeSplitAtTail_requestType:
                let subtype = try becomeSplitAtTail_requestValue(daydream: connection)
                self = .becomeSplitAtTail_request(subtype)

            case .becomeSplitAtTail_responseType:
                let subtype = try becomeSplitAtTail_responseValue(daydream: connection)
                self = .becomeSplitAtTail_response(subtype)

            case .becomeSplitOnHeadType:
                self = .becomeSplitOnHead

            case .becomeSplitOnHead_requestType:
                let subtype = try becomeSplitOnHead_requestValue(daydream: connection)
                self = .becomeSplitOnHead_request(subtype)

            case .becomeSplitOnHead_responseType:
                let subtype = try becomeSplitOnHead_responseValue(daydream: connection)
                self = .becomeSplitOnHead_response(subtype)

            case .becomeSplitOnLastHeadType:
                self = .becomeSplitOnLastHead

            case .becomeSplitOnLastHead_requestType:
                let subtype = try becomeSplitOnLastHead_requestValue(daydream: connection)
                self = .becomeSplitOnLastHead_request(subtype)

            case .becomeSplitOnLastHead_responseType:
                let subtype = try becomeSplitOnLastHead_responseValue(daydream: connection)
                self = .becomeSplitOnLastHead_response(subtype)

            case .becomeSplitOnLastTailType:
                self = .becomeSplitOnLastTail

            case .becomeSplitOnLastTail_requestType:
                let subtype = try becomeSplitOnLastTail_requestValue(daydream: connection)
                self = .becomeSplitOnLastTail_request(subtype)

            case .becomeSplitOnLastTail_responseType:
                let subtype = try becomeSplitOnLastTail_responseValue(daydream: connection)
                self = .becomeSplitOnLastTail_response(subtype)

            case .becomeSplitOnTailType:
                self = .becomeSplitOnTail

            case .becomeSplitOnTail_requestType:
                let subtype = try becomeSplitOnTail_requestValue(daydream: connection)
                self = .becomeSplitOnTail_request(subtype)

            case .becomeSplitOnTail_responseType:
                let subtype = try becomeSplitOnTail_responseValue(daydream: connection)
                self = .becomeSplitOnTail_response(subtype)

            case .becomeSplit_argumentsType:
                let subtype = try becomeSplit_argumentsValue(daydream: connection)
                self = .becomeSplit_arguments(subtype)

            case .becomeSplit_requestType:
                let subtype = try becomeSplit_requestValue(daydream: connection)
                self = .becomeSplit_request(subtype)

            case .becomeSplit_responseType:
                let subtype = try becomeSplit_responseValue(daydream: connection)
                self = .becomeSplit_response(subtype)

            case .becomeSubstringType:
                self = .becomeSubstring

            case .becomeSubstring_argumentsType:
                let subtype = try becomeSubstring_argumentsValue(daydream: connection)
                self = .becomeSubstring_arguments(subtype)

            case .becomeSubstring_requestType:
                let subtype = try becomeSubstring_requestValue(daydream: connection)
                self = .becomeSubstring_request(subtype)

            case .becomeSubstring_responseType:
                let subtype = try becomeSubstring_responseValue(daydream: connection)
                self = .becomeSubstring_response(subtype)

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

            case .become_requestType:
                let subtype = try become_requestValue(daydream: connection)
                self = .become_request(subtype)

            case .become_responseType:
                self = .become_response

            case .containsSubstringType:
                self = .containsSubstring

            case .containsSubstring_requestType:
                let subtype = try containsSubstring_requestValue(daydream: connection)
                self = .containsSubstring_request(subtype)

            case .containsSubstring_responseType:
                let subtype = try containsSubstring_responseValue(daydream: connection)
                self = .containsSubstring_response(subtype)

            case .containsSubstring_response_valueType:
                let subtype = try containsSubstring_response_valueValue(daydream: connection)
                self = .containsSubstring_response_value(subtype)

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

            case .dropPrefixType:
                self = .dropPrefix

            case .dropPrefix_requestType:
                let subtype = try dropPrefix_requestValue(daydream: connection)
                self = .dropPrefix_request(subtype)

            case .dropPrefix_responseType:
                let subtype = try dropPrefix_responseValue(daydream: connection)
                self = .dropPrefix_response(subtype)

            case .dropPrefix_response_valueType:
                let subtype = try dropPrefix_response_valueValue(daydream: connection)
                self = .dropPrefix_response_value(subtype)

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

            case .indexOfType:
                self = .indexOf

            case .indexOf_requestType:
                let subtype = try indexOf_requestValue(daydream: connection)
                self = .indexOf_request(subtype)

            case .indexOf_responseType:
                let subtype = try indexOf_responseValue(daydream: connection)
                self = .indexOf_response(subtype)

            case .indexOf_response_valueType:
                let subtype = try indexOf_response_valueValue(daydream: connection)
                self = .indexOf_response_value(subtype)

            case .isEmptyType:
                self = .isEmpty

            case .isEmpty_requestType:
                self = .isEmpty_request

            case .isEmpty_responseType:
                let subtype = try isEmpty_responseValue(daydream: connection)
                self = .isEmpty_response(subtype)

            case .joinType:
                self = .join

            case .join_requestType:
                let subtype = try join_requestValue(daydream: connection)
                self = .join_request(subtype)

            case .join_responseType:
                let subtype = try join_responseValue(daydream: connection)
                self = .join_response(subtype)

            case .join_response_valueType:
                let subtype = try join_response_valueValue(daydream: connection)
                self = .join_response_value(subtype)

            case .lastType:
                self = .last

            case .lastIndexOfType:
                self = .lastIndexOf

            case .lastIndexOf_requestType:
                let subtype = try lastIndexOf_requestValue(daydream: connection)
                self = .lastIndexOf_request(subtype)

            case .lastIndexOf_responseType:
                let subtype = try lastIndexOf_responseValue(daydream: connection)
                self = .lastIndexOf_response(subtype)

            case .lastIndexOf_response_valueType:
                let subtype = try lastIndexOf_response_valueValue(daydream: connection)
                self = .lastIndexOf_response_value(subtype)

            case .last_requestType:
                self = .last_request

            case .last_responseType:
                let subtype = try last_responseValue(daydream: connection)
                self = .last_response(subtype)

            case .last_response_valueType:
                let subtype = try last_response_valueValue(daydream: connection)
                self = .last_response_value(subtype)

            case .linesType:
                self = .lines

            case .lines_requestType:
                let subtype = try lines_requestValue(daydream: connection)
                self = .lines_request(subtype)

            case .lines_responseType:
                let subtype = try lines_responseValue(daydream: connection)
                self = .lines_response(subtype)

            case .lines_response_valueType:
                let subtype = try lines_response_valueValue(daydream: connection)
                self = .lines_response_value(subtype)

            case .prependType:
                self = .prepend

            case .prepend_requestType:
                let subtype = try prepend_requestValue(daydream: connection)
                self = .prepend_request(subtype)

            case .prepend_responseType:
                let subtype = try prepend_responseValue(daydream: connection)
                self = .prepend_response(subtype)

            case .prepend_response_valueType:
                let subtype = try prepend_response_valueValue(daydream: connection)
                self = .prepend_response_value(subtype)

            case .reverseType:
                self = .reverse

            case .reverse_requestType:
                self = .reverse_request

            case .reverse_responseType:
                let subtype = try reverse_responseValue(daydream: connection)
                self = .reverse_response(subtype)

            case .splitType:
                self = .split

            case .split_requestType:
                let subtype = try split_requestValue(daydream: connection)
                self = .split_request(subtype)

            case .split_responseType:
                let subtype = try split_responseValue(daydream: connection)
                self = .split_response(subtype)

            case .split_response_valueType:
                let subtype = try split_response_valueValue(daydream: connection)
                self = .split_response_value(subtype)

            case .startsWithType:
                self = .startsWith

            case .startsWith_requestType:
                let subtype = try startsWith_requestValue(daydream: connection)
                self = .startsWith_request(subtype)

            case .startsWith_responseType:
                let subtype = try startsWith_responseValue(daydream: connection)
                self = .startsWith_response(subtype)

            case .startsWith_response_valueType:
                let subtype = try startsWith_response_valueValue(daydream: connection)
                self = .startsWith_response_value(subtype)

            case .substringType:
                self = .substring

            case .substring_argumentsType:
                let subtype = try substring_argumentsValue(daydream: connection)
                self = .substring_arguments(subtype)

            case .substring_requestType:
                let subtype = try substring_requestValue(daydream: connection)
                self = .substring_request(subtype)

            case .substring_responseType:
                let subtype = try substring_responseValue(daydream: connection)
                self = .substring_response(subtype)

            case .substring_response_valueType:
                let subtype = try substring_response_valueValue(daydream: connection)
                self = .substring_response_value(subtype)

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