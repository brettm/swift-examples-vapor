//
//  WebView.swift
//  EmbeddedWebApp
//
//  Created by Brett Meader on 01/11/2023.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL?
    
    func makeUIView(context: Context) -> WKWebView  {
        let wkwebView = WKWebView()
        guard let url = url else { return wkwebView }
        let request = URLRequest(url: url)
        wkwebView.load(request)
        return wkwebView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = url else { return }
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

