//
//  ProductListView.swift
//  NikeShoesAdmin
//
//  Created by 김성훈 on 2023/09/11.
//

import SwiftUI

struct ProductListView: View {
    
    @StateObject private var viewModel = ProductViewModel()

    var body: some View {
        if viewModel.shoes.count > 0 {
//            List(viewModel.shoes.indices, id: \.self) { index in
////                NavigationLink {
////                    ProductEditView(shoes: $viewModel.shoes[index])
////                } label: {
////                    Text(viewModel.shoes[index].name)
////                }
//
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    NavigationLink {
//                        ProductAddView()
//                    } label: {
//                        Image(systemName: "plus")
//                    }
//                }
//            }
        } else {
            EmptyView()
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProductListView()
        }
    }
}
