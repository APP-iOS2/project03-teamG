//
//  MainTabView.swift
//  NikeClone
//
//  Created by 이희찬 on 2023/09/04.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    @State var userPromCode = ""
    var shoes: Shoes = Shoes(name: "", category: .female, modelName: .airForce, price: 0, size: [250], description: "", imageURLString: "", like: false)
    
    var body: some View {

        NavigationStack {
            TabView(selection: $selectedIndex) {
                HomeView()
                    .onTapGesture {
                        self.selectedIndex = 0
                    }
                    .tabItem {
                        Image(systemName: "house")
                    }.tag(0)
                
                GenderTabBarView(tabs: ["남성", "여성", "키즈"])
                    .onTapGesture {
                        self.selectedIndex = 1
                    }
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }.tag(1)
                
                WishView()
                    .onTapGesture {
                        self.selectedIndex = 2
                    }
                    .tabItem {
                        Image(systemName: "heart")
                    }.tag(2)
                
                BagView(userPromCode: $userPromCode, shoes: Shoes(name: shoes.name, category: Category(rawValue: shoes.category.rawValue) ?? .female, modelName: self.shoes.modelName, price: shoes.price, size: shoes.size, description: shoes.description, imageURLString: shoes.imageURLString, like: false))
                    .onTapGesture {
                        self.selectedIndex = 3
                    }
                    .tabItem {
                        Image(systemName: "bag")
                    }.tag(3)
                
                ProfileView()
                    .onTapGesture {
                        self.selectedIndex = 4
                    }
                    .tabItem {
                        Image(systemName: "person")
                    }.tag(4)
            }

        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(shoes: Shoes(name: "나이키 에어 포스 1 '07 이지온", category: .female, modelName: .airForce, price: 139000, size: ShoesSampleData[1].size, description: ShoesSampleData[1].description, imageURLString: ShoesSampleData[1].imageURLString, like: false))
    }
}
