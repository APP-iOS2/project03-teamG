//
//  LoginModifier.swift
//  NikeShoesAdmin
//
//  Created by kaikim on 2023/09/11.
//

import SwiftUI
import NikeShoesCore
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
