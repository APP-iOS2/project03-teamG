//
//  ShopView.swift
//  NikeClone
//
//  Created by 이희찬 on 2023/09/04.
//

import SwiftUI

struct ShopView<Content: View>: View {
    var categoryView: Content
    
    var body: some View {
        ScrollView {
            AppBestCollectionView()
            
            // 카테고리 부분
            categoryView

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
        ShopView(categoryView: MaleView())
    }
}
