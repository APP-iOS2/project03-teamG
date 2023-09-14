//
//  MainTabView.swift
//  NikeClone
//
//  Created by 이희찬 on 2023/09/04.
//

import SwiftUI
import NikeShoesCore

struct MainTabView: View {
    @State private var selectedIndex = 0
    @State var userPromCode = ""
    @EnvironmentObject var bagViewModel: BagViewModel 
    
    var body: some View {
        TabView(selection: $selectedIndex) {
//            Group {
                NavigationStack {
                    HomeView()
                }
                .onTapGesture {
                    self.selectedIndex = 0
                }
                .tabItem {
                    Label("홈", systemImage: "house")
                        .environment(\.symbolVariants, .none)
                }.tag(0)

                NavigationStack {
                    GenderTabBarView(tabs: ["남성", "여성", "키즈"])
                }
                .onTapGesture {
                    self.selectedIndex = 1
                }
                .tabItem {
                    Label("구매하기", systemImage: "magnifyingglass")
                }.tag(1)

                NavigationStack {
                    WishView()
                }
                .onTapGesture {
                    self.selectedIndex = 2
                }
                .tabItem {
                    Label("위시리스트", systemImage: "heart")
                        .environment(\.symbolVariants, .none)
                }.tag(2)

                NavigationStack {
                    BagView(userPromCode: $userPromCode)
                        .environmentObject(bagViewModel)
                }
                .onTapGesture {
                    self.selectedIndex = 3
                }
                .tabItem {
                    Label("장바구니", systemImage: "bag")
                        .environment(\.symbolVariants, .none)
                }.tag(3)

                ProfileView()
                // MARK: 프로필 버튼 버그로인한 임시 주석처리
                // .onTapGesture {
                //     self.selectedIndex = 4
                // }
                    .tabItem {
                        Label("프로필", systemImage: "person")
                            .environment(\.symbolVariants, .none)
                    }.tag(4)
                    .environmentObject(FollowingViewModel())
            }
            .toolbarBackground( .white, for: .tabBar)
        }
//    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
