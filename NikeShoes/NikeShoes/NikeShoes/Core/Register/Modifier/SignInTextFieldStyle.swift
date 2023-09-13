//
//  SignInTextFieldStyle.swift
//  NikeShoes
//
//  Created by yunjikim on 2023/09/05.
//

import SwiftUI

extension View {
    func signInTextFieldStyle(isTextFieldValid: Binding<Bool>) -> some View {
        return modifier(
            SignInTextFieldStyle(isTextFieldValid: isTextFieldValid)
        )
    }
}

struct SignInTextFieldStyle: ViewModifier {
    @Binding var isTextFieldValid: Bool
    
    func body(content: Content) -> some View {
        content
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .padding(.horizontal)
            .frame(height: 60)
            .background {
                RoundedRectangle(cornerRadius: 7)
                    .stroke(isTextFieldValid ? .gray : .red, lineWidth: 1)
            }
    }
}
