//
//  SizeGuideView.swift
//  NikeShoes
//
//  Created by 전민돌 on 9/7/23.
//

import SwiftUI
import SafariServices

struct SizeGuideView: UIViewControllerRepresentable {
    var urlString: String
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let safariViewController = SFSafariViewController(url: URL(string: urlString)!)
        
        return safariViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct SizeGuideView_Previews: PreviewProvider {
    static var previews: some View {
        SizeGuideView(urlString: "https://www.nike.com/kr/size-fit/mens-footwear")
    }
}
