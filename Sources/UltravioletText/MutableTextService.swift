//
//  MutableTextService.swift
//
//
//  Created by the Daydream Compiler on 2024-01-16 23:32:18 +0000.
//

import ArgumentParser
import Foundation
import Logging

import BigNumber
import Datable
import RadioWave
import SwiftHexTools
import Text

public struct MutableTextService
{
    let logic: MutableTextLogic
    let stdio: StdioService<MutableTextRequestValue, MutableTextResponseValue, MutableTextLogic>
    let logger: Logger

    public init(logger: Logger) throws
    {
        self.logger = logger

        self.logic = MutableTextLogic(logger: logger)
        self.stdio = try StdioService<MutableTextRequestValue, MutableTextResponseValue, MutableTextLogic>(handler: logic, logger: logger)
    }
}

public struct MutableTextLogic: Logic
{
    public typealias Request = MutableTextRequestValue
    public typealias Response = MutableTextResponseValue

    let delegate: MutableText
    let logger: Logger

    public init(logger: Logger)
    {
        self.logger = logger

        self.delegate = MutableText()
    }

    public init(logger: Logger, delegate: MutableText)
    {
        self.logger = logger
        self.delegate = delegate
    }

    public func service(_ request: MutableTextRequestValue) throws -> MutableTextResponseValue
    {
        self.logger.debug("client -(\(request))->")

        switch request
        {
            // f() -> T
            case .toUTF8String_request:
                let result = self.delegate.toUTF8String()
                let resultValue = toUTF8String_responseValue(result)
                let response = MutableTextResponseValue.toUTF8String_response(resultValue)

                self.logger.debug("client <-(\(response))-")

                return response
            // f() -> T
            case .toText_request:
                let result = self.delegate.toText()
                let resultValue = toText_responseValue(result)
                let response = MutableTextResponseValue.toText_response(resultValue)

                self.logger.debug("client <-(\(response))-")

                return response
            // f() -> T
            case .toUTF8Data_request:
                let result = self.delegate.toUTF8Data()
                let resultValue = toUTF8Data_responseValue(result)
                let response = MutableTextResponseValue.toUTF8Data_response(resultValue)

                self.logger.debug("client <-(\(response))-")

                return response
            // f() -> T
            case .toHex_request:
                let result = self.delegate.toHex()
                let resultValue = toHex_responseValue(result)
                let response = MutableTextResponseValue.toHex_response(resultValue)

                self.logger.debug("client <-(\(response))-")

                return response
            // f() throws
            case .convertFromHex_request:
                do
                {
                    try self.delegate.convertFromHex()
                    let resultValue = convertFromHex_responseValue.Nothing
                    let response = MutableTextResponseValue.convertFromHex_response(resultValue)

                    self.logger.debug("client <-(\(response))-")

                    return response
                }
                catch
                {
                    let result = ErrorValue(error.localizedDescription)
                    let resultValue = convertFromHex_responseValue.Error(result)
                    let response = MutableTextResponseValue.convertFromHex_response(resultValue)

                    self.logger.debug("client <-(\(response))-")

                    return response
                }
            // f()
            case .convertToHex_request:
                self.delegate.convertToHex()
                let response = MutableTextResponseValue.convertToHex_response

                self.logger.debug("client <-(\(response))-")

                return response
            // f() -> T
            case .toBase64_request:
                let result = self.delegate.toBase64()
                let resultValue = toBase64_responseValue(result)
                let response = MutableTextResponseValue.toBase64_response(resultValue)

                self.logger.debug("client <-(\(response))-")

                return response
            // f() throws
            case .convertFromBase64_request:
                do
                {
                    try self.delegate.convertFromBase64()
                    let resultValue = convertFromBase64_responseValue.Nothing
                    let response = MutableTextResponseValue.convertFromBase64_response(resultValue)

                    self.logger.debug("client <-(\(response))-")

                    return response
                }
                catch
                {
                    let result = ErrorValue(error.localizedDescription)
                    let resultValue = convertFromBase64_responseValue.Error(result)
                    let response = MutableTextResponseValue.convertFromBase64_response(resultValue)

                    self.logger.debug("client <-(\(response))-")

                    return response
                }
            // f()
            case .convertToBase64_request:
                self.delegate.convertToBase64()
                let response = MutableTextResponseValue.convertToBase64_response

                self.logger.debug("client <-(\(response))-")

                return response
            // f() -> T
            case .trim_request:
                let result = self.delegate.trim()
                let resultValue = trim_responseValue(result)
                let response = MutableTextResponseValue.trim_response(resultValue)

                self.logger.debug("client <-(\(response))-")

                return response
            // f()
            case .becomeTrimmed_request:
                self.delegate.becomeTrimmed()
                let response = MutableTextResponseValue.becomeTrimmed_response

                self.logger.debug("client <-(\(response))-")

                return response
            // f() -> T
            case .count_request:
                let result = self.delegate.count()
                let resultValue = count_responseValue(result)
                let response = MutableTextResponseValue.count_response(resultValue)

                self.logger.debug("client <-(\(response))-")

                return response
            // f() -> T
            case .isEmpty_request:
                let result = self.delegate.isEmpty()
                let resultValue = isEmpty_responseValue(result)
                let response = MutableTextResponseValue.isEmpty_response(resultValue)

                self.logger.debug("client <-(\(response))-")

                return response
            // f() throws -> T
            case .dropFirst_request:
                do
                {
                    let result = try self.delegate.dropFirst()
                    let resultValue = dropFirst_responseValue.dropFirst_response_value(dropFirst_response_valueValue(result))
                    let response = MutableTextResponseValue.dropFirst_response(resultValue)

                    self.logger.debug("client <-(\(response))-")

                    return response
                }
                catch
                {
                    let result = ErrorValue(error.localizedDescription)
                    let resultValue = dropFirst_responseValue.Error(result)
                    let response = MutableTextResponseValue.dropFirst_response(resultValue)

                    self.logger.debug("client <-(\(response))-")

                    return response
                }
            // f() throws
            case .becomeDropFirst_request:
                do
                {
                    try self.delegate.becomeDropFirst()
                    let resultValue = becomeDropFirst_responseValue.Nothing
                    let response = MutableTextResponseValue.becomeDropFirst_response(resultValue)

                    self.logger.debug("client <-(\(response))-")

                    return response
                }
                catch
                {
                    let result = ErrorValue(error.localizedDescription)
                    let resultValue = becomeDropFirst_responseValue.Error(result)
                    let response = MutableTextResponseValue.becomeDropFirst_response(resultValue)

                    self.logger.debug("client <-(\(response))-")

                    return response
                }
            // f() -> T
            case .uppercase_request:
                let result = self.delegate.uppercase()
                let resultValue = uppercase_responseValue(result)
                let response = MutableTextResponseValue.uppercase_response(resultValue)

                self.logger.debug("client <-(\(response))-")

                return response
            // f()
            case .becomeUppercase_request:
                self.delegate.becomeUppercase()
                let response = MutableTextResponseValue.becomeUppercase_response

                self.logger.debug("client <-(\(response))-")

                return response
            // f() throws -> T
            case .uppercaseFirstLetter_request:
                do
                {
                    let result = try self.delegate.uppercaseFirstLetter()
                    let resultValue = uppercaseFirstLetter_responseValue.uppercaseFirstLetter_response_value(uppercaseFirstLetter_response_valueValue(result))
                    let response = MutableTextResponseValue.uppercaseFirstLetter_response(resultValue)

                    self.logger.debug("client <-(\(response))-")

                    return response
                }
                catch
                {
                    let result = ErrorValue(error.localizedDescription)
                    let resultValue = uppercaseFirstLetter_responseValue.Error(result)
                    let response = MutableTextResponseValue.uppercaseFirstLetter_response(resultValue)

                    self.logger.debug("client <-(\(response))-")

                    return response
                }
            // f() throws
            case .becomeUppercaseFirstLetter_request:
                do
                {
                    try self.delegate.becomeUppercaseFirstLetter()
                    let resultValue = becomeUppercaseFirstLetter_responseValue.Nothing
                    let response = MutableTextResponseValue.becomeUppercaseFirstLetter_response(resultValue)

                    self.logger.debug("client <-(\(response))-")

                    return response
                }
                catch
                {
                    let result = ErrorValue(error.localizedDescription)
                    let resultValue = becomeUppercaseFirstLetter_responseValue.Error(result)
                    let response = MutableTextResponseValue.becomeUppercaseFirstLetter_response(resultValue)

                    self.logger.debug("client <-(\(response))-")

                    return response
                }
            // f() throws -> T
            case .first_request:
                do
                {
                    let result = try self.delegate.first()
                    let resultValue = first_responseValue.first_response_value(first_response_valueValue(result))
                    let response = MutableTextResponseValue.first_response(resultValue)

                    self.logger.debug("client <-(\(response))-")

                    return response
                }
                catch
                {
                    let result = ErrorValue(error.localizedDescription)
                    let resultValue = first_responseValue.Error(result)
                    let response = MutableTextResponseValue.first_response(resultValue)

                    self.logger.debug("client <-(\(response))-")

                    return response
                }
            // f() throws
            case .becomeFirst_request:
                do
                {
                    try self.delegate.becomeFirst()
                    let resultValue = becomeFirst_responseValue.Nothing
                    let response = MutableTextResponseValue.becomeFirst_response(resultValue)

                    self.logger.debug("client <-(\(response))-")

                    return response
                }
                catch
                {
                    let result = ErrorValue(error.localizedDescription)
                    let resultValue = becomeFirst_responseValue.Error(result)
                    let response = MutableTextResponseValue.becomeFirst_response(resultValue)

                    self.logger.debug("client <-(\(response))-")

                    return response
                }
            // f() throws -> T
            case .last_request:
                do
                {
                    let result = try self.delegate.last()
                    let resultValue = last_responseValue.last_response_value(last_response_valueValue(result))
                    let response = MutableTextResponseValue.last_response(resultValue)

                    self.logger.debug("client <-(\(response))-")

                    return response
                }
                catch
                {
                    let result = ErrorValue(error.localizedDescription)
                    let resultValue = last_responseValue.Error(result)
                    let response = MutableTextResponseValue.last_response(resultValue)

                    self.logger.debug("client <-(\(response))-")

                    return response
                }
            // f() throws
            case .becomeLast_request:
                do
                {
                    try self.delegate.becomeLast()
                    let resultValue = becomeLast_responseValue.Nothing
                    let response = MutableTextResponseValue.becomeLast_response(resultValue)

                    self.logger.debug("client <-(\(response))-")

                    return response
                }
                catch
                {
                    let result = ErrorValue(error.localizedDescription)
                    let resultValue = becomeLast_responseValue.Error(result)
                    let response = MutableTextResponseValue.becomeLast_response(resultValue)

                    self.logger.debug("client <-(\(response))-")

                    return response
                }
            // f() -> T
            case .fan_request:
                let result = self.delegate.fan()
                let resultValue = fan_responseValue(result)
                let response = MutableTextResponseValue.fan_response(resultValue)

                self.logger.debug("client <-(\(response))-")

                return response
            // f() -> T
            case .reverse_request:
                let result = self.delegate.reverse()
                let resultValue = reverse_responseValue(result)
                let response = MutableTextResponseValue.reverse_response(resultValue)

                self.logger.debug("client <-(\(response))-")

                return response
            // f()
            case .becomeReverse_request:
                self.delegate.becomeReverse()
                let response = MutableTextResponseValue.becomeReverse_response

                self.logger.debug("client <-(\(response))-")

                return response
        }
    }
}