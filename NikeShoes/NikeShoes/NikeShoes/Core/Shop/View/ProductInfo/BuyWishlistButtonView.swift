//
//  OrderWishlistView.swift
//  NikeShoes
//
//  Created by 전민돌 on 9/10/23.
//

import SwiftUI
import NikeShoesCore

struct BuyWishlistButtonView: View {
    @State private var wishlistToggle = false
    
    let data: ShoesDTO
    
    @EnvironmentObject var wishListViewModel: WishListViewModel
    
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
                Task {
                    do {
                        wishlistToggle
                        ?
                        try await wishListViewModel.likeUpdate(shoes: data.toLike())
                        :
                        try await wishListViewModel.unLikeShoes(shoes: data.toLike())
                    } catch {
                        Log.debug("BuyWishlistButtonView Error ❌")
                        wishlistToggle.toggle()
                    }
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
        }.onAppear {
            if let id = data.id,
               let _ = wishListViewModel.shoesIds[id] {
                wishlistToggle = true
            }
        }
    }
}

struct BuyWishlistView_Previews: PreviewProvider {
    static var previews: some View {
        BuyWishlistButtonView(data: .init(name: "",
                                          category: "",
                                          modelName: "'",
                                          description: "",
                                          price: 0,
                                          size: [],
                                          colors: [],
                                          imageURLString: [],
                                          speciality: [],
                                          stylingImage: []))
    }
}
