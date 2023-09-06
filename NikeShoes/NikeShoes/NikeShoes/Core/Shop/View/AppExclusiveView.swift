//
//  AppExclusiveView.swift
//  NikeShoes
//
//  Created by 최소정 on 2023/09/06.
//

import SwiftUI

struct AppExclusiveView: View {
    
    var sampleAppExclusives: [String] = ["9월 4일", "9월 5일"]
    
    var body: some View {
        VStack(alignment: .leading){
            Group{
                Text("이 주의 앱 전용 제품 🔒")
                    .font(Font.medium20)
                Group{
                    Text("매주 공개되는 앱 전용")
                    Text("제품을 만나보세요.")
                }
                .foregroundColor(.textGray)
                .font(Font.medium20)
            }
            .padding(1)
            .padding(.leading)
    
            //가로 카테고리
            ScrollView(.horizontal) {
                LazyHStack {

                    ForEach(sampleAppExclusives, id: \.self) { item in
                        
                        NavigationLink(destination: ProductDetailView()) { // ItemListView로 이동
                            
                            VStack(alignment: .leading){
                                
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

                                    .padding([.top,.leading],10)

                            }
                        }
                    }
                    NavigationLink(destination: ItemListView()) {
                        VStack(alignment: .leading) {
                            AsyncImage(url: URL(string: "data:image/jpeg;base64,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")) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .clipped()
                            
                            HStack{
                                Text("앱 전용제품 전체 보기")
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

struct AppExclusiveView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            AppExclusiveView()
                .frame(height: 350)
        }
    }
}
