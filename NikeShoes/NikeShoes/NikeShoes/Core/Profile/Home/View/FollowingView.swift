//
//  FollowingView.swift
//  NikeShoes
//
//  Created by 김성준 on 2023/09/06.
//

import SwiftUI
import NikeShoesCore
struct FollowingView: View {
    @EnvironmentObject var followingViewModle: FollowingViewModel
    @State private var action: Int? = 0
    let followingCount: Int
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack {
            HStack {
                Text("팔로잉(\(followingCount))")
                    .font(.medium12)
                    .bold()
                Spacer()
                NavigationLink(destination: FollowingDetailView()) {}
                    .opacity(0)
                    .background(
                        HStack {
                            Spacer()
                            Text("편집")
                                .font(.regular12)
                                .foregroundColor(.gray)
                        }
                    )
            }
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(followingViewModle.followingData, id: \.id) { item in
                        if item.isChecked == true {
                            ProfileAsyncImageView(imageUrl: item.image)
                                .frame(width: 150, height: 150)
                        }
                    }
                }
            }
        }
        .padding(.top, 11)
    }
}

struct FollowingView_Previews: PreviewProvider {
    static var previews: some View {
        FollowingView(followingCount: 3)
            .environmentObject(FollowingViewModel())
    }
}
