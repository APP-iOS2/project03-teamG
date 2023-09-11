//
//  DeliveryInfoView.swift
//  NikeShoes
//
//  Created by 전민돌 on 9/11/23.
//

import SwiftUI
import SafariServices

struct DeliveryInfoView: View {
    @State private var isShowingDeliveryGuideSheet = false
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("무료 배송 안내")
                    .fontWeight(.medium)
                    .padding(.bottom, 5)
                Text("모든 제품을 무료 배송 서비스로 만나보세요.")
                Button {
                    isShowingDeliveryGuideSheet.toggle()
                } label: {
                    Text("자세히 보기")
                        .underline()
                        .foregroundColor(.black)
                }
                .sheet(isPresented: $isShowingDeliveryGuideSheet) {
                    SizeGuideView(urlString: "https://www.nike.com/kr/help/a/shipping-delivery-kr")
                }
                Text(" ")
                    .font(.caption)
            }
        }
    }
}

struct DeliveryGuideView: UIViewControllerRepresentable {
    var urlString: String
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let safariViewController = SFSafariViewController(url: URL(string: urlString)!)
        
        return safariViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct DeliveryInfoView_Previews: PreviewProvider {
    static var previews: some View {
        DeliveryInfoView()
    }
}
