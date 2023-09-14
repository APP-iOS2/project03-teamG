//
//  CustomizedRecommendView.swift
//  NikeShoes
//
//  Created by 여성은 on 2023/09/07.
//

import SwiftUI
import NikeShoesCore

struct CustomizedRecommendView: View {
    
    @StateObject var customRecommendedViewModel: CustomizedRecommendViewModel = CustomizedRecommendViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
    
            HStack(alignment: .bottom) {
                Text("맞춤 추천 제품")
                    .font(Font.medium20)
                Spacer()
                NavigationLink {
                    ItemListView()
                } label: {
                    Text("모두 보기")
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
                    ForEach(customRecommendedViewModel.shoes) { item in
                        NavigationLink(destination: ProductDetailView(shoesData: item)) { // ItemListView로 이동
                            
                            VStack(alignment: .leading) {
                                // 상품 이미지
                                AsyncImage(url: URL(string: "\(item.imageURLString[0])")) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .clipped()
                                        .frame(height: 180)
                                } placeholder: {
                                    Image("progress")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .clipped()
                                        .frame(height: 180)
                                }
                                
                                // 상품 정보
                                Group {
                                    Text("\(item.name)".prefix(13))
                                        .lineLimit(1) // 한 줄로 제한
                                        .truncationMode(.tail)
//                                        .padding([.top, .leading], 13)
                                        .foregroundColor(Color.black)
                                        .bold()
                                    Text("\(item.category)")
                                        .foregroundColor(Color.textGray)
                                    Text("₩\(item.price)")
                                        .foregroundColor(Color.black)
                                }
                                .padding(0.3)
                            }
                        }
                    }
                    
                }
                .padding()
            }
        }
        .padding([.top, .bottom], 30)
    }
    
}

struct CustomizedRecommendView_Previews: PreviewProvider {
    static var previews: some View {
        CustomizedRecommendView()
            .frame(height: 400)
    }
}
