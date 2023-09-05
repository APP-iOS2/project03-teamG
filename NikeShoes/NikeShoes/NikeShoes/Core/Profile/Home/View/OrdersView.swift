//
//  OrdersView.swift
//  NikeShoes
//
//  Created by Suji Jang on 2023/09/05.
//

import SwiftUI

struct OrdersView: View {
    var body: some View {
        NavigationStack {
                OrdersEmptyView()
            .navigationTitle("Orders")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct OrdersEmptyView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Nothing to see here - yet")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.black)
            
            Text("We'll store your purchases here as soon as you make them.")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.black)
                .lineSpacing(8)
        }
        .padding()
    }
}

struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView()
    }
}

