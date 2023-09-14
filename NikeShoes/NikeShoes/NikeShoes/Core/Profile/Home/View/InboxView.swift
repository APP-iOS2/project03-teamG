//
//  InboxView.swift
//  NikeShoes
//
//  Created by Suji Jang on 2023/09/05.
//

import SwiftUI

struct InboxView: View {
    var title: String
    @State var messageID: String? = nil
    var messageImageURL: String = "https://yt3.googleusercontent.com/FY3wMjCWVYn_nxNQjDETIusaGftQOWYY4kF7sMTOy05nMIQQ89BRL5C6UQlUbycILnQvwnX3GQ=s900-c-k-c0x00ffffff-no-rj"
    var messageTitle: String = "나이키 멤버가 된 것을 환영합니다🙌"
    var messageBody: String = "발급된 웰컴 프로모션 코드를 확인해 보세요."
    
    var body: some View {
        NavigationStack {
            if messageID == nil {
                OrdersEmptyView()
            } else {
                List {
                    MessageView(messageID: $messageID, messageTitle: messageTitle, messageBody: messageBody)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("수신함")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(NavigationNikeSetting(title: title))
    }
}

struct InboxEmptyView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Text("아직 표시될 메세지가 없습니다")
                    .font(.semiBold24)
                    .foregroundColor(.black)
                Spacer()
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
            
            HStack {
                Text("나이키로부터 메세지와 알림이 오면 표시됩니다.")
                    .font(.medium16)
                    .foregroundColor(.black)
                    .lineSpacing(8)
                Spacer()
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
        }
        .padding()
    }
}

struct InboxView_Previews: PreviewProvider {
    static var previews: some View {
        InboxView(title: "수신함")
//        InboxEmptyView()
    }
}
