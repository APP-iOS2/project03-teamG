//
//  OrderView.swift
//  NikeShoesAdmin
//
//  Created by 여성은 on 2023/09/11.
//

import SwiftUI
import NikeShoesCore

struct OrderView: View {
    
    @ObservedObject var orderViewModel: OrderViewModel = OrderViewModel()
    @State var ischeckedPayment: Bool = false
    @State var deliveryStatus: String = "주문 상태"
    @State private var selectedStatus = DeliveryStatus.orderComplete
    
    var body: some View {
        List {
            ForEach(orderViewModel.orderArray) {order in
                HStack {
                    Text("주문 번호: \(order.id ?? "")")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Spacer()
                    
                    Menu {
                        //
                        Button(DeliveryStatus.orderComplete.rawValue) {
                            deliveryStatus = "주문 완료"
                            Task { try await orderViewModel.updateOrder(id: order.id ?? "K2n0ycQzHc4ghgT0sy8q", deliveryStatus: DeliveryStatus.orderComplete.rawValue)
                            }
                            
                        }
                        Button(DeliveryStatus.paymentComfirm.rawValue) {
                            deliveryStatus = "입금 확인"
                            Task { try await orderViewModel.updateOrder(id: order.id ?? "K2n0ycQzHc4ghgT0sy8q", deliveryStatus: DeliveryStatus.paymentComfirm.rawValue)
                            }
                        }
                        Button(DeliveryStatus.shipping.rawValue) {
                            Task { try await orderViewModel.updateOrder(id: order.id ?? "K2n0ycQzHc4ghgT0sy8q", deliveryStatus: DeliveryStatus.shipping.rawValue)
                            }
                        }
                        Button(DeliveryStatus.deliveryComplete.rawValue) {
                            Task { try await orderViewModel.updateOrder(id: order.id ?? "K2n0ycQzHc4ghgT0sy8q", deliveryStatus: DeliveryStatus.deliveryComplete.rawValue)
                            }
                        }
                        
                    } label: {
                        Text("\(order.deliveryStatus.rawValue)")
                            .fontWeight(.semibold)
                        
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                    
                    
                    
                    
                    
                }
                HStack {
                    VStack(alignment: .leading) {
                        Group {
                            Text("\(orderViewModel.toString(orderDate: order.orderDate))")
                            Text("주문자: \(order.userID)")
                            Text("제품코드: \(order.shoesID)")
                            Text("배송지: \(order.address)")
                        }
                        .padding(.bottom, 1)
                    }
                    
                }
            }
        }
        .refreshable {
            Task { try await orderViewModel.fetchOrder()
            }
        }
        // 테스트용 버튼 추후 삭제
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    let orderDTO: OrderDTO = OrderDTO(id: "wnans1qjs", shoesID: "3cZZnyUKhKqBQzk4hQ00", userID: "nUxbsZTBp9XeiONcnmOYioiDtfD3", address: "성은이집으로..", deliveryStatus: .orderComplete, orderDate: Date())
                    
                    Task { try await orderViewModel.createOrder(orderDTO: orderDTO)
                    }
                } label: {
                    Text("주문 추가")
                }
            }
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            OrderView()
        }
    }
}
