//
//  FemaleView.swift
//  NikeShoes
//
//  Created by 최소정 on 2023/09/06.
//

import SwiftUI
import NikeShoesCore

struct FemaleView: View {
    let categories: [CategoryInfo] = [
        CategoryInfo(name: "신제품", imageName: "FemaleCategory1", speciality: .newProduct, modelName: nil, customTabs: ["전체"]),
        CategoryInfo(name: "전체보기", imageName: "FemaleCategory2", speciality: .allProducts, modelName: nil, customTabs: ["전체"]),
        CategoryInfo(name: "조던", imageName: "FemaleCategory3", speciality: nil, modelName: .jordan, customTabs: ["조던"]),
        CategoryInfo(name: "에어 포스 1", imageName: "FemaleCategory4", speciality: nil, modelName: .airForce, customTabs: ["에어 포스 1"]),
        CategoryInfo(name: "덩크", imageName: "FemaleCategory5", speciality: nil, modelName: .dunk, customTabs: ["덩크"]),
        CategoryInfo(name: "코르테즈", imageName: "FemaleCategory6", speciality: nil, modelName: .cortez, customTabs: ["코르테즈"])
    ]
    
    var body: some View {
        VStack(spacing: 3) {
            ForEach(categories, id: \.name) { categoryInfo in
                NavigationLink(
                    destination: ItemListViewWithProgressbar(
                        speciality: categoryInfo.speciality,
                        modelName: categoryInfo.modelName,
                        navigationTitle: categoryInfo.name,
                        currentGender: "여성",
                        customTabs: categoryInfo.customTabs
                    )
                ) {
                    CategoryItem(category: categoryInfo.name, imageName: categoryInfo.imageName)
                }
            }
        }
    }
}

struct FemaleView_Previews: PreviewProvider {
    static var previews: some View {
        FemaleView()
    }
}
