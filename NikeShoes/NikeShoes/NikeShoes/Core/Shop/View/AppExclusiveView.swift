//
//  AppExclusiveView.swift
//  NikeShoes
//
//  Created by 최소정 on 2023/09/06.
//

import SwiftUI
import NikeShoesCore

struct AppExclusiveView: View {
    
    var sampleAppExclusives: [String] = ["9월 4일", "9월 5일"]
    
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("이 주의 앱 전용 제품 🔒")
                    .font(Font.medium20)
                Group {
                    Text("매주 공개되는 앱 전용")
                    Text("제품을 만나보세요.")
                }
                .foregroundColor(.textGray)
                .font(Font.medium20)
            }
            .padding(1)
            .padding(.leading)
    
            // 가로 카테고리
            ScrollView(.horizontal) {
                LazyHStack {

                    ForEach(sampleAppExclusives, id: \.self) { item in
                        
                        NavigationLink(destination: ProductDetailView(shoesData: detailSample)) { // ItemListView로 이동
                            
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
                    NavigationLink(destination: ItemListView()) {
                        VStack(alignment: .leading) {
                            AsyncImage(url: URL(string: "https://image-cdn.hypb.st/https%3A%2F%2Fhypebeast.com%2Fimage%2F2022%2F09%2Fnike-snkrs-air-force-1-low-korea-5th-anniversary-exclusive-access-dx3141-861-release-date-0.jpg?fit=max&cbr=1&q=90&w=750&h=500")) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .clipped()
                            
                            HStack {
                                Text("앱 전용제품 전체 보기")
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

struct AppExclusiveView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AppExclusiveView()
                .frame(height: 350)
        }
    }
}
