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
                
                Text("사이즈 선택  \(Image(systemName: "chevron.down"))")
                    .foregroundColor(.black)
                    .font(.system(size: 18))
                    .fontWeight(.medium)
            }
        }
        .sheet(isPresented: $isShowingSizeSheet) {
            SizeView(shoesData: shoesData)
                .presentationDetents([.medium, .medium])
        }
    }
}

struct SizeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SizeButtonView(shoesData: detailSample)
    }
}
