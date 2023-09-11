//
//  OrderView.swift
//  NikeShoesAdmin
//
//  Created by 여성은 on 2023/09/11.
//

import SwiftUI

struct Ordered: Identifiable {
    var id: UUID = UUID()
    var userId: String
    var productId: String
    var orderDate: String
    var paymentComplete: Bool
    var address: String
}

struct OrderView: View {
    var orderArray: [Ordered] = [
        Ordered(userId: "성은띠", productId: "에어포스어쩌구235", orderDate: "2023-09-12", paymentComplete: false, address: "서울시 강서구 어쩌구"),
        Ordered(userId: "뚜디오스", productId: "조던PINK225", orderDate: "2023-08-31", paymentComplete: true, address: "서울시 동작구 어쩌구"),
        Ordered(userId: "소뎡소뎡", productId: "덩크로우240", orderDate: "2023-09-10", paymentComplete: false, address: "서울시 서대문구 어쩌구"),
        Ordered(userId: "팀짱형쭌", productId: "코르테즈BLUE275", orderDate: "2023-09-12", paymentComplete: true, address: "서울시 어디구 어쩌동"),
    ]
    @State var ischeckedPayment: Bool = false
    @State var deliveryCheck: String = "배송 전"
    
    var body: some View {
       List {
           ForEach(orderArray) {order in
               HStack {
                   Text("주문 번호: \(order.id)")
                       .font(.caption)
                       .foregroundColor(.gray)
                   
                   Spacer()
                   
                   // 데이터 연결 후 값 바꿔줄 수 있게 변경
                   if order.paymentComplete {
                       Text("입금 완료")
                   } else {
                       Button {
                           //order.paymentComplete 값 바꿔주기
                       } label: {
                           Text("입금 확인 중")
                       }
                   }
                   
               }
               HStack {
                   VStack(alignment: .leading) {
                       Group {
                           Text("\(order.orderDate)")
                           Text("주문자: \(order.userId)")
                           Text("제품코드: \(order.productId)")
                           Text("배송지: \(order.address)")
                       }
                       .padding(.bottom, 1)
                   }
                   
                   Spacer()
                   
                   //데이터 연결 전에 임의 버튼들
                   VStack(alignment: .trailing) {
                       Button {
                           ischeckedPayment.toggle()
                       } label: {
                           Text(ischeckedPayment ? "입금 완료" : "입금 확인 중")
                       }
                       .buttonStyle(.bordered)
                       
                       //배송 관련 정보는 체크할건지 !
                       if ischeckedPayment {
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
           }
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
