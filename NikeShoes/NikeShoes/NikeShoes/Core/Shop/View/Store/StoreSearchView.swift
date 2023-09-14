//
//  StoreSearchView.swift
//  NikeShoes
//
//  Created by 안지영 on 2023/09/12.
//

import SwiftUI

struct StoreSearchView: View {
    
    @StateObject var storeModel: StoreModel = StoreModel()
    
    @Binding var isShowingSearchSheet: Bool
    
    @State private var searchText = ""
    
    // 검색어와 관련된 매장 필터 
    var filteredStore: [StoreData] {
        if searchText.isEmpty {
            return storeModel.stores
        } else {
            return storeModel.stores.filter { store in
                return store.name.localizedCaseInsensitiveContains(searchText) ||
                store.district.localizedCaseInsensitiveContains(searchText) ||
                store.city.localizedCaseInsensitiveContains(searchText) ||
                store.detailAddress.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredStore) { store in
                    NavigationLink {
                        StoreDetailView(store: store)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(store.name)
                            HStack {
                                Text(store.district)
                                Text(store.city)
                                Text(store.detailAddress)
                            }
                            .font(Font.medium12)
                        }
                        .padding(3)
                    }
                }
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        isShowingSearchSheet = false
                    } label: {
                        Text("닫기")
                    }
                }
            }
        }
        .searchable(text: $searchText, prompt: "찾고싶은 매장 위치를 검색하세요.")
        .listStyle(.plain)
        
    }
}

struct StoreSearchView_Previews: PreviewProvider {
    static var previews: some View {
        StoreSearchView(isShowingSearchSheet: .constant(true))
    }
}
