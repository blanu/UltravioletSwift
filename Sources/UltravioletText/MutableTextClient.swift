//
//  MutableTextClient.swift
//
//
//  Created by the Daydream Compiler on 2024-01-16 23:32:18 +0000.
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

    // f(S) -> T (1)
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

    // f(S) -> T (1)
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

    // f(S) -> T (1)
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

    // f(S) -> T (1)
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

    // f(S) -> T (1)
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

    // f(S) -> T (1)
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

    // f(S) -> T (1)
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

    // f(S) -> T (1)
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
public func dropFirst() throws -> dropFirst_response_valueValue
{
    let request = MutableTextRequestValue.dropFirst_request
    let result = try self.connection.call(request)

    switch result
    {
        case .dropFirst_response(let maybeError):
            switch maybeError
            {
                case .dropFirst_response_value(let value):
                    return value

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

    // f(S) -> T (1)
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
public func uppercaseFirstLetter() throws -> uppercaseFirstLetter_response_valueValue
{
    let request = MutableTextRequestValue.uppercaseFirstLetter_request
    let result = try self.connection.call(request)

    switch result
    {
        case .uppercaseFirstLetter_response(let maybeError):
            switch maybeError
            {
                case .uppercaseFirstLetter_response_value(let value):
                    return value

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

// f() throws -> T
public func first() throws -> first_response_valueValue
{
    let request = MutableTextRequestValue.first_request
    let result = try self.connection.call(request)

    switch result
    {
        case .first_response(let maybeError):
            switch maybeError
            {
                case .first_response_value(let value):
                    return value

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
public func last() throws -> last_response_valueValue
{
    let request = MutableTextRequestValue.last_request
    let result = try self.connection.call(request)

    switch result
    {
        case .last_response(let maybeError):
            switch maybeError
            {
                case .last_response_value(let value):
                    return value

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

    // f(S) -> T (1)
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

    // f(S) -> T (1)
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