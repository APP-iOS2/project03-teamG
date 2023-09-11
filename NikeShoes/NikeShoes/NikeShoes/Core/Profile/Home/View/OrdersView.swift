//
//  OrdersView.swift
//  NikeShoes
//
//  Created by Suji Jang on 2023/09/05.
//

import SwiftUI

struct OrdersView: View {
    
    var title: String
    @State var purchaseID: String? = nil
    
    @State private var tag: Int? = 0
    
    var body: some View {
        NavigationStack {
            if purchaseID == nil {
                OrdersEmptyView()
            } else {
                
                List {
                    OrderListView(purchaseID: $purchaseID)
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
        }
        .navigationTitle("주문내역")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(NavigationNikeSetting(title: title))
    }
}

struct OrdersEmptyView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Text("아직 표시될 내용이 없습니다")
                    .font(.semiBold24)
                    .foregroundColor(.black)
                Spacer()
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
            
            HStack {
                Text("구매가 완료되는 대로 구매 내역이 저장됩니다.")
                    .font(.medium16)
                    .foregroundColor(.black)
                    .lineSpacing(8)
                Spacer()
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
        }
        .padding()
    }
}

struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView(title: "주문내역", purchaseID: "")
//        OrdersEmptyView()
    }
}
