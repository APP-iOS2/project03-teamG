//
//  CartButtonView.swift
//  NikeShoes
//
//  Created by 전민돌 on 9/10/23.
//

import SwiftUI
import NikeShoesCore

struct CartButtonView: View {
    @ObservedObject var bagViewModel: BagViewModel
    var shoesData: ShoesDTO
    
    var body: some View {
        Button {
            print("장바구니에 추가")
            bagViewModel.addToBag(shoesData: shoesData)
            print("\(bagViewModel.bagArray)")
        } label: {
            ZStack {
                Rectangle()
                    .stroke(Color.black, lineWidth: 1)
                    .frame(width: 351, height: 63)
                    .background(.black)
                    .cornerRadius(31.5)
                
                Text("장바구니")
                    .foregroundColor(.white)
                    .font(.system(size: 18))
                    .fontWeight(.medium)
            }
        }
    }
}

struct CartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CartButtonView(bagViewModel: BagViewModel(), shoesData: detailSample)
    }
}
