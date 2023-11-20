//
//  VaporServer.swift
//  EmbeddedWebApp
//
//  Created by Brett Meader on 17/11/2023.
//

import Foundation
import Vapor

let environment: Environment = .development

class VaporServer: Server {
    var port: Int
    
    var hostURL: URL? {
        var components = URLComponents(string: "http://localhost")
        components?.port = self.port
        return components?.url
    }
    
    lazy var app: Application? = {
        return Application(.development)
    }()

    public init(port: Int = 8080) {
        self.port = port
    }

    private func setDirectory(_ directory: String) {
        let file = FileMiddleware(publicDirectory: directory, defaultFile: "index.html")
        app?.middleware.use(file)
    }

    public func start(atPath path: String) async throws {
        app?.http.server.configuration.port = port
        self.setDirectory(path)
        try app?.start()
    }

    public func stop() {
        app?.shutdown()
        app = nil
    }
}
