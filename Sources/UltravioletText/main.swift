//
//  main.swift
//
//
//  Created by the Daydream Compiler on 2024-01-16 23:32:18 +0000.
//

import ArgumentParser
import FileLogging
import Foundation
import Logging

import BigNumber
import Datable
import RadioWave
import SwiftHexTools
import Text

struct MutableTextCommandLine: ParsableCommand
{
    static let configuration = CommandConfiguration(
        commandName: "MutableText",
        subcommands: [Shell.self, Service.self]
    )
}

extension MutableTextCommandLine
{
    struct Shell: ParsableCommand
    {
        @Argument(help: "host name of server")
        var host: String

        @Argument(help: "port for server")
        var port: Int

        mutating public func run() throws
        {
            let cwd = FileManager.default.currentDirectoryPath
            let cwdURL = URL(fileURLWithPath: cwd)
            let logURL = cwdURL.appendingPathComponent("MutableTextShell.log")
            var logger = try FileLogging.logger(label: "MutableTextShell", localFile: logURL)
            logger.logLevel = .trace

            logger.debug("MutableTextShell start.")

            let _ = try MutableTextShell(host: host, port: port, logger: logger)
        }
    }
}

extension MutableTextCommandLine
{
    struct Service: ParsableCommand
    {
        mutating public func run() throws
        {
            let cwd = FileManager.default.currentDirectoryPath
            let cwdURL = URL(fileURLWithPath: cwd)
            let logURL = cwdURL.appendingPathComponent("MutableTextService.log")
            var logger = try FileLogging.logger(label: "MutableTextService", localFile: logURL)
            logger.logLevel = .trace

            logger.debug("MutableTextService start.")

            let _ = try MutableTextService(logger: logger)
        }
    }
}

MutableTextCommandLine.main()