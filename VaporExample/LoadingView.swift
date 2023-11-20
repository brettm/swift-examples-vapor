//
//  ContentView.swift
//  VaporExample
//
//  Created by Brett Meader on 17/11/2023.
//

import SwiftUI

struct LoadingView: View {
    @State var webApp: WebApp?
    var body: some View {
        VStack {
            Text("Web App")
            if webApp != nil {
                VStack {
                    WebAppView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
            else {
                VStack {
                    VStack {
                        Text("Starting Server...")
                            .font(.largeTitle).bold()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        Spacer()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    Spacer()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
        .padding()
        .environment(webApp)
        .task(priority: .utility) {
            try? await Task.sleep(nanoseconds: UInt64(1E+9))
            self.webApp = WebApp(server: VaporServer(), locationOfIndexHTML: "Web")
            await self.webApp?.start()
        }
        .onDisappear {
            self.webApp?.stop()
        }
    }
}

#Preview {
    LoadingView()
}
