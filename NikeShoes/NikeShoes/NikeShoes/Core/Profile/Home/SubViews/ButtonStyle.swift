//
//  TempButton.swift
//  NikeShoes
//
//  Created by 박형환 on 2023/09/05.
//

import SwiftUI


struct ButtonStyle: View {
    
    @State var buttonText: String = "View in Bag"
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 31.5)
                    .foregroundColor(Color.white)
                    .frame(width: 351, height: 63)
                    .overlay(RoundedRectangle(cornerRadius: 31.5)
                        .stroke(Color.gray, lineWidth: 0.5))
                Text(buttonText)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.black)
            }
            Spacer()
        }
    }
        
}


struct ButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyle()
    }
}
