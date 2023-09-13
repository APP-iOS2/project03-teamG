//
//  InterestItemView.swift
//  NikeShoes
//
//  Created by 최소정 on 2023/09/06.
//

import SwiftUI
import NikeShoesCore

struct InterestItemView: View {
    
    var sampleInterestItems: [String] = ["이런 관심사~", "저런 관심사", "이런모델", "저런모델"]
    
    var body: some View {
        VStack(alignment: .leading) {
            
                HStack(alignment: .bottom) {
                    Text("관심 제품 구매하기")
                        .font(Font.medium20)
                    Spacer()
                    NavigationLink {
                        // 마이페이지에 팔로잉 수정으로 이동
                        Text("마이페이지_관심사 수정 뷰로 이동")
                    } label: {
                        Text("관심사 수정")
                            .font(.system(size: 16))
                            .fontWeight(.regular)
                            .foregroundColor(.textGray)
                    }
                    
                }
                .padding(1)
                .padding([.leading, .trailing])
                
                // 가로 카테고리
                ScrollView(.horizontal) {
                    LazyHStack {
                        
                        ForEach(sampleInterestItems, id: \.self) { item in
                            
                            NavigationLink(destination: ProductDetailView(shoesData: detailSample)) { // ItemListView로 이동
                                
                                ZStack(alignment: .center) {
                                    
                                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2013/02/25/04/37/basketball-85919_1280.jpg")) { image in
                                        image.resizable()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 255, height: 255)
                                    .clipped()
                                    
                                    Text("\(item)")
                                        .foregroundColor(.white)
                                        .font(Font.medium20)
                                        .padding([.top, .leading], 10)
                                    
                                }
                            }
                        }
                        
                    }
                    .padding()
                }
        }
        .padding([.top, .bottom], 20)
    }
}

struct InterestItemView_Previews: PreviewProvider {
    static var previews: some View {
        InterestItemView()
            .frame(height: 400)
    }
}
