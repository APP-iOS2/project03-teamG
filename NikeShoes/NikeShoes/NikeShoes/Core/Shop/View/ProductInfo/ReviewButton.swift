//
//  ReviewButton.swift
//  NikeShoes
//
//  Created by 전민돌 on 9/10/23.
//

import SwiftUI

struct ReviewButton: View {
    @State private var reviewToggle = false
    
    var body: some View {
        Button {
            reviewToggle.toggle()
        } label: {
            VStack(alignment: .leading) {
                if reviewToggle == false {
                    HStack {
                        Text("리뷰 (9359)")
                        Spacer()
                        ForEach(0..<5) { _ in
                            Image(systemName: "star.fill")
                        }
                        Image(systemName: "chevron.down")
                            .padding(.vertical, 28)
                    }
                } else {
                    HStack {
                        Text("리뷰 (9359)")
                        Spacer()
                        ForEach(0..<5) { _ in
                            Image(systemName: "star.fill")
                        }
                        Image(systemName: "chevron.up")
                            .padding(.vertical, 28)
                    }
                }
            }
            .foregroundColor(.black)
            .font(.system(size: 18))
        }
    }
}

struct ReviewButton_Previews: PreviewProvider {
    static var previews: some View {
        ReviewButton()
    }
}
