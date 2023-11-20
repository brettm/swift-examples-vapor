//
//  VaporExampleApp.swift
//  VaporExample
//
//  Created by Brett Meader on 17/11/2023.
//

import SwiftUI


@main
struct AppLauncher {
    static func main() throws {
        if NSClassFromString("XCTestCase") == nil {
            VaporExampleApp.main()
        } else {
            TestApp.main()
        }
    }
}

struct VaporExampleApp: App {
    var body: some Scene {
        WindowGroup {
            LoadingView()
        }
    }
}

struct TestApp: App {
    var body: some Scene {
        WindowGroup {
            Text("Running Unit Tests")
        }
    }
}

