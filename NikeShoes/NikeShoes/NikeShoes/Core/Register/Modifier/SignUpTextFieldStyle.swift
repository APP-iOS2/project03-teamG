//
//  SignUpTextFieldStyle.swift
//  NikeShoes
//
//  Created by yunjikim on 2023/09/05.
//

import SwiftUI

struct SignUpTextFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal)
            .frame(height: 60)
            .background {
                RoundedRectangle(cornerRadius: 7)
                    .stroke(.gray, lineWidth: 1)
            }
    }
}
