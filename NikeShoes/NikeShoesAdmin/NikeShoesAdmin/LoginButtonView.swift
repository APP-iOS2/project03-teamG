//
//  LoginButtonView.swift
//  NikeShoesAdmin
//
//  Created by kaikim on 2023/09/11.
//

import SwiftUI

struct ButtonView: View {
    let buttonText: String
    let foreground: Color
    let background: Color
    let action: (() -> Void)?
    
    var body: some View {
        Button(action: {
            withAnimation {
               action?()
            }
        }, label: {
            Text("\(buttonText)")
                .bold()
                .frame(width: 351, height: 63)
        })
        .background {
            if background == .white {
                RoundedRectangle(cornerRadius: 31.5)
                    .stroke(.gray, lineWidth: 1)
            } else {
                RoundedRectangle(cornerRadius: 31.5)
                    .fill(background)
            }
        }
        .foregroundColor(foreground)
    }
}
