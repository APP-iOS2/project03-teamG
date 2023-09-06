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
                        .padding(.horizontal, -20)
                        AsyncImage(url: URL(string: ShoesSampleData[2].imageURLString)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200, height: 200)
                        } placeholder: {
                            ProgressView()
                        }
                        .padding(.horizontal, -20)
                    }
                    
                    .padding(.bottom)
                    
                    VStack(alignment: .leading) {
                        Text("\(ShoesSampleData[1].category.rawValue) 신발")
                            .padding(.bottom, 5)
                        
                        Text(ShoesSampleData[1].name)
                            .font(.mediumBold24)
                            .padding(.bottom, 20)
                        
                        Text("₩\(ShoesSampleData[1].price)")
                            .padding(.bottom, 20)
                        
                        Text(ShoesSampleData[1].description)
                            .font(.system(size: 16))
                    }
                    .padding()
                }
                .navigationTitle(ShoesSampleData[1].name)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
    }
}
