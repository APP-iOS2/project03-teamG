//
//  SizeView.swift
//  NikeShoes
//
//  Created by 전민돌 on 9/7/23.
//

import SwiftUI

struct SizeView: View {
    @State private var isButtonTapped = false
    
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
                
                ForEach(ShoesSampleData[1].size, id: \.self) { size in
                    Button {
                        isButtonTapped = true
                        print(size)
                    } label: {
                        Text("\(size)")
                            .font(.system(size: 17))
                            .padding(.vertical, 15)
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
