//
//  File.swift
//  EmbeddedWebApp
//
//  Created by Brett Meader on 31/10/2023.
//

import Foundation

protocol Server {
    var port: Int { get set }
    var hostURL: URL? { get }
    func start(atPath path: String) async throws
    func stop()
}

