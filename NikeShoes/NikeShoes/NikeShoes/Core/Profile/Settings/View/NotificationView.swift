//
//  NotificationView.swift
//  NikeShoes
//
//  Created by 김성훈 on 2023/09/05.
//

import SwiftUI

struct NotificationView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var title: String
    var notiTitlesAndDescription: [(String, String)] = [
        ("알림 받기", "신제품 소식을 놓치지 마세요. 구매하고자 하는 아이템의 출시 알림을 받아보세요."),
        ("기사, 이벤트 및 트레이닝 팁", "각종 스토리, 트리이닝 팁, 전문가 조언으로 동기 부여를 받아 보세요."),
        ("나이키 멤버 리워드 및 프로모션", "생일 선물과 특별한 혜택, 멤버 전용 상품 액세스까지 모두 누려 보세요."),
        ("최신 상품 및 베스트셀러", "최신 스타일과 베스트셀러 제품에 관한 알림을 받아 보세요.")
    ]
    
    @State private var notificationActive: Bool = false
    
    var body: some View {
        List {
            ForEach(notiTitlesAndDescription, id: \.0) { titleAndDescription in
                
                VStack(alignment: .leading) {
                    HStack {
                        
                        Text(titleAndDescription.0)
                            .font(.medium20)
                        
                        Spacer()
                        
                        Toggle(titleAndDescription.0, isOn: $notificationActive)
                            .font(.medium20)
                            .labelsHidden()
                    }
                    Text(titleAndDescription.1)
                        .font(.medium16)
                        .padding(.trailing, 60)
                }
                .padding(.vertical)
            }
        }
        .listStyle(.plain)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                }
                .foregroundColor(.black)
            }
        }
        .navigationBarTitle(title, displayMode: .inline)
        .navigationBarBackButtonHidden()
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView(title: "알림")
    }
}
