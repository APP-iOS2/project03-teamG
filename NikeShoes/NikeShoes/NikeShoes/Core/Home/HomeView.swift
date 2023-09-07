//
//  HomeView.swift
//  NikeClone
//
//  Created by 이희찬 on 2023/09/04.
//

import SwiftUI

struct HomeView: View {
    
    var userName: String = "최소정"
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    // 시간대별로 다르게 보이는거 구현해 주기
                    
                    Text("\(userName)님, 즐거운 저녁 보내고 계신가요? ")
                        .font(.mediumBold24)
                }
                .padding([.leading,.trailing], 10)
                
                CustomizedRecommendView()
                
                NikeNewsView()
            }
            .toolbar { SearchView() }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
