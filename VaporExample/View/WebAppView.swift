//
//  WebAppView.swift
//  EmbeddedWebApp
//
//  Created by Brett Meader on 31/10/2023.
//
import SwiftUI

struct WebAppView: View {
   
    @EnvironmentObject
    var webApp: WebApp
  
    var body: some View {
        VStack {
            if webApp.state == .loading {
                ProgressView()
            }
            if webApp.state == .loaded {
                WebView(url: webApp.server.hostURL)
            }
        }
    }
}
