//
//  TempButton.swift
//  NikeShoes
//
//  Created by 박형환 on 2023/09/05.
//

import SwiftUI

struct ButtonStyle: View {
    @State var buttonText: String
    var action: () -> Void
    
    var body: some View {
        VStack {
            Button(action: action) {
                Text(buttonText)
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.black)
            }
            .frame(width: 351, height: 63)
            .background(Color.white)
            .foregroundColor(Color.white)
            .cornerRadius(31.5)
            .overlay(RoundedRectangle(cornerRadius: 31.5)
                .stroke(Color.gray, lineWidth: 0.5))
            
            Spacer()
        }
//        VStack {
//            ZStack {
//                RoundedRectangle(cornerRadius: 31.5)
//                    .foregroundColor(Color.white)
//                    .frame(width: 351, height: 63)
//                    .overlay(RoundedRectangle(cornerRadius: 31.5)
//                        .stroke(Color.gray, lineWidth: 0.5))
//                Text(buttonText)
//                    .font(.system(size: 18, weight: .medium))
//                    .foregroundColor(.black)
//            }
//            Spacer()
//        }
    }
        
}

struct ButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyle(buttonText: "View in Bag", action: {})
    }
}
