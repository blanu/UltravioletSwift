//
//  MutableTextShell.swift
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

public struct MutableTextShell
{
    let client: MutableTextClient
    let logger: Logger

    public init(host: String, port: Int, logger: Logger) throws
    {
        self.logger = logger
        self.client = try MutableTextClient(host: host, port: port, logger: logger)

        self.run()
    }

    func run()
    {
        print("MutableText shell - 2024-01-16 23:32:18 +0000")

        while true
        {
            print()
            print("> ", terminator: "")

            guard let line = readLine(strippingNewline: true) else
            {
                print("Bad read. Exiting.")
                return
            }

            let parts = line.text.split(" ")
            guard parts.count > 0 else
            {
                continue
            }

            let command = parts[0]
            let arguments = [Text](parts.dropFirst())

            if command == "quit"
            {
                print("Quiting.")
                return
            }
            else if command == "help"
            {
                    print("becomeDropFirst throws")
                    print("becomeFirst throws")
                    print("becomeLast throws")
                    print("becomeReverse")
                    print("becomeTrimmed")
                    print("becomeUppercaseFirstLetter throws")
                    print("becomeUppercase")
                    print("convertFromBase64 throws")
                    print("convertFromHex throws")
                    print("convertToBase64")
                    print("convertToHex")
                    print("count -> Int")
                    print("dropFirst throws -> Text")
                    print("fan -> Text")
                    print("first throws -> Text")
                    print("isEmpty -> Bool")
                    print("last throws -> Text")
                    print("reverse -> Text")
                    print("toBase64 -> Text")
                    print("toHex -> Text")
                    print("toText -> Text")
                    print("toUTF8Data -> Data")
                    print("toUTF8String -> String")
                    print("trim -> Text")
                    print("uppercaseFirstLetter throws -> Text")
                    print("uppercase -> Text")
            }
        // f() -> T (3)
        else if command == "toUTF8String".text
        {
            do
            {
                let result = try self.client.toUTF8String()
                print("\"\(result.field1)\"")
            }
            catch
            {
                print("Error: \(error.localizedDescription).")
            }
        }
        // f() -> T (3)
        else if command == "toText".text
        {
            do
            {
                let result = try self.client.toText()
                print("\"\(result.field1)\"")
            }
            catch
            {
                print("Error: \(error.localizedDescription).")
            }
        }
        // f() -> T (3)
        else if command == "toUTF8Data".text
        {
            do
            {
                let result = try self.client.toUTF8Data()
                print(result.field1)
            }
            catch
            {
                print("Error: \(error.localizedDescription).")
            }
        }
        // f() -> T (3)
        else if command == "toHex".text
        {
            do
            {
                let result = try self.client.toHex()
                print("\"\(result.field1)\"")
            }
            catch
            {
                print("Error: \(error.localizedDescription).")
            }
        }
            // f() throws
            else if command == "convertFromHex".text
            {
                do
                {
                    try self.client.convertFromHex()
                }
                catch
                {
                    print("Error: \(error.localizedDescription).")
                }
            }
            // f()
            else if command == "convertToHex".text
            {
                do
                {
                    try self.client.convertToHex()
                }
                catch
                {
                    print("Error: \(error.localizedDescription).")
                }
            }
        // f() -> T (3)
        else if command == "toBase64".text
        {
            do
            {
                let result = try self.client.toBase64()
                print("\"\(result.field1)\"")
            }
            catch
            {
                print("Error: \(error.localizedDescription).")
            }
        }
            // f() throws
            else if command == "convertFromBase64".text
            {
                do
                {
                    try self.client.convertFromBase64()
                }
                catch
                {
                    print("Error: \(error.localizedDescription).")
                }
            }
            // f()
            else if command == "convertToBase64".text
            {
                do
                {
                    try self.client.convertToBase64()
                }
                catch
                {
                    print("Error: \(error.localizedDescription).")
                }
            }
        // f() -> T (3)
        else if command == "trim".text
        {
            do
            {
                let result = try self.client.trim()
                print("\"\(result.field1)\"")
            }
            catch
            {
                print("Error: \(error.localizedDescription).")
            }
        }
            // f()
            else if command == "becomeTrimmed".text
            {
                do
                {
                    try self.client.becomeTrimmed()
                }
                catch
                {
                    print("Error: \(error.localizedDescription).")
                }
            }
        // f() -> T (3)
        else if command == "count".text
        {
            do
            {
                let result = try self.client.count()
                print(result.field1)
            }
            catch
            {
                print("Error: \(error.localizedDescription).")
            }
        }
        // f() -> T (3)
        else if command == "isEmpty".text
        {
            do
            {
                let result = try self.client.isEmpty()
                print(result.field1)
            }
            catch
            {
                print("Error: \(error.localizedDescription).")
            }
        }
        // f() throws -> T
        else if command == "dropFirst".text
        {
            do
            {
                let result = try self.client.dropFirst()
                print(result)
            }
            catch
            {
                print("Error: \(error.localizedDescription).")
            }
        }
            // f() throws
            else if command == "becomeDropFirst".text
            {
                do
                {
                    try self.client.becomeDropFirst()
                }
                catch
                {
                    print("Error: \(error.localizedDescription).")
                }
            }
        // f() -> T (3)
        else if command == "uppercase".text
        {
            do
            {
                let result = try self.client.uppercase()
                print("\"\(result.field1)\"")
            }
            catch
            {
                print("Error: \(error.localizedDescription).")
            }
        }
            // f()
            else if command == "becomeUppercase".text
            {
                do
                {
                    try self.client.becomeUppercase()
                }
                catch
                {
                    print("Error: \(error.localizedDescription).")
                }
            }
        // f() throws -> T
        else if command == "uppercaseFirstLetter".text
        {
            do
            {
                let result = try self.client.uppercaseFirstLetter()
                print(result)
            }
            catch
            {
                print("Error: \(error.localizedDescription).")
            }
        }
            // f() throws
            else if command == "becomeUppercaseFirstLetter".text
            {
                do
                {
                    try self.client.becomeUppercaseFirstLetter()
                }
                catch
                {
                    print("Error: \(error.localizedDescription).")
                }
            }
        // f() throws -> T
        else if command == "first".text
        {
            do
            {
                let result = try self.client.first()
                print(result)
            }
            catch
            {
                print("Error: \(error.localizedDescription).")
            }
        }
            // f() throws
            else if command == "becomeFirst".text
            {
                do
                {
                    try self.client.becomeFirst()
                }
                catch
                {
                    print("Error: \(error.localizedDescription).")
                }
            }
        // f() throws -> T
        else if command == "last".text
        {
            do
            {
                let result = try self.client.last()
                print(result)
            }
            catch
            {
                print("Error: \(error.localizedDescription).")
            }
        }
            // f() throws
            else if command == "becomeLast".text
            {
                do
                {
                    try self.client.becomeLast()
                }
                catch
                {
                    print("Error: \(error.localizedDescription).")
                }
            }
        // f() -> T (3)
        else if command == "fan".text
        {
            do
            {
                let result = try self.client.fan()
                print(result.field1)
            }
            catch
            {
                print("Error: \(error.localizedDescription).")
            }
        }
        // f() -> T (3)
        else if command == "reverse".text
        {
            do
            {
                let result = try self.client.reverse()
                print("\"\(result.field1)\"")
            }
            catch
            {
                print("Error: \(error.localizedDescription).")
            }
        }
            // f()
            else if command == "becomeReverse".text
            {
                do
                {
                    try self.client.becomeReverse()
                }
                catch
                {
                    print("Error: \(error.localizedDescription).")
                }
            }
            else
            {
                print("Unknown command.")
            }
        }
    }
}

public enum MutableTextShellError: Error
{
    case serviceError(String)
    case wrongReturnType
}