//
//  ItemListView.swift
//  NikeShoes
//
//  Created by 여성은 on 2023/09/05.
//

import SwiftUI
import Foundation

struct ItemListView: View {
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: columns) {
                    ForEach(ShoesSampleData) { data in
                        ZStack{
                            VStack(alignment: .leading) {
                                AsyncImage(url: URL(string: "\(data.imageURLString)")) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width:180, height: 180)
                                } placeholder: {
                                    Image("progress")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width:180, height: 180)
                                }
                                Group{
                                    Text("\(data.modelName.rawValue)")
                                    Text("\(data.name)")
                                    Text("\(data.category.rawValue)")
                                        .foregroundColor(.gray)
                                    Text("\(data.price)")
                                }
                                .padding(0.2)
                            }
                            Image(systemName: "heart")
                                .offset(x: 60, y: -130)
                            
                        }
                    }
                }
                
            }
        }
        .navigationTitle("신제품 어쩌고")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ItemListView()
            
        }
    }
}
