//
//  VaporExampleTests.swift
//  VaporExampleTests
//
//  Created by Brett Meader on 17/11/2023.
//

import XCTest
@testable import VaporExample

//class MockServer: Server {
//    var hostURL: URL?
//    var port: Int = 0
//    func start(atPath path: String) async throws {
//        print("Starting mock server")
//    }
//    func stop() {
//        print("Stopping mock server")
//    }
//}

final class VaporExampleTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testViewModel_init_success() async throws {
        let webApp = WebApp(server: VaporServer(), locationOfIndexHTML: "Web")
        XCTAssert(webApp.state == .notStarted)
        await webApp.start()
        XCTAssert(webApp.state == .loaded)
        webApp.stop()
        XCTAssert(webApp.state == .notStarted)
    }
    
    @MainActor
    func testViewModel_init_failure() async throws {
        let webApp = WebApp(server: VaporServer(), locationOfIndexHTML: "-----")
        XCTAssert(webApp.state == .notStarted)
        await webApp.start()
        XCTAssert(webApp.state == .failed("Couldn\'t load index.html in folder -----"))
        webApp.stop()
        XCTAssert(webApp.state == .notStarted)
    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}
