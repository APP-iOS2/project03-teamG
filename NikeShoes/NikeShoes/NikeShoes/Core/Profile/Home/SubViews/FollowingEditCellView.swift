//
//  FollowingEditCellView.swift
//  NikeShoes
//
//  Created by 김성준 on 2023/09/06.
//

import SwiftUI

struct FollowingEditCellView: View {
    let imageURL: String
    let title: String
    @State var isChecked: Bool = true
    
    var image: URL{
        URL(string: imageURL) ?? URL(string: "")!
    }
    
    var body: some View {
        HStack{
            ProfileAsyncImageView(imageUrl: image)
                .frame(width: 100, height: 100)
            Text(title)
            Spacer()
            Button {
                isChecked.toggle()
            } label: {
                isChecked ? Image(systemName: "checkmark.circle").foregroundColor(.green) : Image(systemName: "plus.circle").foregroundColor(.primary)
            }
            .font(.system(size: 30, weight: .light))
        }
    }
}

struct FollowingEditCellView_Previews: PreviewProvider {
    static var previews: some View {
        FollowingEditCellView(imageURL:  "https://static.nike.com/a/images/f_auto,cs_srgb/w_1536,c_limit/78d4df4d-f803-40c6-8b41-2cface972373/image.jpg", title: "여성")
    }
}
