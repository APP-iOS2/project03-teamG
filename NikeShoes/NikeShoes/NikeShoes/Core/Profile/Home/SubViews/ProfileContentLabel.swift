//
//  ProfileContentLabel.swift
//  NikeShoes
//
//  Created by 김성준 on 2023/09/05.
//

import SwiftUI

struct ProfileContentLabel: View {
    var title: String
    var subTitle: String
    var body: some View {
            NavigationLink {
                InboxView()
            } label: {
                VStack(alignment: .leading){
                    Text("수신함")
                        .bold()
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                    Text("1개 사용 가능")
                        .font(.system(size: 12))
                }
            }
            .padding(.vertical, 20)
    }
}

struct ProfileContentLabel_Previews: PreviewProvider {
    static var previews: some View {
        ProfileContentLabel(title: "멤버 리워드", subTitle: "1개 사용 가능")
    }
}
