//
//  ProductLinkView.swift
//  NikeShoes
//
//  Created by 전민돌 on 9/12/23.
//

import SwiftUI

struct ProductLinkView: View {
    var body: some View {
        NavigationLink {
            ProductDetailView()
        } label: {
            HStack {
                AsyncImage(url: URL(string: ShoesSampleData[1].imageURLString)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                } placeholder: {
                    ProgressView()
                }
                
                Text("Nike Air Force 1 '07")
                    .foregroundColor(.black)
            }
        }
        .padding(.leading, -60)
        .padding(.bottom, 20)
    }
}

struct ProductLinkView_Previews: PreviewProvider {
    static var previews: some View {
        ProductLinkView()
    }
}
