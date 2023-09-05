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
    @State var isLiked: Bool = false
    
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
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 180)
                                        .clipped()
                                } placeholder: {
                                    
                                    Image("progress")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 180)
                                        .clipped()
                                    
                                    
                                }
                                Group{
                                    //                                    Text("\(data.modelName.rawValue)")
                                    Text("\(data.name)")
                                    Text("\(data.category.rawValue)")
                                        .foregroundColor(Color.textGray)
                                    Text("₩\(data.price)")
                                }
                                .padding(0.3)
                            }
                            
                            
                            Button(action: {
                                isLiked.toggle()
                            }) {
                                Circle()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.white)
                                    .overlay(
                                        Image(systemName: isLiked ? "heart.fill" : "heart")
                                            .foregroundColor(isLiked ? .nikeRed : .nikeRed)
                                    )
                            }
                            .offset(x: 65, y: -110)
                            
                        }
                    }
                }
                .padding()
                
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
