//
//  OrderWishlistView.swift
//  NikeShoes
//
//  Created by 전민돌 on 9/10/23.
//

import SwiftUI

struct BuyWishlistButtonView: View {
    @State private var wishlistToggle = false
    
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
                wishlistToggle.toggle()
                if wishlistToggle == true {
                    print("위시리스트에 추가")
                } else {
                    print("위시리스트에서 제거")
                }
            } label: {
                if wishlistToggle == false {
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
                } else {
                    ZStack {
                        RoundedRectangle(cornerRadius: 31.5)
                            .stroke(Color.defaultGray, lineWidth: 1)
                            .frame(width: 170, height: 63)
                            .background(.white)
                        
                        Text("\(Image(systemName: "heart.fill"))")
                            .foregroundColor(.black)
                            .font(.system(size: 18))
                            .fontWeight(.medium)
                    }
                }
            }
        }
    }
}

struct BuyWishlistView_Previews: PreviewProvider {
    static var previews: some View {
        BuyWishlistButtonView()
    }
}
