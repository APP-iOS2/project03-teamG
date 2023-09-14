//  NikeNewsView.swift
//  NikeShoes
//
//  Created by 여성은 on 2023/09/07.
//

import SwiftUI
import SDWebImageSwiftUI

struct NikeNewsView: View {
    
    @State var isShowingAll: Bool = false
    @State var isShowingDetail: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            headerSection
            contentSection
        }
    }
    // 헤더 부분
    private var headerSection: some View {
        HStack(alignment: .bottom) {
            Text("나이키 소식")
                .font(.title)
            Spacer()
            Button("모두 보기") {
                isShowingAll = true
            }
            .sheet(isPresented: $isShowingAll) {
                SizeGuideView(urlString: "https://www.nike.com/kr/")
            }
            .font(.system(size: 16))
            .foregroundColor(Color.gray)
        }
        .padding(EdgeInsets(top: 1, leading: 16, bottom: 20, trailing: 16))
    }
    // 콘텐츠 부분
    private var contentSection: some View {
        ZStack {
            WebImage(url: URL(string: "https://media.giphy.com/media/3owyoSnOZXam3QgkfK/giphy.gif"))
                .resizable()
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .scaledToFit()
            
            VStack {
                Spacer()
                detailText
                HStack {
                    actionButton
                        .padding(20)
                    Spacer()
                }
            }
        }
    }
    // 콘텐츠내 텍스트
    private var detailText: some View {
        Text("JUST DO IT\n빛나는 자신감\n새로운 에너지를 더하다")
            .bold()
            .font(.system(size: 40, weight: .heavy))
            .foregroundColor(.white)
            .padding(.bottom, -10)
    }
    // 콘텐츠내 버튼
    private var actionButton: some View {
        Button("자세히 보기") {
            isShowingDetail = true
        }
        .sheet(isPresented: $isShowingDetail) {
            SizeGuideView(urlString: "https://www.nike.com/kr/styling/running-styling")
        }

        .foregroundColor(.black)
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(Color.white)
        .cornerRadius(50)
    }
}

struct NikeNewsView_Previews: PreviewProvider {
    static var previews: some View {
        NikeNewsView()
    }
}
