//
//  WebApp.swift
//  VaporExample
//
//  Created by Brett Meader on 17/11/2023.
//

import Foundation

@Observable
@MainActor
class WebApp: ObservableObject {
    
    enum LoadingState: Equatable {
        case loading
        case loaded
        case failed(String)
        case notStarted
    }
    
    public var state: LoadingState = .notStarted
    
    private(set) var server: Server
    private let folder: String
    
    init(server: Server, locationOfIndexHTML folder: String) {
        self.server = server
        self.folder = folder
    }
    
    func start() async {
        
        self.state = .loading
        
        guard let url = Bundle(for: type(of: self)).url(forResource: folder, withExtension: nil)
        else {
            self.state = .failed("Couldn't load index.html in folder \(folder)")
            return
        }
        do {
            try await self.server.start(atPath: url.path())
            self.state = .loaded
        }
        catch {
            self.state = .failed(error.localizedDescription)
        }
    }
    
    func stop() {
        self.server.stop()
        self.state = .notStarted
    }
}
