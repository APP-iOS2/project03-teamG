//
//  SizeView.swift
//  NikeShoes
//
//  Created by 전민돌 on 9/6/23.
//

import SwiftUI

struct SizeView: View {
    @State private var isButtonTapped = false
    var shoeSize: [Int] = [240, 245, 250, 255, 260, 265, 270, 275, 280, 285, 290, 295, 300, 305, 310, 320, 330]
    
    var body: some View {
        VStack(alignment: .leading) {
            List {
                HStack {
                    Text("사이즈")
                        .font(.system(size: 20))
                    
                    Spacer()
                    
                    Button {
                        print("sheet 내리기")
                    } label: {
                        Text("\(Image(systemName: "xmark"))")
                            .font(.system(size: 13))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(.vertical, 15)
                    }
                }
                
                ForEach(shoeSize, id:\.self) { size in
                    Button {
                        isButtonTapped = true
                    } label: {
                        HStack {
                            Text("\(size)")
                                .font(.system(size: 17))
                                .padding(.vertical, 15)
                            if isButtonTapped {
                                Spacer()
                                Text("\(Image(systemName: "checkmark"))")
                            }
                        }
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
        SizeView()
    }
}
