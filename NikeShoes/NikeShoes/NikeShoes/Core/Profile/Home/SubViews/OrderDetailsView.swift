//
//  OrderDetailsView.swift
//  NikeShoes
//
//  Created by Suji Jang on 2023/09/05.
//

import SwiftUI

struct OrderDetailsView: View {
    
    var dateOfPurchase: String = "온라인 구매 - 2023년 9월 4일"
    
    var body: some View {
        NavigationStack {
            List {
                VStack {
                    Text(dateOfPurchase)
                }
            }
            .listStyle(PlainListStyle())
        }
        .navigationTitle("Order Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct OrderDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailsView()
    }
}
