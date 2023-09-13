//
//  BestItemView.swift
//  NikeShoes
//
//  Created by 최소정 on 2023/09/06.
//

import SwiftUI
import NikeShoesCore

struct BestItemView: View {
    
    var sampleBestItem: [String] = ["Top 1", "Top 2", "Top3"]
    
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("8월 마지막 주 베스트 아이템 🏅") // 여기 나중에 날짜관련 extension 설정해서 어느시기인지 알려주기
                Text("지난주 가장 사랑받은 나이키 제품")
                    .foregroundColor(.textGray)
                
            }
            .font(Font.medium20)
            .padding(1)
            .padding(.leading)
            
            // 가로 카테고리
            ScrollView(.horizontal) {
                LazyHStack {
                    
                    ForEach(sampleBestItem, id: \.self) { item in
                        
                        NavigationLink(destination: ProductDetailView(shoesData: detailSample)) { // ItemListView로 이동
                            
                            VStack(alignment: .leading) {
                                
                                AsyncImage(url: URL(string: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/02a56ceb-e402-43fd-a1da-5315f1780831/%EC%97%90%EC%96%B4-%ED%8F%AC%EC%8A%A4-1-07-%EC%9D%B4%EC%A7%80%EC%98%A8-%EC%97%AC%EC%84%B1-%EC%8B%A0%EB%B0%9C-2ptxaKi4.png")) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 150, height: 150)
                                .clipped()
                                
                                Text("\(item)")
                                    .foregroundColor(.black)
                                    .font(Font.semiBold12)
                                
                                    .padding([.top, .leading], 10)
                                
                            }
                        }
                    }
                    NavigationLink(destination: ItemListView()) {
                        VStack(alignment: .leading) {
                            AsyncImage(url: URL(string: "https://cdn-icons-png.flaticon.com/512/5553/5553769.png")) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .clipped()
                            
                            HStack {
                                Text("Top10 제품 보러가기")
                                Image(systemName: "arrow.right.circle")
                            }
                            .foregroundColor(.black)
                            .font(Font.semiBold12)
                            .padding([.top, .leading], 10)
                            
                        }
                    }
                }
                .padding()
            }
        }
        .padding([.top, .bottom], 20)
    }
}

struct BestItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            BestItemView()
                .frame(height: 300)
        }
    }
}
