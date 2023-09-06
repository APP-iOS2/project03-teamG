//
//  RecommendStoreView.swift
//  NikeShoes
//
//  Created by 최소정 on 2023/09/06.
//

import SwiftUI

struct RecommendStoreView: View {
    
    @ObservedObject var storeModel = StoreModel()
    
    var sampleStore: [String] = ["여기매장", "저기매장", "저어어기 매장", "저어어어기 매장"]
    
    var body: some View {
        VStack(alignment: .leading){
            
            HStack(alignment: .bottom) {
                Text("근처 매장")
                    .font(Font.medium20)
                Spacer()
                NavigationLink {
                    //마이페이지에 팔로잉 수정으로 이동
                    StoreView()
                } label: {
                    Text("매장 찾기")
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .foregroundColor(.textGray)
                }
                
            }
            .padding(1)
            .padding([.leading,.trailing])
            
            //가로 카테고리
            ScrollView(.horizontal) {
                LazyHStack {
                    
                    
                    ForEach(storeModel.stores) { store in
                        
                        NavigationLink(destination: StoreDetailView(store: store)) {
                            VStack(alignment: .leading){
                                
                                AsyncImage(url: store.imageURL) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 255, height: 255)
                                .clipped()
                                
                                Text("\(store.name)")
                                    .foregroundColor(.black)
                                    .font(Font.semiBold12)
                                    .padding([.top,.leading],10)
                                
                                
                                
                            }
                        }
                    }
                    
                }
                .padding()
            }
            
        }
        .padding([.top,.bottom],20)
    }
}

struct RecommendStoreView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendStoreView()
    }
}
