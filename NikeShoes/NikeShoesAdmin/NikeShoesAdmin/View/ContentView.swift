//
//  ContentView.swift
//  NikeShoesAdmin
//
//  Created by 최소정 on 2023/09/04.
//

import SwiftUI
import NikeShoesCore

struct ContentView: View {
    @State private var selectedCategoryId: NavigationItem.ID?
    @State private var selectedItem: NavigationItem?
    
    private var adminModel = AdminModel()
    
    var body: some View {
        NavigationSplitView {
            List(adminModel.topMenuItems, selection: $selectedCategoryId) { item in
                Text(item.name)
                    .font(.title)
            }
            .navigationTitle("메뉴")
        } content: {
            if let selectedCategoryId,
               let subMenuItems = adminModel.subMenuItems(for: selectedCategoryId) {
                List(subMenuItems, selection: $selectedItem) { item in
                    NavigationLink(value: item) {
                        Text(item.name)
                            .font(.title)
                    }
                }
                .listStyle(.plain)
                .navigationBarTitleDisplayMode(.inline)
            } else {
                Text("상위 항목을 선택해주세요.")
            }
        } detail: {
            if let selectedItem {
                adminModel.showDetailView(item: selectedItem)
            } else {
                Text("항목을 선택해주세요.")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct NavigationItem: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var subMenuItems: [NavigationItem]?
}


struct AdminModel {

    let topMenuItems = [
        NavigationItem(name: "제품관리"),
        NavigationItem(name: "주문관리"),
        NavigationItem(name: "프로모션관리")
    ]
    
    func subMenuItems(for id: NavigationItem.ID) -> [NavigationItem]? {
        guard let item = topMenuItems.first(where: { $0.id == id }) else { return nil
        }
        
        return item.subMenuItems
    }
    
    func showDetailView(item: NavigationItem) -> some View {
        switch item.name {
        case "제품목록":
            return AnyView(ProductListView())
        case "주문내역":
            return AnyView(OrderView())
        case "프로모션관리":
            return AnyView(PromotionView())
        default:
            return AnyView(EmptyView())
        }
        
    }
}

