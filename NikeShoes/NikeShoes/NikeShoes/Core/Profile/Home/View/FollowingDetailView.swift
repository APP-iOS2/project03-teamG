//
//  FollowingDetailView.swift
//  NikeShoes
//
//  Created by 김성준 on 2023/09/06.
//

import SwiftUI
import NikeShoesCore

struct FollowingDetailView: View {
    @EnvironmentObject var followingViewModle: FollowingViewModel
    
    var body: some View {
        VStack {
            List {
                ForEach(0..<3) { index in
                    FollowingEditCellView(
                        isChecked: followingViewModle.followingData[index].isChecked,
                        id: followingViewModle.followingData[index].id,
                        imageURL: followingViewModle.followingData[index].imageURL,
                        title: followingViewModle.followingData[index].title)
                    .padding(.horizontal, 0)
                }
            }
            .listStyle(.plain)
        }
        .navigationBarTitleDisplayMode(.inline)
        .modifier(NavigationNikeSetting(title: "팔로잉"))
    }
}

struct FollowingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            FollowingDetailView()
                .environmentObject(FollowingViewModel())
        }
    }
}
