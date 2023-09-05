//
//  SettingLocationView.swift
//  NikeShoes
//
//  Created by 김성훈 on 2023/09/05.
//

import SwiftUI

struct SettingLocationView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var title: String
    
    var body: some View {
        VStack {
            Text("여긴 뷰가아닌 앱 세팅 설정으로 넘어가는 곳")
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                }
                .foregroundColor(.black)
            }
        }
        .navigationBarTitle(title, displayMode: .inline)
        .navigationBarBackButtonHidden()
    }
}

struct SettingLocationView_Previews: PreviewProvider {
    static var previews: some View {
        SettingLocationView(title: "위치 설정")
    }
}
