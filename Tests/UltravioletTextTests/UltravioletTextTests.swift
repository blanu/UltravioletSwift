import XCTest
@testable import UltravioletText

import BigNumber
import SwiftHexTools
import Transmission
import TransmissionData

final class UltravioletTextTests: XCTestCase
{
    func testtoHex_request() throws
    {
        let request = MutableTextRequestValue.toHex_request
        print(request)

        let buffer = TransmissionData()

        try request.saveDaydream(buffer)

        buffer.flip()

        print(buffer)

        let request2 = try MutableTextRequestValue(daydream: buffer)
        print(request2)
    }

    func testtoHex_requestValue() throws
    {
        let request = Value.MutableTextRequest(.toHex_request)
        print(request)

        let buffer = TransmissionData()

        try request.saveDaydream(buffer)

        buffer.flip()

        print(buffer)

        let request2 = try Value(daydream: buffer)

        print(request2)
    }

    func testVarint() throws
    {
        let request = Value.Varint(BInt(0))
        print(request)

        let buffer = TransmissionData()

        try request.saveDaydream(buffer)

        buffer.flip()

        print(buffer)

        let request2 = try Value(daydream: buffer)

        print(request2)
    }

    func testListVarint() throws
    {
        let request = Value.ListVarint([BInt(0)])
        print(request)

        let buffer = TransmissionData()

        try request.saveDaydream(buffer)

        buffer.flip()

        let request2 = try Value(daydream: buffer)

        print(request2)
    }

    func testText() throws
    {
        let request = Value.TextBuiltin("")
        print(request)

        let buffer = TransmissionData()

        try request.saveDaydream(buffer)

        buffer.flip()

        print(buffer)

        let request2 = try Value(daydream: buffer)

        print(request2)
    }

    func testString() throws
    {
        let request = Value.StringBuiltin("")
        print(request)

        let buffer = TransmissionData()

        try request.saveDaydream(buffer)

        buffer.flip()

        print(buffer)

        let request2 = try Value(daydream: buffer)

        print(request2)
    }
}
