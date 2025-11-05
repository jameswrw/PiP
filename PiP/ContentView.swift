//
//  ContentView.swift
//  PiP
//
//  Created by James Weatherley on 05/11/2025.
//

import SwiftUI
import WebKit

struct MyVideoWebView: UIViewRepresentable {
    func makeUIView(context: Context) ->  WKWebView {
        let webView = WKWebView()
        webView.configuration.allowsInlineMediaPlayback = true
        webView.configuration.allowsPictureInPictureMediaPlayback = true
        webView.configuration.mediaTypesRequiringUserActionForPlayback = []

        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.scrollView.isScrollEnabled = false
        
        let path = Bundle.main.path(forResource: "Critter", ofType:"mp4")!
        let url = URL(fileURLWithPath: path)
        uiView.load(URLRequest(url: url))
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            MyVideoWebView()
                .frame(height: 300)
        }
    }
}

#Preview {
    ContentView()
}
