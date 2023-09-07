//
//  NikeNewsView.swift
//  NikeShoes
//
//  Created by 여성은 on 2023/09/07.
//

import SwiftUI

struct NikeNewsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .bottom) {
                Text("나이키 소식")
                    .font(Font.medium20)
                Spacer()
                NavigationLink {
                    // 소식모두보기
                    Text("소식 모두 보기")
                } label: {
                    Text("모두 보기")
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .foregroundColor(.textGray)
                }
            }
            .padding(1)
            .padding([.leading, .trailing])
            
            // 소식칸
            LazyVStack {
                NavigationLink(destination: Text("해당 페이지로")) {
                    VStack(alignment: .leading) {
                        // 상품 이미지
                        AsyncImage(url: URL(string: "https://static.nike.com/a/images/f_auto/dpr_2.0,cs_srgb/w_896,c_limit/f9e8bd6a-04f6-4db5-8060-55247708bd9d/%EC%A1%B0%EB%8D%98-%EC%8A%A4%ED%83%80%EC%9D%BC%EB%A7%81.jpg")) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 393, height: 525)
                                .clipped()
                        } placeholder: {
                            Image("progress")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 180)
                                .clipped()
                        }
                        
                    }
                }
                
                .padding()
            }
        }
        .padding([.top, .bottom], 30)
    }
}

struct NikeNewsView_Previews: PreviewProvider {
    static var previews: some View {
        NikeNewsView()
    }
}
