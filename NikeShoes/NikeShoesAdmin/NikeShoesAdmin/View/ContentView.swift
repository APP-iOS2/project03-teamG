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
        } detail: {
            if let id = selectedCategoryId,
               let item = adminModel.menuItems(for: id) {
                adminModel.showDetailView(item: item)
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
    
    func menuItems(for id: NavigationItem.ID) -> NavigationItem? {
        guard let item = topMenuItems.first(where: { $0.id == id }) else { return nil
        }
        
        return item
    }
    
    func showDetailView(item: NavigationItem) -> some View {
        switch item.name {
        case "제품관리":
            return AnyView(ProductListView())
        case "주문관리":
            return AnyView(OrderView())
        case "프로모션관리":
            return AnyView(PromotionView())
        default:
            return AnyView(EmptyView())
        }
        
    }
}

