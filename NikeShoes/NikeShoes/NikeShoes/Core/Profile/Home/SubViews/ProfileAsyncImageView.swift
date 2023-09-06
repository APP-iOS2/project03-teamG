//
//  RewardImageView.swift
//  NikeShoes
//
//  Created by 김성준 on 2023/09/05.
//

import SwiftUI

struct ProfileAsyncImageView: View {
    @State var imageUrl: URL
    var body: some View {
        AsyncImage(url: imageUrl) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
    }
}

struct RewardImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileAsyncImageView(imageUrl: URL(string: "https://static.nike.com/a/images/f_auto,cs_srgb/w_1536,c_limit/78d4df4d-f803-40c6-8b41-2cface972373/image.jpg") ?? URL(string: "")!)
    }
}
