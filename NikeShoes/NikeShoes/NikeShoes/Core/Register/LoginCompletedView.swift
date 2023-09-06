//
//  LoginCompletedView.swift
//  Nike
//
//  Created by yunjikim on 2023/09/06.
//

import SwiftUI

struct LoginCompletedView: View {
    var body: some View {
        Text("로그인되었습니다.")
            .font(.semiBold24)
            .padding(.bottom, 35)
    }
}

struct LoginCompletedView_Previews: PreviewProvider {
    static var previews: some View {
        LoginCompletedView()
    }
}
