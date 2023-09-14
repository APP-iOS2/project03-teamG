//
//  ShopView.swift
//  NikeClone
//
//  Created by 이희찬 on 2023/09/04.
//

import SwiftUI

struct ShopView<Content: View>: View {
    var categoryView: Content
    var currentGender: String  // 추가된 부분

    init(categoryView: Content, currentGender: String) {
        self.categoryView = categoryView
        self.currentGender = currentGender
    }
    
    var body: some View {
        ScrollView {
            AppBestCollectionView(currentGender: currentGender)  // 수정된 부분
            
            // 카테고리 부분
            categoryView

            AppExclusiveView(currentGender: currentGender)
            BestItemView(currentGender: currentGender)
            RecentItemView()
            // 관심사 부분 보류
//            InterestItemView()
            RecommendStoreView()
        }
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView(categoryView: MaleView(), currentGender: "남성")  // 수정된 부분
    }
}
