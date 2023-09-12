//
//  ShopLocationView.swift
//  NikeShoes
//
//  Created by 안지영 on 2023/09/05.
//

import SwiftUI

struct StoreView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var storeModel = StoreModel()
    
    @State private var isShowingMapSheet: Bool = false
    @State private var isShowingSearchSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                Text("추천 매장")
                    .font(Font.semiBold24)
                    .listRowSeparator(.hidden)
                
                ForEach(storeModel.stores) { store in
                    ZStack {
                        NavigationLink {
                            StoreDetailView(store: store)
                        } label: {
                            EmptyView()
                        }
                        .buttonStyle(.plain)
                        
                        StoreItemView(store: store)
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("나이키 매장 찾기")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                // back버튼
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                    }
                }
                ToolbarItem {
                    Button {
                        isShowingMapSheet = true
                    } label: {
                        Image(systemName: "map")
                    }
                }
                ToolbarItem {
                    Button {
                        isShowingSearchSheet = true
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                    
                }
            }
            .fullScreenCover(isPresented: $isShowingMapSheet) {
                UserMapView(isShowingMapSheet: $isShowingMapSheet)
            }
            .fullScreenCover(isPresented: $isShowingSearchSheet) {
                StoreSearchView(isShowingSearchSheet: $isShowingSearchSheet)
            }
        }
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}
