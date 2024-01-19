//
//  MutableTextClient.swift
//
//
//  Created by the Daydream Compiler on 2024-01-19 22:58:08 +0000.
//

import Foundation
import Logging

import BigNumber
import Datable
import RadioWave
import SwiftHexTools
import Text

public struct MutableTextClient
{
    let logger: Logger
    let connection: Connection<MutableTextRequestValue, MutableTextResponseValue>

    public init(host: String, port: Int, logger: Logger) throws
    {
        self.logger = logger
        self.connection = try Connection<MutableTextRequestValue, MutableTextResponseValue>(host: host, port: port, logger: logger)
    }

    // f() -> T
    public func toUTF8String() throws -> toUTF8String_responseValue
    {
        let request = MutableTextRequestValue.toUTF8String_request
        let result = try self.connection.call(request)

        switch result
        {
            case .toUTF8String_response(let value):
                return value

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f() -> T
    public func toText() throws -> toText_responseValue
    {
        let request = MutableTextRequestValue.toText_request
        let result = try self.connection.call(request)

        switch result
        {
            case .toText_response(let value):
                return value

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f() -> T
    public func toUTF8Data() throws -> toUTF8Data_responseValue
    {
        let request = MutableTextRequestValue.toUTF8Data_request
        let result = try self.connection.call(request)

        switch result
        {
            case .toUTF8Data_response(let value):
                return value

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f(T)
    public func become(_ field0: Text) throws
    {
        let request = MutableTextRequestValue.become_request(become_requestValue(field0))
        let result = try self.connection.call(request)

        switch result
        {
            case .become_response:
                return

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f() -> T
    public func toHex() throws -> toHex_responseValue
    {
        let request = MutableTextRequestValue.toHex_request
        let result = try self.connection.call(request)

        switch result
        {
            case .toHex_response(let value):
                return value

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f() throws
    public func convertFromHex() throws
    {
        let request = MutableTextRequestValue.convertFromHex_request
        let result = try self.connection.call(request)

        switch result
        {
            case .convertFromHex_response(let maybeError):
                switch maybeError
                {
                    case .Nothing:
                        return

                    case .Error(let error):
                        throw MutableTextClientError.serviceError(error.field1)
                }

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f()
    public func convertToHex() throws
    {
        let request = MutableTextRequestValue.convertToHex_request
        let result = try self.connection.call(request)
        switch result
        {
            case .convertToHex_response:
                return

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f() -> T
    public func toBase64() throws -> toBase64_responseValue
    {
        let request = MutableTextRequestValue.toBase64_request
        let result = try self.connection.call(request)

        switch result
        {
            case .toBase64_response(let value):
                return value

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f() throws
    public func convertFromBase64() throws
    {
        let request = MutableTextRequestValue.convertFromBase64_request
        let result = try self.connection.call(request)

        switch result
        {
            case .convertFromBase64_response(let maybeError):
                switch maybeError
                {
                    case .Nothing:
                        return

                    case .Error(let error):
                        throw MutableTextClientError.serviceError(error.field1)
                }

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f()
    public func convertToBase64() throws
    {
        let request = MutableTextRequestValue.convertToBase64_request
        let result = try self.connection.call(request)
        switch result
        {
            case .convertToBase64_response:
                return

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f(S, ...) throws -> T
    public func substring(_ parameter0: Int, _ parameter1: Int) throws -> Text
    {
        let argumentsValue = substring_argumentsValue(parameter0, parameter1)
        let requestValue = substring_requestValue(argumentsValue)
        let request = MutableTextRequestValue.substring_request(requestValue)
        let result = try self.connection.call(request)

        switch result
        {
            case .substring_response(let value):
                switch value
                {
                    case .substring_response_value(let subvalue):
                        return subvalue.field1

                    case .Error(let error):
                        throw MutableTextClientError.serviceError(error.field1)
                }

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f(S, ...) throws
    public func becomeSubstring(_ parameter0: Int, _ parameter1: Int) throws
    {
        let argumentsValue = becomeSubstring_argumentsValue(parameter0, parameter1)
        let requestValue = becomeSubstring_requestValue(argumentsValue)
        let request = MutableTextRequestValue.becomeSubstring_request(requestValue)
        let result = try self.connection.call(request)

        switch result
        {
            case .becomeSubstring_response(let response):
                switch response
                {
                    case .Nothing:
                        return

                    case .Error(let error):
                        throw MutableTextClientError.serviceError(error.field1)
                }

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f(S) throws -> T
    public func indexOf(_ field0: Text) throws -> Int
    {
        let requestValue = indexOf_requestValue(field0)
        let request = MutableTextRequestValue.indexOf_request(requestValue)
        let result = try self.connection.call(request)

        switch result
        {
            case .indexOf_response(let value):
                switch value
                {
                    case .indexOf_response_value(let subvalue):
                        return subvalue.field1

                    case .Error(let error):
                        throw MutableTextClientError.serviceError(error.field1)
                }

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f(S) throws -> T
    public func lastIndexOf(_ field0: Text) throws -> Int
    {
        let requestValue = lastIndexOf_requestValue(field0)
        let request = MutableTextRequestValue.lastIndexOf_request(requestValue)
        let result = try self.connection.call(request)

        switch result
        {
            case .lastIndexOf_response(let value):
                switch value
                {
                    case .lastIndexOf_response_value(let subvalue):
                        return subvalue.field1

                    case .Error(let error):
                        throw MutableTextClientError.serviceError(error.field1)
                }

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f(S) -> T
    public func split(_ field0: Text) throws -> [Text]
    {
        let request = MutableTextRequestValue.split_request(split_requestValue(field0))
        let result = try self.connection.call(request)

        switch result
        {
            case .split_response(let value):
                return value.field1.field1

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f(S, ...) throws
    public func becomeSplit(_ parameter0: Text, _ parameter1: Int) throws
    {
        let argumentsValue = becomeSplit_argumentsValue(parameter0, parameter1)
        let requestValue = becomeSplit_requestValue(argumentsValue)
        let request = MutableTextRequestValue.becomeSplit_request(requestValue)
        let result = try self.connection.call(request)

        switch result
        {
            case .becomeSplit_response(let response):
                switch response
                {
                    case .Nothing:
                        return

                    case .Error(let error):
                        throw MutableTextClientError.serviceError(error.field1)
                }

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f(T) throws
    public func becomeSplitOnHead(_ field0: Text) throws
    {
        let request = MutableTextRequestValue.becomeSplitOnHead_request(becomeSplitOnHead_requestValue(field0))
        let result = try self.connection.call(request)

        switch result
        {
            case .becomeSplitOnHead_response(let value):
                switch value
            {
                case .Error(let error):
                    throw MutableTextClientError.serviceError(error.field1)

                default:
                    throw MutableTextClientError.wrongReturnType
            }

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f(T) throws
    public func becomeSplitOnTail(_ field0: Text) throws
    {
        let request = MutableTextRequestValue.becomeSplitOnTail_request(becomeSplitOnTail_requestValue(field0))
        let result = try self.connection.call(request)

        switch result
        {
            case .becomeSplitOnTail_response(let value):
                switch value
            {
                case .Error(let error):
                    throw MutableTextClientError.serviceError(error.field1)

                default:
                    throw MutableTextClientError.wrongReturnType
            }

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f(T) throws
    public func becomeSplitOnLastHead(_ field0: Text) throws
    {
        let request = MutableTextRequestValue.becomeSplitOnLastHead_request(becomeSplitOnLastHead_requestValue(field0))
        let result = try self.connection.call(request)

        switch result
        {
            case .becomeSplitOnLastHead_response(let value):
                switch value
            {
                case .Error(let error):
                    throw MutableTextClientError.serviceError(error.field1)

                default:
                    throw MutableTextClientError.wrongReturnType
            }

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f(T) throws
    public func becomeSplitOnLastTail(_ field0: Text) throws
    {
        let request = MutableTextRequestValue.becomeSplitOnLastTail_request(becomeSplitOnLastTail_requestValue(field0))
        let result = try self.connection.call(request)

        switch result
        {
            case .becomeSplitOnLastTail_response(let value):
                switch value
            {
                case .Error(let error):
                    throw MutableTextClientError.serviceError(error.field1)

                default:
                    throw MutableTextClientError.wrongReturnType
            }

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f(S, ...) throws
    public func becomeSplitAtHead(_ parameter0: Int, _ parameter1: Int) throws
    {
        let argumentsValue = becomeSplitAtHead_argumentsValue(parameter0, parameter1)
        let requestValue = becomeSplitAtHead_requestValue(argumentsValue)
        let request = MutableTextRequestValue.becomeSplitAtHead_request(requestValue)
        let result = try self.connection.call(request)

        switch result
        {
            case .becomeSplitAtHead_response(let response):
                switch response
                {
                    case .Nothing:
                        return

                    case .Error(let error):
                        throw MutableTextClientError.serviceError(error.field1)
                }

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f(S, ...) throws
    public func becomeSplitAtTail(_ parameter0: Int, _ parameter1: Int) throws
    {
        let argumentsValue = becomeSplitAtTail_argumentsValue(parameter0, parameter1)
        let requestValue = becomeSplitAtTail_requestValue(argumentsValue)
        let request = MutableTextRequestValue.becomeSplitAtTail_request(requestValue)
        let result = try self.connection.call(request)

        switch result
        {
            case .becomeSplitAtTail_response(let response):
                switch response
                {
                    case .Nothing:
                        return

                    case .Error(let error):
                        throw MutableTextClientError.serviceError(error.field1)
                }

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f() -> T
    public func trim() throws -> trim_responseValue
    {
        let request = MutableTextRequestValue.trim_request
        let result = try self.connection.call(request)

        switch result
        {
            case .trim_response(let value):
                return value

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f()
    public func becomeTrimmed() throws
    {
        let request = MutableTextRequestValue.becomeTrimmed_request
        let result = try self.connection.call(request)
        switch result
        {
            case .becomeTrimmed_response:
                return

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f(S) -> T
    public func join(_ field0: [Text]) throws -> Text
    {
        let request = MutableTextRequestValue.join_request(join_requestValue(field0))
        let result = try self.connection.call(request)

        switch result
        {
            case .join_response(let value):
                return value.field1.field1

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f(T)
    public func becomeJoined(_ field0: [Text]) throws
    {
        let request = MutableTextRequestValue.becomeJoined_request(becomeJoined_requestValue(field0))
        let result = try self.connection.call(request)

        switch result
        {
            case .becomeJoined_response:
                return

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f(S) -> T
    public func prepend(_ field0: Text) throws -> Text
    {
        let request = MutableTextRequestValue.prepend_request(prepend_requestValue(field0))
        let result = try self.connection.call(request)

        switch result
        {
            case .prepend_response(let value):
                return value.field1.field1

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f(S) -> T
    public func append(_ field0: Text) throws -> Text
    {
        let request = MutableTextRequestValue.append_request(append_requestValue(field0))
        let result = try self.connection.call(request)

        switch result
        {
            case .append_response(let value):
                return value.field1.field1

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f(T)
    public func becomePrepended(_ field0: Text) throws
    {
        let request = MutableTextRequestValue.becomePrepended_request(becomePrepended_requestValue(field0))
        let result = try self.connection.call(request)

        switch result
        {
            case .becomePrepended_response:
                return

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f(T)
    public func becomeAppended(_ field0: Text) throws
    {
        let request = MutableTextRequestValue.becomeAppended_request(becomeAppended_requestValue(field0))
        let result = try self.connection.call(request)

        switch result
        {
            case .becomeAppended_response:
                return

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f(S) -> T
    public func containsSubstring(_ field0: Text) throws -> Bool
    {
        let request = MutableTextRequestValue.containsSubstring_request(containsSubstring_requestValue(field0))
        let result = try self.connection.call(request)

        switch result
        {
            case .containsSubstring_response(let value):
                return value.field1.field1

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f(S) -> T
    public func startsWith(_ field0: Text) throws -> Bool
    {
        let request = MutableTextRequestValue.startsWith_request(startsWith_requestValue(field0))
        let result = try self.connection.call(request)

        switch result
        {
            case .startsWith_response(let value):
                return value.field1.field1

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f() -> T
    public func count() throws -> count_responseValue
    {
        let request = MutableTextRequestValue.count_request
        let result = try self.connection.call(request)

        switch result
        {
            case .count_response(let value):
                return value

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f() -> T
    public func isEmpty() throws -> isEmpty_responseValue
    {
        let request = MutableTextRequestValue.isEmpty_request
        let result = try self.connection.call(request)

        switch result
        {
            case .isEmpty_response(let value):
                return value

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f() throws -> T
    public func dropFirst() throws -> Text
    {
        let request = MutableTextRequestValue.dropFirst_request
        let result = try self.connection.call(request)

        switch result
        {
            case .dropFirst_response(let value):
                switch value
                {
                    case .dropFirst_response_value(let subvalue):
                        return subvalue.field1

                    case .Error(let error):
                        throw MutableTextClientError.serviceError(error.field1)
                }

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f() throws
    public func becomeDropFirst() throws
    {
        let request = MutableTextRequestValue.becomeDropFirst_request
        let result = try self.connection.call(request)

        switch result
        {
            case .becomeDropFirst_response(let maybeError):
                switch maybeError
                {
                    case .Nothing:
                        return

                    case .Error(let error):
                        throw MutableTextClientError.serviceError(error.field1)
                }

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f(S) throws -> T
    public func dropPrefix(_ field0: Text) throws -> Text
    {
        let requestValue = dropPrefix_requestValue(field0)
        let request = MutableTextRequestValue.dropPrefix_request(requestValue)
        let result = try self.connection.call(request)

        switch result
        {
            case .dropPrefix_response(let value):
                switch value
                {
                    case .dropPrefix_response_value(let subvalue):
                        return subvalue.field1

                    case .Error(let error):
                        throw MutableTextClientError.serviceError(error.field1)
                }

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f(T) throws
    public func becomeDropPrefix(_ field0: Text) throws
    {
        let request = MutableTextRequestValue.becomeDropPrefix_request(becomeDropPrefix_requestValue(field0))
        let result = try self.connection.call(request)

        switch result
        {
            case .becomeDropPrefix_response(let value):
                switch value
            {
                case .Error(let error):
                    throw MutableTextClientError.serviceError(error.field1)

                default:
                    throw MutableTextClientError.wrongReturnType
            }

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f() -> T
    public func uppercase() throws -> uppercase_responseValue
    {
        let request = MutableTextRequestValue.uppercase_request
        let result = try self.connection.call(request)

        switch result
        {
            case .uppercase_response(let value):
                return value

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f()
    public func becomeUppercase() throws
    {
        let request = MutableTextRequestValue.becomeUppercase_request
        let result = try self.connection.call(request)
        switch result
        {
            case .becomeUppercase_response:
                return

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f() throws -> T
    public func uppercaseFirstLetter() throws -> Text
    {
        let request = MutableTextRequestValue.uppercaseFirstLetter_request
        let result = try self.connection.call(request)

        switch result
        {
            case .uppercaseFirstLetter_response(let value):
                switch value
                {
                    case .uppercaseFirstLetter_response_value(let subvalue):
                        return subvalue.field1

                    case .Error(let error):
                        throw MutableTextClientError.serviceError(error.field1)
                }

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f() throws
    public func becomeUppercaseFirstLetter() throws
    {
        let request = MutableTextRequestValue.becomeUppercaseFirstLetter_request
        let result = try self.connection.call(request)

        switch result
        {
            case .becomeUppercaseFirstLetter_response(let maybeError):
                switch maybeError
                {
                    case .Nothing:
                        return

                    case .Error(let error):
                        throw MutableTextClientError.serviceError(error.field1)
                }

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f(S) -> T
    public func lines(_ field0: Text?) throws -> [Text]
    {
        let request = MutableTextRequestValue.lines_request(lines_requestValue(field0 == nil ? MaybeTextValue.Nothing : MaybeTextValue.TextValue(field0!)))
        let result = try self.connection.call(request)

        switch result
        {
            case .lines_response(let value):
                return value.field1.field1

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f() throws -> T
    public func first() throws -> Text
    {
        let request = MutableTextRequestValue.first_request
        let result = try self.connection.call(request)

        switch result
        {
            case .first_response(let value):
                switch value
                {
                    case .first_response_value(let subvalue):
                        return subvalue.field1

                    case .Error(let error):
                        throw MutableTextClientError.serviceError(error.field1)
                }

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f() throws
    public func becomeFirst() throws
    {
        let request = MutableTextRequestValue.becomeFirst_request
        let result = try self.connection.call(request)

        switch result
        {
            case .becomeFirst_response(let maybeError):
                switch maybeError
                {
                    case .Nothing:
                        return

                    case .Error(let error):
                        throw MutableTextClientError.serviceError(error.field1)
                }

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f() throws -> T
    public func last() throws -> Text
    {
        let request = MutableTextRequestValue.last_request
        let result = try self.connection.call(request)

        switch result
        {
            case .last_response(let value):
                switch value
                {
                    case .last_response_value(let subvalue):
                        return subvalue.field1

                    case .Error(let error):
                        throw MutableTextClientError.serviceError(error.field1)
                }

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f() throws
    public func becomeLast() throws
    {
        let request = MutableTextRequestValue.becomeLast_request
        let result = try self.connection.call(request)

        switch result
        {
            case .becomeLast_response(let maybeError):
                switch maybeError
                {
                    case .Nothing:
                        return

                    case .Error(let error):
                        throw MutableTextClientError.serviceError(error.field1)
                }

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f() -> T
    public func fan() throws -> fan_responseValue
    {
        let request = MutableTextRequestValue.fan_request
        let result = try self.connection.call(request)

        switch result
        {
            case .fan_response(let value):
                return value

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f() -> T
    public func reverse() throws -> reverse_responseValue
    {
        let request = MutableTextRequestValue.reverse_request
        let result = try self.connection.call(request)

        switch result
        {
            case .reverse_response(let value):
                return value

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }

    // f()
    public func becomeReverse() throws
    {
        let request = MutableTextRequestValue.becomeReverse_request
        let result = try self.connection.call(request)
        switch result
        {
            case .becomeReverse_response:
                return

            default:
                throw MutableTextClientError.wrongReturnType
        }
    }
}

public enum MutableTextClientError: Error
{
    case serviceError(String)
    case wrongReturnType
}