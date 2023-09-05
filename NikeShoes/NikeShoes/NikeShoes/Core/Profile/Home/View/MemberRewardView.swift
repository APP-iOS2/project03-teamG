//
//  MemberRewardView.swift
//  NikeShoes
//
//  Created by 김성준 on 2023/09/05.
//

import SwiftUI

struct MemberRewardView: View {
    var imageUrl: URL = URL(string: "https://static.nike.com/a/images/f_auto,cs_srgb/w_1536,c_limit/78d4df4d-f803-40c6-8b41-2cface972373/image.jpg") ?? URL(string: "")!
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.gray)
                .edgesIgnoringSafeArea(.all)
            
            NavigationLink {
              MemberRewardDetailView()
            } label: {
                //MARK: 이미지
                ZStack{
                    AsyncImage(url: imageUrl) { image in
                        image
                            .resizable()
                            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                            .scaledToFit()
                            .padding(.top)
                            .padding(.horizontal)
                    } placeholder: {
                        ProgressView()
                    }
                    HStack{
                        Text("멤버 혜택")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .bold()
                            .padding(.leading, 150)
                            .position(y: UIScreen.main.bounds.height - 350)
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("멤버 리워드")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MemberRewardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            MemberRewardView()
        }
    }
}
