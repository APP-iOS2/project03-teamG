//
//  InboxView.swift
//  NikeShoes
//
//  Created by Suji Jang on 2023/09/05.
//

import SwiftUI

struct InboxView: View {
    var messageImageURL: String = "https://yt3.googleusercontent.com/FY3wMjCWVYn_nxNQjDETIusaGftQOWYY4kF7sMTOy05nMIQQ89BRL5C6UQlUbycILnQvwnX3GQ=s900-c-k-c0x00ffffff-no-rj"
    var messageTitle: String = "나이키 멤버가 된 것을 환영합니다🙌"
    var messageBody: String = "발급된 웰컴 프로모션 코드를 확인해 보세요."
    
    var body: some View {
        NavigationStack {
            List {
                MessageView(messageTitle: messageTitle, messageBody: messageBody)
            }
            .listStyle(PlainListStyle())
        }
        .navigationTitle("수신함")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct InboxView_Previews: PreviewProvider {
    static var previews: some View {
        InboxView()
    }
}
