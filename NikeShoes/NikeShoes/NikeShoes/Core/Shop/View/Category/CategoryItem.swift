//
//  CategoryView.swift
//  NikeShoes
//
//  Created by 최소정 on 2023/09/06.
//

import SwiftUI

struct CategoryItem: View {
    var category: String
    var imageName: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 100)
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 100)
                .clipped()
            Text(category)
                .font(.system(size: 20))
                .bold()
                .foregroundColor(Color.white)
                .padding(.leading, 50)
        }
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(category: "신제품", imageName: "MaleCategory1")
    }
}
