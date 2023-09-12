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
    @State var deliveryCheck: String = "배송 전"
    
    var body: some View {
        List {
            ForEach(orderViewModel.orderArray) {order in
                HStack {
                    Text("주문 번호: \(order.id ?? "")")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    // 데이터 연결 후 값 바꿔줄 수 있게 변경
                    //                   if order.paymentStatus {
                    //                       Text("입금 완료")
                    //                   } else {
                    //                       Button {
                    //                           //order.paymentComplete 값 바꿔주기
                    //                       } label: {
                    //                           Text("입금 확인 중")
                    //                       }
                    //                   }
                    
                }
                HStack {
                    VStack(alignment: .leading) {
                        Group {
                            Text("\(order.orderDate)")
                            Text("주문자: \(order.userID)")
                            Text("제품코드: \(order.shoesID)")
                            Text("배송지: \(order.address)")
                        }
                        .padding(.bottom, 1)
                    }
                    
                    Spacer()
                    
                    //데이터 연결 전에 임의 버튼들
                    // TODO: 여기 이넘으로 바꾸기~~~
                    Menu {
                        //
                        Button("어쩌꾸") {
                            deliveryCheck = "어쩌구 중"
                        }
                        Button("발송 완료?") {
                            deliveryCheck = "발송 완료"
                        }
                    } label: {
                        Text("\(deliveryCheck)")
                            .buttonStyle(.bordered)
                            .background(Color.white)
                    }
                    
                    
                }
            }
            
            
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    
                    let orderDTO: OrderDTO = OrderDTO(id: "wnans1qjs", shoesID: "AJ4v0y1e9hFgYfUcel9T", userID: "HIKeuU6XTsQehBASib1M49UoWen2", address: "서울시 강서구 어디로 4", deliveryStatus: .orderComplete, orderDate: Date())
                    
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
