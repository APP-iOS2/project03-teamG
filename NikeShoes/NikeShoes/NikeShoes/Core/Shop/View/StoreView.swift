//
//  ShopLocationView.swift
//  NikeShoes
//
//  Created by 안지영 on 2023/09/05.
//

import SwiftUI

struct StoreView: View {
    
    @ObservedObject var storeModel = StoreModel()
    
    @State var isShowingMapSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                Text("추천 매장")
                    .font(Font.semiBold24)
                    .listRowSeparator(.hidden)
                
                ForEach(storeModel.stores) { store in
                    NavigationLink {
                        StoreDetailView(store: store)
                    } label: {
                        StoreItemView(store: store)
                    }

                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("나이키 매장 찾기")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button {
                        isShowingMapSheet = true
                    } label: {
                        Image(systemName: "map")
                    }

                }
                ToolbarItem {
                    Button {
                        //
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }

                }
            }
            .fullScreenCover(isPresented: $isShowingMapSheet) {
                UserMapView(isShowingMapSheet: $isShowingMapSheet)
            }
        }
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}
