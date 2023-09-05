//
//  ProductDetailView.swift
//  NikeShoes
//
//  Created by 전민돌 on 9/5/23.
//

import SwiftUI

struct ProductDetailView: View {
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    AsyncImage(url: URL(string: ShoesSampleData[1].imageURLString)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    VStack(alignment: .leading) {
                        HStack {
                            AsyncImage(url: URL(string: ShoesSampleData[1].imageURLString)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 200, height: 200)
                            } placeholder: {
                                ProgressView()
                            }
                            .padding(-40)
                            AsyncImage(url: URL(string: ShoesSampleData[2].imageURLString)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 200, height: 200)
                            } placeholder: {
                                ProgressView()
                            }
                        }
                        
                        Text("\(ShoesSampleData[1].category.rawValue)")
                        Text(ShoesSampleData[1].name)
                            .fontWeight(.medium)
                            .font(.system(size: 24))
                        
                    }
                    .padding()
                    .navigationTitle(ShoesSampleData[1].name)
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
    }
}
