//
//  OrdersView.swift
//  NikeShoes
//
//  Created by Suji Jang on 2023/09/05.
//

import SwiftUI

struct OrdersView: View {
    
    @StateObject var orderViewModel: OrderViewModel = OrderViewModel()
    
    var title: String
    
    var body: some View {
        NavigationStack {
            if orderViewModel.orderData != nil {
                ScrollView {
                    ForEach(orderViewModel.orderData ?? []) { orderList in
                        OrderListView(dto: orderList)
                            .environmentObject(orderViewModel)
                    }
                }
            } else {
                OrdersEmptyView()
            }
        }
        .navigationTitle("주문내역")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(NavigationNikeSetting(title: title))
        .refreshable {
            Task {
                try await orderViewModel.fetchData()
            }
        }
        .onAppear {
            Task {
                try await orderViewModel.fetchData()
            }
        }
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
        OrdersView(title: "주문내역")
        //        OrdersEmptyView()
    }
}
