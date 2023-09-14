//
//  FavoritesView.swift
//  NikeClone
//
//  Created by 이희찬 on 2023/09/04.
//

import SwiftUI

struct WishView: View {
    
    private let columns = [GridItem(.flexible()), GridItem(.flexible())]
    @State private var isEditing: Bool = false
    
    @EnvironmentObject var storeModel: WishListViewModel
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(storeModel.shoesInfo) { data in
                    if data.like {
                        ZStack {
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
                                Group {
                                    Text("\(data.name)")
                                    Text("\(data.category.rawValue)")
                                        .foregroundColor(Color.textGray)
                                    Text("₩\(data.price)")
                                }
                                .padding(0.3)
                            }
                            if isEditing {
                                Button(action: {
                                    
                                     // 좋아요 토글하는 함수를 불러오기
                                     // storeModel.toggle(data)
                                    Task {
                                        do {
                                            data.like
                                            ?
                                            try await storeModel.unLikeShoes(shoes: data)
                                            :
                                            try await storeModel.likeUpdate(shoes: data)
                                        } catch {
                                            Log.debug("❌ error \(error)")
                                        }
                                    }
                                    
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
        }.refreshable {
            Task {
                await storeModel.fetchLikeShoes()
            }
        }
        .onAppear {
            Task {
                await storeModel.fetchLikeShoes()
            }
        }
    }
}

struct WishView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            WishView()
        }
    }
}
