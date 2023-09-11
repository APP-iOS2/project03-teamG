//
//  ReviewView.swift
//  NikeShoes
//
//  Created by 전민돌 on 9/11/23.
//

import SwiftUI
import WebKit

struct ReviewView: UIViewRepresentable  {
    
    func makeUIView(context: Context) -> some UIView {
        let webView: WKWebView = WKWebView()
        
        if let url = URL(string: "https://www.nike.com/kr/t/%2525EC%252597%252590%2525EC%252596%2525B4-%2525ED%25258F%2525AC%2525EC%25258A%2525A4-1-07-%2525EB%252582%2525A8%2525EC%252584%2525B1-%2525EC%25258B%2525A0%2525EB%2525B0%25259C-TttlGpDb/CW2288-111?turntoflow=review&writeReview=true&turntoReviewSource=inline&turntoCampaign=AppPDP") {
            webView.load(URLRequest(url: url))
        }
        
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
#Preview {
    ReviewView()
}
