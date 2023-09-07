//
//  AppBestCollectionView.swift
//  NikeShoes
//
//  Created by 여성은 on 2023/09/05.
//

import SwiftUI

struct AppBestCollectionView: View {

    var sampleCollections: [String] = ["앱 전용 제품", "신제품", "이번 주 베스트", "러닝화 가이드", "전체 제품 보기"]

    var body: some View {
        VStack(alignment: .leading) {
            
            Text("나이키 앱 베스트 컬렉션")
                .font(Font.medium20)
                .padding(.leading, 20)
            
            // 가로 카테고리
            ScrollView(.horizontal) {
                LazyHStack {

                    ForEach(sampleCollections, id: \.self) { collection in

                        NavigationLink(destination: ItemListView()) { // ItemListView로 이동

                            VStack(alignment: .leading) {
                                AsyncImage(url: URL(string: "https://static.nike.com/a/images/w_1920,c_limit/wzrqsjqpg6pslrevtkpl/image.png")) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 150, height: 150)
                                .cornerRadius(15)

                                Text("\(collection)")
                                    .foregroundColor(.black)
                                    .font(Font.semiBold12)
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

struct AppBestCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView { // 별도의 NavigationView로 미리보기 설정
            AppBestCollectionView()
                .frame(height: 280)
        }
    }
}
