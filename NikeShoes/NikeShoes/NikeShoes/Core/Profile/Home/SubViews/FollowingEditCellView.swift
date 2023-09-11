//
//  FollowingEditCellView.swift
//  NikeShoes
//
//  Created by 김성준 on 2023/09/06.
//

import SwiftUI
import NikeShoesCore
struct FollowingEditCellView: View {
    @State var isChecked: Bool = true
    @EnvironmentObject var followingViewModle: FollowingViewModel
    
    let id: UUID
    let imageURL: String
    let title: String
    
    var image: URL {
        URL(string: imageURL) ?? URL(string: "")!
    }
    
    var body: some View {
        HStack {
            ProfileAsyncImageView(imageUrl: image)
                .frame(width: 100, height: 100)
            Text(title)
            Spacer()
            Button {
                isChecked.toggle()
                followingViewModle.modifyFollowing(with: id)
            } label: {
                isChecked ? Image(systemName: "checkmark.circle").foregroundColor(.green) : Image(systemName: "plus.circle").foregroundColor(.primary)
            }
            .font(.system(size: 30, weight: .light))
        }
    }
}

struct FollowingEditCellView_Previews: PreviewProvider {
    static var previews: some View {
        FollowingEditCellView(id: Following.sample[0].id,
                              imageURL: Following.sample[0].imageURL
                              , title: Following.sample[0].title)
        .environmentObject(FollowingViewModel())
    }
}
