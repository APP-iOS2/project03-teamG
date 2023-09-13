//
//  FemaleView.swift
//  NikeShoes
//
//  Created by 최소정 on 2023/09/06.
//

import SwiftUI

struct FemaleView: View {
    let categories = [
        ("신제품", "FemaleCategory1"),
        ("전체보기", "FemaleCategory2"),
        ("조던", "FemaleCategory3"),
        ("에어", "FemaleCategory4"),
        ("덩크", "FemaleCategory5"),
        ("코르테즈", "FemaleCategory6")
    ]
    
    var body: some View {
        VStack(spacing: 3) {  // 간격을 3으로 설정
            ForEach(categories, id: \.0) { category, imageName in
                NavigationLink(destination: ItemListView()) {
                    ZStack(alignment: .leading) {  // 왼쪽 정렬
                        Rectangle()
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 100)
                        
                        Image(imageName)
                            .resizable()
//                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 100)
                            .clipped()
                        
                        Text(category)
                            .font(.system(size: 20))
                            .bold()  // 볼드 처리
                            .foregroundColor(Color.white)
                            .padding(.leading, 50)  // 왼쪽으로부터 50만큼 떨어지게 배치
                    }
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
