//
//  RecentItemView.swift
//  NikeShoes
//
//  Created by 최소정 on 2023/09/06.
//

import SwiftUI
import NikeShoesCore

struct RecentItemView: View {
    
    @EnvironmentObject var itemListViewModel: ItemListViewModel
    
    private var shoesDataArray: [ShoesDTO] {
        itemListViewModel.shoes.filter { shoes in
            shoes.speciality.contains(.allProducts)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if !shoesDataArray.isEmpty {
                
                HStack(alignment: .bottom) {
                    Text("최근 본 제품")
                        .font(Font.medium20)
                    
                    // TODO: 삭제 구현하기
//                    Spacer()
//                    Button {
//                        // sampleRecentItems 삭제
//                        shoesDataArray.removeAll()
//                    } label: {
//                        Text("삭제")
//                            .font(.system(size: 16))
//                            .fontWeight(.regular)
//                            .foregroundColor(.textGray)
//                    }
                    
                }
                .padding(1)
                .padding([.leading, .trailing])
                
                // 가로 카테고리
                ScrollView(.horizontal) {
                    LazyHStack {
                        
                        // 최근 본 제품 개수 제한 
                        if shoesDataArray.count < 6 {
                            ForEach(shoesDataArray) { item in
                                
                                NavigationLink(destination: ProductDetailView(shoesData: item)) { // ItemListView로 이동
                                    
                                    VStack(alignment: .leading) {
                                        
                                        AsyncImage(url: URL(string: item.imageURLString[0])) { image in
                                            image.resizable()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 150, height: 150)
                                        .clipped()
                                        
                                        Text("\(item.modelName)")
                                            .foregroundColor(.black)
                                            .font(Font.semiBold12)
                                            .padding([.top, .leading], 10)
                                        
                                    }
                                }
                            }
                        } else {
                            ForEach(shoesDataArray[0...4]) { item in
                                
                                NavigationLink(destination: ProductDetailView(shoesData: item)) { // ItemListView로 이동
                                    
                                    VStack(alignment: .leading) {
                                        
                                        AsyncImage(url: URL(string: item.imageURLString[0])) { image in
                                            image.resizable()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 150, height: 150)
                                        .clipped()
                                        
                                        Text("\(item.name)")
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
