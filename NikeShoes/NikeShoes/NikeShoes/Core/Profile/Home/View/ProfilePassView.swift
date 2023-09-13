//
//  ProfileEventView.swift
//  NikeShoes
//
//  Created by 김성준 on 2023/09/13.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift
import NikeShoesCore

struct ProfilePassView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var name: String = "유저정보 없음"
    private let imageURL: String = "https://www.bigrigmedia.com/app/uploads/2019/07/qr-code-1024x1024.png"
    
    var image: URL {
        URL(string: imageURL) ?? URL(string: "")!
    }
    
    var body: some View {
        Form {
            Text(name)
                .font(.bold16)
            ProfileAsyncImageView(imageUrl: image)
            Text("간편하게 체크인하고 모든 나이키 매장과 이벤트를 통해 맞춤형 서비스를 받아 보세요.")
                .font(.medium11)
        }
        .onAppear {
            name = Auth.auth().currentUser?.displayName ?? "유저정보 없음"
        }
        .navigationBarTitleDisplayMode(.inline)
        .modifier(NavigationNikeSetting(title: "패스"))
            
    }
}

struct ProfileEventView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProfilePassView()
        }
    }
}
