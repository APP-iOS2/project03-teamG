//
//  TempButton.swift
//  NikeShoes
//
//  Created by 박형환 on 2023/09/05.
//

import SwiftUI


struct TempButton: View {
    
    var foreground: Color = .black
    var background: Color = .white
    let action: (() -> Void)?
    
    var body: some View {
        Button(action: {
            withAnimation {
               action?()
            }
        }, label: {
            Text("Get Started")
                .bold()
        })
        .padding(.horizontal , 30)
        .padding(.vertical , 20)
        .background(background)
        .foregroundColor(foreground)
        .cornerRadius(30)
    }
}


struct TempButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            
            Color.black
            TempButton {
                
            }
        }
    }
}
