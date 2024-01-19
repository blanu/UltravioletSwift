//
//  MutableTextShell.swift
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
        print("MutableText shell - 2024-01-19 22:58:08 +0000")

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
                    print("append -> append_response_value")
                    print("becomeAppended")
                    print("becomeDropFirst throws")
                    print("becomeDropPrefix throws")
                    print("becomeFirst throws")
                    print("becomeJoined")
                    print("becomeLast throws")
                    print("becomePrepended")
                    print("becomeReverse")
                    print("becomeSplitAtHead throws")
                    print("becomeSplitAtTail throws")
                    print("becomeSplitOnHead throws")
                    print("becomeSplitOnLastHead throws")
                    print("becomeSplitOnLastTail throws")
                    print("becomeSplitOnTail throws")
                    print("becomeSplit throws")
                    print("becomeSubstring throws")
                    print("becomeTrimmed")
                    print("becomeUppercaseFirstLetter throws")
                    print("becomeUppercase")
                    print("become")
                    print("containsSubstring -> containsSubstring_response_value")
                    print("convertFromBase64 throws")
                    print("convertFromHex throws")
                    print("convertToBase64")
                    print("convertToHex")
                    print("count -> Int")
                    print("dropFirst throws -> Text")
                    print("dropPrefix throws -> Text")
                    print("fan -> Text")
                    print("first throws -> Text")
                    print("indexOf throws -> Int")
                    print("isEmpty -> Bool")
                    print("join -> join_response_value")
                    print("lastIndexOf throws -> Int")
                    print("last throws -> Text")
                    print("lines -> lines_response_value")
                    print("prepend -> prepend_response_value")
                    print("reverse -> Text")
                    print("split -> split_response_value")
                    print("startsWith -> startsWith_response_value")
                    print("substring throws -> Text")
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
            // f(T)
            else if command == "become".text
            {
                let text0 = arguments[0]

                let argument0: Text = text0

                do
                {
                    try self.client.become(argument0)
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
        // f(S) -> T 1
        else if command == "substring".text
        {
            let text0 = arguments[0]
            let argument0: Int = Int(string: text0.string)
            let text1 = arguments[1]
            let argument1: Int = Int(string: text1.string)

            do
            {
                let result = try self.client.substring(argument0, argument1)
                print(result)
            }
            catch
            {
                print("Error: \(error.localizedDescription).")
            }
        }
        // f(S) throws
        else if command == "becomeSubstring".text
        {
            let text0 = arguments[0]
            let argument0: Int = Int(string: text0.string)
            let text1 = arguments[1]
            let argument1: Int = Int(string: text1.string)

            do
            {
                try self.client.becomeSubstring(argument0, argument1)
            }
            catch
            {
                print("Error: \(error.localizedDescription).")
            }
        }
        // f(S) -> T 1
        else if command == "indexOf".text
        {
                let text0 = arguments[0]

                let argument0: Text = text0

            do
            {
                let result = try self.client.indexOf(argument0)
                print(result)
            }
            catch
            {
                print("Error: \(error.localizedDescription).")
            }
        }
        // f(S) -> T 1
        else if command == "lastIndexOf".text
        {
                let text0 = arguments[0]

                let argument0: Text = text0

            do
            {
                let result = try self.client.lastIndexOf(argument0)
                print(result)
            }
            catch
            {
                print("Error: \(error.localizedDescription).")
            }
        }
            // f(S) -> T 2
            else if command == "split".text
            {
                let text0 = arguments[0]

                let argument0: Text = text0

                do
                {
                    let result = try self.client.split(argument0)
                    print(result)
                }
                catch
                {
                    print("Error: \(error.localizedDescription).")
                }
            }
        // f(S) throws
        else if command == "becomeSplit".text
        {
            let argument0 = arguments[0]
            let text1 = arguments[1]
            let argument1: Int = Int(string: text1.string)

            do
            {
                try self.client.becomeSplit(argument0, argument1)
            }
            catch
            {
                print("Error: \(error.localizedDescription).")
            }
        }
        // f(S) throws
        else if command == "becomeSplitOnHead".text
        {
                let text0 = arguments[0]

                let argument0: Text = text0

            do
            {
                try self.client.becomeSplitOnHead(argument0)
            }
            catch
            {
                print("Error: \(error.localizedDescription).")
            }
        }
        // f(S) throws
        else if command == "becomeSplitOnTail".text
        {
                let text0 = arguments[0]

                let argument0: Text = text0

            do
            {
                try self.client.becomeSplitOnTail(argument0)
            }
            catch
            {
                print("Error: \(error.localizedDescription).")
            }
        }
        // f(S) throws
        else if command == "becomeSplitOnLastHead".text
        {
                let text0 = arguments[0]

                let argument0: Text = text0

            do
            {
                try self.client.becomeSplitOnLastHead(argument0)
            }
            catch
            {
                print("Error: \(error.localizedDescription).")
            }
        }
        // f(S) throws
        else if command == "becomeSplitOnLastTail".text
        {
                let text0 = arguments[0]

                let argument0: Text = text0

            do
            {
                try self.client.becomeSplitOnLastTail(argument0)
            }
            catch
            {
                print("Error: \(error.localizedDescription).")
            }
        }
        // f(S) throws
        else if command == "becomeSplitAtHead".text
        {
            let text0 = arguments[0]
            let argument0: Int = Int(string: text0.string)
            let text1 = arguments[1]
            let argument1: Int = Int(string: text1.string)

            do
            {
                try self.client.becomeSplitAtHead(argument0, argument1)
            }
            catch
            {
                print("Error: \(error.localizedDescription).")
            }
        }
        // f(S) throws
        else if command == "becomeSplitAtTail".text
        {
            let text0 = arguments[0]
            let argument0: Int = Int(string: text0.string)
            let text1 = arguments[1]
            let argument1: Int = Int(string: text1.string)

            do
            {
                try self.client.becomeSplitAtTail(argument0, argument1)
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
            // f(S) -> T 2
            else if command == "join".text
            {
                let parameters = arguments

                do
                {
                    let result = try self.client.join(parameters)
                    print(result)
                }
                catch
                {
                    print("Error: \(error.localizedDescription).")
                }
            }
            // f(T)
            else if command == "becomeJoined".text
            {
                let parameters = arguments

                do
                {
                    try self.client.becomeJoined(parameters)
                }
                catch
                {
                    print("Error: \(error.localizedDescription).")
                }
            }
            // f(S) -> T 2
            else if command == "prepend".text
            {
                let text0 = arguments[0]

                let argument0: Text = text0

                do
                {
                    let result = try self.client.prepend(argument0)
                    print(result)
                }
                catch
                {
                    print("Error: \(error.localizedDescription).")
                }
            }
            // f(S) -> T 2
            else if command == "append".text
            {
                let text0 = arguments[0]

                let argument0: Text = text0

                do
                {
                    let result = try self.client.append(argument0)
                    print(result)
                }
                catch
                {
                    print("Error: \(error.localizedDescription).")
                }
            }
            // f(T)
            else if command == "becomePrepended".text
            {
                let text0 = arguments[0]

                let argument0: Text = text0

                do
                {
                    try self.client.becomePrepended(argument0)
                }
                catch
                {
                    print("Error: \(error.localizedDescription).")
                }
            }
            // f(T)
            else if command == "becomeAppended".text
            {
                let text0 = arguments[0]

                let argument0: Text = text0

                do
                {
                    try self.client.becomeAppended(argument0)
                }
                catch
                {
                    print("Error: \(error.localizedDescription).")
                }
            }
            // f(S) -> T 2
            else if command == "containsSubstring".text
            {
                let text0 = arguments[0]

                let argument0: Text = text0

                do
                {
                    let result = try self.client.containsSubstring(argument0)
                    print(result)
                }
                catch
                {
                    print("Error: \(error.localizedDescription).")
                }
            }
            // f(S) -> T 2
            else if command == "startsWith".text
            {
                let text0 = arguments[0]

                let argument0: Text = text0

                do
                {
                    let result = try self.client.startsWith(argument0)
                    print(result)
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
        // f(S) -> T 1
        else if command == "dropPrefix".text
        {
                let text0 = arguments[0]

                let argument0: Text = text0

            do
            {
                let result = try self.client.dropPrefix(argument0)
                print(result)
            }
            catch
            {
                print("Error: \(error.localizedDescription).")
            }
        }
        // f(S) throws
        else if command == "becomeDropPrefix".text
        {
                let text0 = arguments[0]

                let argument0: Text = text0

            do
            {
                try self.client.becomeDropPrefix(argument0)
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
            // f(S) -> T 2
            else if command == "lines".text
            {
                let argument0: Text?
                if arguments.count == 0
                {
                    argument0 = nil
                }
                else
                {
                    argument0 = arguments[0]
                }

                do
                {
                    let result = try self.client.lines(argument0)
                    print(result)
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