//
//  SizeButtonView.swift
//  NikeShoes
//
//  Created by 전민돌 on 9/10/23.
//

import SwiftUI
import NikeShoesCore

struct SizeButtonView: View {
    @State private var isShowingSizeSheet = false
    @State var isSizeSelected = false
    @State var selectedSize = 240
    var shoesData: ShoesDTO
    
    var body: some View {
        Button {
            isShowingSizeSheet.toggle()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 31.5)
                    .stroke(Color.defaultGray, lineWidth: 1)
                    .frame(width: 351, height: 63)
                    .background(.white)
                
                if isSizeSelected {
                    Text("\(selectedSize) 사이즈  \(Image(systemName: "chevron.down"))")
                        .foregroundColor(.black)
                        .font(.system(size: 18))
                        .fontWeight(.medium)
                } else {
                    Text("사이즈 선택  \(Image(systemName: "chevron.down"))")
                        .foregroundColor(.black)
                        .font(.system(size: 18))
                        .fontWeight(.medium)
                }
            }
        }
        .sheet(isPresented: $isShowingSizeSheet) {
            SizeView(isSizeSelected: $isSizeSelected, selectedSize: $selectedSize, shoesData: shoesData)
                .presentationDetents([.medium, .medium])
        }
    }
}

struct SizeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SizeButtonView(shoesData: detailSample)
    }
}
