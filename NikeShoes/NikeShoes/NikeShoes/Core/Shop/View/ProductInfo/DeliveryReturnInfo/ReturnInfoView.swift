//
//  ReturnInfoView.swift
//  NikeShoes
//
//  Created by 전민돌 on 9/11/23.
//

import SwiftUI
import SafariServices

struct ReturnInfoView: View {
    @State private var isShowingReturnGuideSheet = false
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("무료 반품 안내")
                    .fontWeight(.medium)
                    .padding(.bottom, 5)
                Text("제품 수령일로부터 14일 동안 제공되는 무료 반품")
                HStack {
                    Text("서비스를 만나보세요.")
                    Button {
                        isShowingReturnGuideSheet.toggle()
                    } label: {
                        Text("자세히 보기")
                            .underline()
                            .foregroundColor(.black)
                    }
                    .sheet(isPresented: $isShowingReturnGuideSheet) {
                        SizeGuideView(urlString: "https://www.nike.com/kr/help/a/returns-policy-kr")
                    }
                }
                Text(" ")
                    .font(.caption)
            }
        }
    }
}

struct ReturnGuideView: UIViewControllerRepresentable {
    var urlString: String
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let safariViewController = SFSafariViewController(url: URL(string: urlString)!)
        
        return safariViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct ReturnInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ReturnInfoView()
    }
}
