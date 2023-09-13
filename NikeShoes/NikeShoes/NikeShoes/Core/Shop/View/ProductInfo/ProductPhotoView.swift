//
//  ProductPhotoView.swift
//  NikeShoes
//
//  Created by 전민돌 on 9/11/23.
//

import SwiftUI
import NikeShoesCore

struct ProductPhotoView: View {
    var shoesData: ShoesDTO
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("\(shoesData.name) \(shoesData.category) 신발")
                    .font(.mediumBold24)
                Text("살펴보기")
                    .font(.mediumBold24)
                    .padding(.bottom, 40)

                if shoesData.stylingImage.isEmpty {
                    AsyncImage(url: URL(string: "https://static.nike.com/a/images/t_prod/w_1920,c_limit,f_auto,q_auto/243a7c32-0aa7-4c0c-a238-c2b91b91d67e/pdp-%EA%B5%90%EC%B2%B4.jpg")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding(.horizontal, -200)
                    } placeholder: {
                        ProgressView()
                    }
                    .padding(.bottom, 55)
                    
                    Text("갑피의 스티치된 오버레이가 내구성과 지지력을 더하며 헤리티지 스타일을 선사합니다.")
                        .lineSpacing(10)
                        .padding(.bottom, 45)
                    
                    AsyncImage(url: URL(string: "https://static.nike.com/a/images/t_prod/w_1920,c_limit,f_auto,q_auto/b2f8e5b8-ffe4-45e1-8b70-ed502fcf6243/pdp-%EA%B5%90%EC%B2%B4.jpg")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding(.horizontal, -200)
                    } placeholder: {
                        ProgressView()
                    }
                    .padding(.bottom, 55)
                    
                    Text("본래 퍼포먼스 농구화를 위해 고안된 나이키 에어 쿠셔닝이 온종일 편안하고 가벼운 착화감을 제공합니다.")
                        .lineSpacing(10)
                        .padding(.bottom, 45)
                    
                    AsyncImage(url: URL(string: "https://static.nike.com/a/images/t_prod/w_1920,c_limit,f_auto,q_auto/d5ff67b4-6bb1-47ec-ae67-3484c21ac5de/pdp-%EA%B5%90%EC%B2%B4.jpg")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding(.horizontal, -200)
                    } placeholder: {
                        ProgressView()
                    }
                    .padding(.bottom, 55)
                    
                    Text("로우 컷 실루엣이 깔끔하고 매끈한 룩을 연출합니다.")
                        .lineSpacing(10)
                        .padding(.bottom, 45)
                } else {
                    ForEach(shoesData.stylingImage, id: \.self) { imageURL in
                        AsyncImage(url: URL(string: imageURL)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            ProgressView()
                        }
                        .padding(.bottom, 55)
                    }
                }
                
                Divider()
            }
            .padding()
        }
    }
}

struct ProductPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        ProductPhotoView(shoesData: detailSample)
    }
}
