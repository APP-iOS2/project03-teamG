//
//  MessageView.swift
//  NikeShoes
//
//  Created by Suji Jang on 2023/09/05.
//

import SwiftUI

struct MessageView: View {
    @Binding var messageID: String?
    var messageImageURL: String = "https://substackcdn.com/image/fetch/f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F5362a828-0f5b-4d17-a6c5-d0677dc89baa_1000x1000.jpeg"
    var messageTitle: String = "나이키 멤버가 된 것을 환영합니다🙌"
    var messageBody: String = "발급된 웰컴 프로모션 코드를 확인해 보세요."
    
    var body: some View {
        HStack(spacing: 15) {
            AsyncImage(url: URL(string: messageImageURL)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 70, height: 70)

            VStack(alignment: .leading, spacing: 6) {
                Text(messageTitle)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.black)
                
                Text(messageBody)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.gray)
                
                Text("4시간 전")
                    .font(.system(size: 11, weight: .medium))
                    .foregroundColor(.gray)
            }
        }
        .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(messageID: .constant(""))
    }
}
