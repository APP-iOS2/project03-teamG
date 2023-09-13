//
//  SignInToolbarStyle.swift
//  NikeShoes
//
//  Created by yunjikim on 2023/09/12.
//

import SwiftUI

extension View {
    func signInToolbarStyle(screen: Binding<LoginRegisterScreen>, isShowingSignInSheet: Binding<Bool>) -> some View {
        return modifier(
            SignInToolbarStyle(screen: screen, isShowingSignInSheet: isShowingSignInSheet)
        )
    }
}

struct SignInToolbarStyle: ViewModifier {
    @Binding var screen: LoginRegisterScreen
    @Binding var isShowingSignInSheet: Bool
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        screen = .loginRegister
                        isShowingSignInSheet = false
                    } label: {
                        Text("취소")
                    }

                }
            }
    }
}
