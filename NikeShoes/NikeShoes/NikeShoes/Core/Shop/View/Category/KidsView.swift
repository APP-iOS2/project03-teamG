//
//  KidsView.swift
//  NikeShoes
//
//  Created by 최소정 on 2023/09/06.
//

import SwiftUI
import NikeShoesCore

struct KidsView: View {
    let kidsCategories: [CategoryInfo] = [
        CategoryInfo(name: "신제품", imageName: "KidsCategory1", speciality: .newProduct, modelName: nil),
        CategoryInfo(name: "전체보기", imageName: "KidsCategory2", speciality: .allProducts, modelName: nil),
        CategoryInfo(name: "조던", imageName: "KidsCategory3", speciality: nil, modelName: .jordan),
        CategoryInfo(name: "에어 포스 1", imageName: "KidsCategory4", speciality: nil, modelName: .airForce),
        CategoryInfo(name: "덩크", imageName: "KidsCategory5", speciality: nil, modelName: .dunk),
        CategoryInfo(name: "코르테즈", imageName: "KidsCategory6", speciality: nil, modelName: .cortez)
    ]

    
    var body: some View {
         VStack(spacing: 3) {
             ForEach(kidsCategories, id: \.name) { categoryInfo in
                NavigationLink(
                    destination: ItemListViewWithProgressbar(
                        speciality: categoryInfo.speciality,
                        modelName: categoryInfo.modelName,
                        navigationTitle: categoryInfo.name,
                        currentGender: "키즈"
                    )
                ) {
                    CategoryItem(category: categoryInfo.name, imageName: categoryInfo.imageName)
                }
            }
        }
    }
}

struct KidsView_Previews: PreviewProvider {
    static var previews: some View {
        KidsView()
    }
}
