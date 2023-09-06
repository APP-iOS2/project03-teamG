//
//  FindShopView.swift
//  NikeShoes
//
//  Created by 김성훈 on 2023/09/05.
//

import SwiftUI

struct FindShopView: View {
    var title: String
    
    var body: some View {
        VStack {
            
        }
        .modifier(NavigationNikeSetting(title: "나이키 매장 찾기"))
    }
}

struct FindShopView_Previews: PreviewProvider {
    static var previews: some View {
        FindShopView(title: "나이키 매장 ㅊ")
    }
}
