//
//  BestItemView.swift
//  NikeShoes
//
//  Created by 최소정 on 2023/09/06.
//

import SwiftUI

struct BestItemView: View {
    
    var sampleBestItem: [String] = ["Top 1", "Top 2", "Top3"]
    
    var body: some View {
        VStack(alignment: .leading){
            Group{
                Text("8월 마지막 주 베스트 아이템 🏅") // 여기 나중에 날짜관련 extension 설정해서 어느시기인지 알려주기
                Text("지난주 가장 사랑받은 나이키 제품")
                    .foregroundColor(.textGray)
                    
            }
            .font(Font.medium20)
            .padding(1)
            .padding(.leading)
            
            //가로 카테고리
            ScrollView(.horizontal) {
                LazyHStack {
                    
                    ForEach(sampleBestItem, id: \.self) { item in
                        
                        NavigationLink(destination: ProductDetailView()) { // ItemListView로 이동
                            
                            VStack(alignment: .leading){
                                
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
                                
                                    .padding([.top,.leading],10)
                                
                            }
                        }
                    }
                    NavigationLink(destination: ItemListView()) {
                        VStack(alignment: .leading) {
                            AsyncImage(url: URL(string: "data:image/png;base64,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")) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .clipped()
                            
                            HStack{
                                Text("Top10 제품 보러가기")
                                Image(systemName: "arrow.right.circle")
                            }
                            .foregroundColor(.black)
                            .font(Font.semiBold12)
                            .padding([.top,.leading],10)
                            
                        }
                    }
                }
                .padding()
            }
        }
        .padding([.top,.bottom],20)
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
