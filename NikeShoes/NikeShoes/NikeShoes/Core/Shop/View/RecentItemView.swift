//
//  RecentItemView.swift
//  NikeShoes
//
//  Created by 최소정 on 2023/09/06.
//

import SwiftUI

struct RecentItemView: View {
    
    @State var sampleRecentItems: [String] = ["에어 조던 1 미드", "나이키 덩크 로우", "3", "4", "5", "6", "7", "8", "9", "10"]
    @State var tempItems: [String] = []
    
    var body: some View {
        VStack(alignment: .leading) {
            if !sampleRecentItems.isEmpty {
                
                HStack(alignment: .bottom) {
                    Text("최근 본 제품")
                        .font(Font.medium20)
                    Spacer()
                    Button {
                        // sampleRecentItems 삭제
                        sampleRecentItems.removeAll()
                    } label: {
                        Text("삭제")
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
                        
                        // 최근 본 제품 개수 제한 (이거 말고 다른 방법도 있을까?
                        if sampleRecentItems.count < 6 {
                            ForEach(sampleRecentItems, id: \.self) { item in
                                
                                NavigationLink(destination: ProductDetailView()) { // ItemListView로 이동
                                    
                                    VStack(alignment: .leading) {
                                        
                                        AsyncImage(url: URL(string: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/af53d53d-561f-450a-a483-70a7ceee380f/%EB%8D%A9%ED%81%AC-%EB%A1%9C%EC%9A%B0-%EC%97%AC%EC%84%B1-%EC%8B%A0%EB%B0%9C-ZuZyA5Sj.png")) { image in
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
                        } else {
                            ForEach(sampleRecentItems[0...4], id: \.self) { item in
                                
                                NavigationLink(destination: ProductDetailView()) { // ItemListView로 이동
                                    
                                    VStack(alignment: .leading) {
                                        
                                        AsyncImage(url: URL(string: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/af53d53d-561f-450a-a483-70a7ceee380f/%EB%8D%A9%ED%81%AC-%EB%A1%9C%EC%9A%B0-%EC%97%AC%EC%84%B1-%EC%8B%A0%EB%B0%9C-ZuZyA5Sj.png")) { image in
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
                        }
                        
                    }
                    .padding()
                }
            }
        }
        .padding([.top, .bottom], 20)
    }
}

struct RecentItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            RecentItemView()
                .frame(height: 300)
        }
    }
}
