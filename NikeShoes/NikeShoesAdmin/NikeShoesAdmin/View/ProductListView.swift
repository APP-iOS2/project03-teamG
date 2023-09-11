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
        List($viewModel.shoes, id: \.self) { shoes in
            NavigationLink {
                ProductEditView(shoes: shoes)
            } label: {
                Text(shoes.wrappedValue.name)
            }
            
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    ProductAddView()
                } label: {
                    Image(systemName: "plus")
                }
            }
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
