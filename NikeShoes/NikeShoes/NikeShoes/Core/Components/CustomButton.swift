//
//  CustomButton.swift
//  NikeShoes
//
//  Created by 이희찬 on 2023/09/05.
//

import SwiftUI

struct CustomButton: View {
    var background: Color
    var foregroundColor: Color
    var title: String
    var action: () -> Void
    var frame: (width: CGFloat, height: CGFloat) = (width: 351, height: 63)
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 18))
                .frame(maxWidth: .infinity)
                .padding()
        }
        .frame(width: 351, height: 63)
        .background(background)
        .foregroundColor(foregroundColor)
        .cornerRadius(31.5)
    }
    
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(background: .black, foregroundColor: .white, title: "save", action: {})
    }
}
