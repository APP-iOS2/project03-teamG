//
//  OrderWishlistView.swift
//  NikeShoes
//
//  Created by 전민돌 on 9/10/23.
//

import SwiftUI

struct BuyWishlistView: View {
    var body: some View {
        HStack {
            Button {
                print("구매하기")
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 31.5)
                        .stroke(Color.defaultGray, lineWidth: 1)
                        .frame(width: 170, height: 63)
                        .background(.white)
                    
                    Text("구매하기")
                        .foregroundColor(.black)
                        .font(.system(size: 18))
                        .fontWeight(.medium)
                }
            }
            
            .padding(.horizontal, 2)
            
            Button {
                print("위시리스트")
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 31.5)
                        .stroke(Color.defaultGray, lineWidth: 1)
                        .frame(width: 170, height: 63)
                        .background(.white)
                    
                    Text("\(Image(systemName: "heart"))")
                        .foregroundColor(.black)
                        .font(.system(size: 18))
                        .fontWeight(.medium)
                }
            }
        }
    }
}

struct BuyWishlistView_Previews: PreviewProvider {
    static var previews: some View {
        BuyWishlistView()
    }
}
