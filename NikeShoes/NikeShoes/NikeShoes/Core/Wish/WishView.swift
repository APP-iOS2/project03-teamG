//
//  FavoritesView.swift
//  NikeClone
//
//  Created by 이희찬 on 2023/09/04.
//

import SwiftUI

struct WishView: View {
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    @State var isEditing: Bool = false
    @ObservedObject var storeModel: StoreModel = StoreModel()
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: columns) {
                    ForEach(storeModel.shoesInfo) { data in
                        if data.like {
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
                                if isEditing {
                                    Button(action: {
                                        //좋아요 토글하는 함수를 불러오기
                                        storeModel.toggle(data)
                                    }) {
                                        Circle()
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(.white)
                                            .overlay(
                                                Image(systemName: data.like ? "heart.fill" : "heart")
                                                    .foregroundColor(data.like ? .nikeRed : .nikeRed)
                                            )
                                    }
                                    .offset(x: 65, y: -110)
                                }
                            }
                        }
                    }
                }
                .padding()
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            isEditing.toggle()
                        } label: {
                            if isEditing == false {
                                Text("편집")
                            } else {
                                Text("완료")
                            }
                        }
                        .tint(.gray)
                        .bold()

                    }
                }
                .navigationTitle("위시리스트")
            }
        }
    }
}

struct WishView_Previews: PreviewProvider {
    static var previews: some View {
        WishView()
    }
}
