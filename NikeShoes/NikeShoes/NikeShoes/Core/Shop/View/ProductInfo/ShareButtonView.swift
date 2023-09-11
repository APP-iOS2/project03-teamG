//
//  ShareButtonView.swift
//  NikeShoes
//
//  Created by 전민돌 on 9/10/23.
//

import SwiftUI

struct ShareButtonView: View {
    var body: some View {
        Button {
            print("공유 버튼")
        } label: {
            HStack {
                Spacer()
                
                Text("\(Image(systemName: "square.and.arrow.up")) 공유")
                    .foregroundColor(.black)
                    .padding(.vertical, 28)
                
                Spacer()
            }
        }
    }
}

struct ShareButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ShareButtonView()
    }
}
