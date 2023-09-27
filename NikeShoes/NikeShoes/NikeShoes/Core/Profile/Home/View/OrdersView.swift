//
//  OrdersView.swift
//  NikeShoes
//
//  Created by Suji Jang on 2023/09/05.
//

import SwiftUI

// 스켈레톤 뷰를 표현하기 위한 뷰
struct SkeletonOrderView: View {
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray.opacity(0.3))
                .frame(width: 130, height: 130)
            
            VStack(alignment: .leading) {
                ForEach(0..<3) { _ in
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 20)
                        .padding(.bottom, 2)
                }
            }
        }
        .padding()
    }
}

// 주문 목록을 표현하기 위한 뷰
struct OrdersView: View {
    
    @StateObject var orderViewModel: OrderViewModel = OrderViewModel()
    
    var title: String
    
    var body: some View {
        NavigationStack {
            // 주문 데이터가 있을 경우
            if let orders = orderViewModel.orderData?.sorted(by: { $0.orderDate > $1.orderDate }),
               !orders.isEmpty,
               let shoesData = orderViewModel.shoesData {
                ScrollView {
                    ForEach(orders.indices, id: \.self) { index in
                        if let shoes = shoesData.first(where: { $0.id == orders[index].shoesID }) {
                            OrderListView(dto: orders[index], shoes: shoes)
                                .environmentObject(orderViewModel)
                        }
                    }
                }
            } else {
                // 주문 데이터가 없을 경우 스켈레톤 뷰를 표시
                ScrollView {
                    ForEach(0..<5, id: \.self) { _ in
                        SkeletonOrderView()
                    }
                }
            }
        }
        .navigationTitle("주문내역")
        .navigationBarTitleDisplayMode(.inline)
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
