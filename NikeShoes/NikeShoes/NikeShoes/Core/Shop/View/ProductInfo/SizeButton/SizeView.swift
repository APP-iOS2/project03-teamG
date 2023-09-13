//
//  SizeView.swift
//  NikeShoes
//
//  Created by 전민돌 on 9/7/23.
//

import SwiftUI
import NikeShoesCore

struct SizeView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedSizeIndex = 0
    @Binding var isSizeSelected: Bool
    @Binding var selectedSize: Int
    var shoesData: ShoesDTO
    
    var body: some View {
        VStack(alignment: .leading) {
            List {
                HStack {
                    Text("사이즈")
                        .font(.system(size: 20))
                    
                    Spacer()
                    
                    Button {
                        dismiss()
                    } label: {
                        Text("\(Image(systemName: "xmark"))")
                            .font(.system(size: 13))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(.vertical, 15)
                    }
                }
                
                ForEach(0..<shoesData.size.count, id: \.self) { index in
                    HStack {
                        Text("\(shoesData.size[index])")
                            .font(.system(size: 17))
                            .padding(.vertical, 15)
                        
                        Spacer()
                        
                        Image(systemName: "checkmark")
                            .foregroundColor(index == selectedSizeIndex ? .black : .white)
                    }
                    .background(.white)
                    .onTapGesture {
                        // 이미지를 탭하면 선택된 이미지를 업데이트
                        selectedSizeIndex = index
                        selectedSize = shoesData.size[selectedSizeIndex]
                        isSizeSelected = true
                        print(shoesData.size[selectedSizeIndex])
                    }
                }
            }
            .listStyle(.plain)
        }
        .padding()
    }
}

struct SizeView_Previews: PreviewProvider {
    static var previews: some View {
        SizeView(isSizeSelected: .constant(false), selectedSize: .constant(240), shoesData: detailSample)
    }
}
