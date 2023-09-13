//
//  MaleView.swift
//  NikeShoes
//
//  Created by 최소정 on 2023/09/06.
//

import SwiftUI
import NikeShoesCore

struct CategoryInfo {
    let name: String
    let imageName: String
    let speciality: Speciality?
    let modelName: ModelName?
}

struct MaleView: View {
    let categories: [CategoryInfo] = [
        CategoryInfo(name: "신제품", imageName: "MaleCategory1", speciality: .newProduct, modelName: nil),
        CategoryInfo(name: "전체보기", imageName: "MaleCategory2", speciality: .allProducts, modelName: nil),
        CategoryInfo(name: "조던", imageName: "MaleCategory3", speciality: nil, modelName: .jordan),
        CategoryInfo(name: "에어 포스 1", imageName: "MaleCategory4", speciality: nil, modelName: .airForce),
        CategoryInfo(name: "덩크", imageName: "MaleCategory5", speciality: nil, modelName: .dunk),
        CategoryInfo(name: "코르테즈", imageName: "MaleCategory6", speciality: nil, modelName: .cortez)
    ]
    
    var body: some View {
        VStack(spacing: 3) {
            ForEach(categories, id: \.name) { categoryInfo in
                NavigationLink(
                    destination: ItemListViewWithProgressbar(
                        speciality: categoryInfo.speciality,
                        modelName: categoryInfo.modelName,
                        navigationTitle: categoryInfo.name,
                        currentGender: "남성"
                    )
                ) {
                    CategoryItem(category: categoryInfo.name, imageName: categoryInfo.imageName)
                }
            }
        }
    }
}

struct MaleView_Previews: PreviewProvider {
    static var previews: some View {
        MaleView()
    }
}
