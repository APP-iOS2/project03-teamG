//
//  LoginCompletedView.swift
//  Nike
//
//  Created by yunjikim on 2023/09/06.
//

import SwiftUI

struct LoginCompletedView: View {
    @Binding var index: Int
    @Binding var isShowingSignInSheet: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("로그인되었습니다.")
                .font(.semiBold24)
                .padding(.bottom, 35)
            
            ButtonView(buttonText: "계속", foreground: .white, background: .black) {
                isShowingSignInSheet = false
            }
        }
    }
}

struct LoginCompletedView_Previews: PreviewProvider {
    static var previews: some View {
        LoginCompletedView(index: .constant(4), isShowingSignInSheet: .constant(false))
    }
}
