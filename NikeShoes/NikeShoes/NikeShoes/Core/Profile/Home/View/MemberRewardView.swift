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
            ZStack {
                Rectangle()
                    .foregroundColor(.gray)
                    .edgesIgnoringSafeArea(.top)
                    .edgesIgnoringSafeArea(.horizontal)
                    .blur(radius: 1)
                    
                NavigationLink {
                    MemberRewardDetailView()
                } label: {
                    VStack {
                        GeometryReader { proxy in
                            ProfileAsyncImageView(imageUrl: imageUrl)
                                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                                .padding(.top)
                                .padding(.horizontal)
                                .shadow(radius: 0.25, x: -5)
                                .shadow(radius: 0.25, y: 10)
                                .coordinateSpace(name: "rewardImage")
                            HStack {
                                Text("멤버 혜택")
                                    .font(.system(size: 60))
                                    .coordinateSpace(name: "memberTitle")
                                VStack {
                                    Text("만료일자")
                                    Text("2024.1.2")
                                }
                                .foregroundColor(.lightGray)
                            }
                            .position(x: proxy.frame(in: .named("RewardImage")).minX + proxy.frame(in: .named("memberTitle")).width / 2,
                                      y: proxy.frame(in: .named("RewardImage")).height - 100)
                        }
                        .frame(height: 500)
                        Text("01 / 01")
                            .font(.medium20)
                        Spacer()
                    }
                }
            }
            .preferredColorScheme(.light)
            .modifier(NavigationNikeSetting(title: "팔로잉"))
            .foregroundColor(.white)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct MemberRewardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MemberRewardView()
        }
    }
}
