//
//  ShopView.swift
//  NikeClone
//
//  Created by 이희찬 on 2023/09/04.
//

import SwiftUI

struct ShopView: View {
    var body: some View {

        ScrollView {
            AppBestCollectionView()
            
            //카테고리부분
                LazyVStack {
                    
                    LazyVStack {
                        ForEach(0 ... 3, id: \.self) { _ in
                            VStack{
                                ZStack{
                                    Rectangle()
                                        .frame(width: .infinity, height: 120)
                                    Text("카테고리")
                                        .foregroundColor(Color.white)
                                }
                            }
                        }
                    }
                }
            

            AppExclusiveView()
            
            BestItemView()
            
            RecentItemView()
            
            InterestItemView()

            
            RecommendStoreView()
            }
        }
    }


struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
