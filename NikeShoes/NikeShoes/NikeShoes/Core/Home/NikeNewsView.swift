//  NikeNewsView.swift
//  NikeShoes
//
//  Created by 여성은 on 2023/09/07.
//

import SwiftUI
import SDWebImageSwiftUI

struct NikeNewsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            // 헤더 부분
            headerSection
            // GIF 이미지와 관련 텍스트
            contentSection
        }
    }
    
    // 헤더 섹션
    private var headerSection: some View {
        HStack(alignment: .bottom) {
            Text("나이키 소식")
                .font(.medium20)
            Spacer()
            NavigationLink(destination: Text("소식 모두 보기")) {
                Text("모두 보기")
                    .font(.system(size: 16))
                    .fontWeight(.regular)
                    .foregroundColor(.textGray)
            }
        }
        .padding(EdgeInsets(top: 1, leading: 16, bottom: 20, trailing: 16))
    }
    
    // 콘텐츠 섹션
    private var contentSection: some View {
        ZStack {
            // 웹에서 GIF 이미지를 로드
            WebImage(url: URL(string: "https://media.giphy.com/media/3owyoSnOZXam3QgkfK/giphy.gif"))
                .resizable()
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .scaledToFit()
            
            // 텍스트와 "자세히 보기" 버튼
            VStack {
                Spacer()
                detailText
                actionButton
            }
        }
    }
    
    // 상세 텍스트
    private var detailText: some View {
        Text("JUST DO IT\n빛나는 자신감\n새로운 에너지를 더하다")
            .bold()
            .font(.system(size: 40, weight: .heavy))
            .foregroundColor(.white)
            .padding(.bottom, -20)  // 텍스트와 버튼 사이의 간격을 줄이기 위해
    }
    
    // 자세히 보기 버튼
    private var actionButton: some View {
        HStack {
            NavigationLink(destination: Text("자세한 내용")) {
                Text("자세히 보기")
                    .foregroundColor(.black)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.white)
                    .cornerRadius(50)
            }
        }
    }
}

struct NikeNewsView_Previews: PreviewProvider {
    static var previews: some View {
        NikeNewsView()
    }
}
