import XCTest
@testable import UltravioletDebugger

import BigNumber
import SwiftHexTools

final class UltravioletDebuggerTests: XCTestCase
{
    func testVarint() throws
    {
        let binta = BInt(1)
        let bintb = BInt(varint: binta.varint)

        XCTAssertEqual(binta, bintb)
    }

    func testTypeIdentifier() throws
    {
        let typeIdentifiera = TypeIdentifiers.NaturalType
        let typeIdentifierb = TypeIdentifiers(varint: typeIdentifiera.varint)

        XCTAssertEqual(typeIdentifiera, typeIdentifierb)
    }

    func testNaturalValue() throws
    {
        let bint = BInt(1)
        let nata = NaturalValue(bint)
        let data = nata.data

        print(data.hex)

        guard let natb = NaturalValue(data: data) else
        {
            XCTFail()
            return
        }

        XCTAssertEqual(nata, natb)
    }

    func testBooleanValue() throws
    {
        let boola = BooleanValue.True
        let data = boola.data

        print(data.hex)

        guard let boolb = BooleanValue(data: data) else
        {
            XCTFail()
            return
        }

        XCTAssertEqual(boola, boolb)
    }

    func testBoolean() throws
    {
        let bool = BooleanValue.True
        let vala = Value.Boolean(bool)
        let data = vala.data

        print(data.hex)

        guard let valb = Value(data: data) else
        {
            XCTFail()
            return
        }

        XCTAssertEqual(vala, valb)
    }

    func testNatural() throws
    {
        let bint = BInt(1)
        let nata = Value.Natural(NaturalValue(bint))
        let data = nata.data

        print(data.hex)

        guard let natb = Value(data: data) else
        {
            XCTFail()
            return
        }

        XCTAssertEqual(nata, natb)
    }

    func testIdentifier() throws
    {
        let bint = BInt(1)
        let nat = NaturalValue(bint)
        let id = IdentifierValue(nat)
        let vala = Value.Identifier(id)
        let data = vala.data

        print(data.hex)

        guard let valb = Value(data: data) else
        {
            XCTFail()
            return
        }

        XCTAssertEqual(vala, valb)
    }

    func testRequestID() throws
    {
        let bint = BInt(1)
        let nat = NaturalValue(bint)
        let id = IdentifierValue(nat)
        let reqid = RequestIDValue(id)
        let vala = Value.RequestID(reqid)
        let data = vala.data

        print(data.hex)

        guard let valb = Value(data: data) else
        {
            XCTFail()
            return
        }

        XCTAssertEqual(vala, valb)
    }

    func testisRunning() throws
    {
        let bint = BInt(1)
        let nat = NaturalValue(bint)
        let id = IdentifierValue(nat)
        let reqid = RequestIDValue(id)
        let isRun = isRunning_requestValue(reqid)
        let vala = Value.isRunning_request(isRun)
        let data = vala.data

        print(data.hex)

        guard let valb = Value(data: data) else
        {
            XCTFail()
            return
        }

        XCTAssertEqual(vala, valb)
    }

    func testRequest() throws
    {
        let bint = BInt(1)
        let nat = NaturalValue(bint)
        let id = IdentifierValue(nat)
        let reqid = RequestIDValue(id)
        let isRun = isRunning_requestValue(reqid)
        let req = RequestValue.isRunning_request(isRun)
        let vala = Value.Request(req)
        let data = vala.data

        print(data.hex)

        guard let valb = Value(data: data) else
        {
            XCTFail()
            return
        }

        XCTAssertEqual(vala, valb)
    }

    func testMessage() throws
    {
        let bint = BInt(1)
        let uint = NaturalValue(bint)
        let identifier = IdentifierValue(uint)
        let requestId = RequestIDValue(identifier)
        let isRunningRequest = isRunning_requestValue(requestId)
        let request = RequestValue.isRunning_request(isRunningRequest)
        let messagea = Value.Message(MessageValue.Request(request))

        let data = messagea.data

        print(data.hex)

        guard let messageb = Value(data: messagea.data) else
        {
            XCTFail()
            return
        }

        XCTAssertEqual(messagea, messageb)
    }

    func testMessages() throws
    {
        let bint = BInt(1)
        let uint = NaturalValue(bint)
        let identifier = IdentifierValue(uint)
        let requestId = RequestIDValue(identifier)
        let isRunningRequest = isRunning_requestValue(requestId)
        let request = RequestValue.isRunning_request(isRunningRequest)
        let messagea = Value.Message(MessageValue.Request(request))

        let data = messagea.data

        print(data.hex)

        guard let messageb = Value(data: messagea.data) else
        {
            XCTFail()
            return
        }

        XCTAssertEqual(messagea, messageb)
    }
}
