//
//  OrdersView.swift
//  NikeShoes
//
//  Created by Suji Jang on 2023/09/05.
//

import SwiftUI

struct OrdersView: View {
    
    var title: String
    
    @State private var tag: Int? = nil
    
    var body: some View {
        NavigationStack {
            List {
                OrderListView()
            }
            .listStyle(.plain)
            .frame(height: 170)
            
/*           ZStack {
                NavigationLink(destination: OrderDetailsView(), tag: 1, selection: self.$tag) {
                    ButtonStyle(buttonText: "장바구니 보기")
                }
                Button(action: {
                    self.tag = 1
                }) {
                    EmptyView()
                }
            }*/
            NavigationLink(destination: OrderDetailsView(title: "주문 상세"), tag: 1, selection: self.$tag) {
                ButtonStyle(buttonText: "주문 상세 보기", action: {self.tag = 1})
            }
        }
        .navigationTitle("주문내역")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(NavigationNikeSetting(title: title))
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
        OrdersView(title: "주문내역")
    }
}
