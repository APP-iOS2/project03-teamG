//
//  CancelOrderModalView.swift
//  NikeShoes
//
//  Created by Suji Jang on 2023/09/07.
//

import SwiftUI

struct CancelOrderModalView: View {
    
    @EnvironmentObject var orderViewModel: OrderViewModel
    
    @Binding var isModalPresented: Bool
    @State private var isCancelModalPresented = false
    @Binding var price: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("주문을 취소하시겠습니까?")
                .font(.semiBold24)
                .foregroundColor(.black)
                .padding(EdgeInsets(top: 40, leading: 0, bottom: 10, trailing: 0))
            
            Text("주문 취소가 가능합니다 ⏤ 무료")
                .font(.medium16)
                .foregroundColor(.black)
            
            ButtonView(buttonText: "주문 취소", foreground: .white, background: .black) {
                self.isCancelModalPresented.toggle()
            }
            .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
            .sheet(isPresented: $isCancelModalPresented) {
                CancelModalView(orderViewModel: orderViewModel, isModalPresented: self.$isModalPresented, price: $price)
                    .presentationDetents([.fraction(0.35), .large])
            }
            
            ButtonStyle(buttonText: "돌아가기", action: {self.isModalPresented.toggle()})
        }
        .padding()
    }
}

struct CancelModalView: View {
    
    @StateObject var orderViewModel: OrderViewModel
    @Binding var isModalPresented: Bool
    @Binding var price: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("주문이 취소되었습니다")
                .font(.semiBold24)
                .foregroundColor(.black)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            
            Text("취소가 완료되었고, 청구되지 않습니다. 이 페이지에서 주문 상태 업데이트를 표시하는 데 몇 분 정도 걸릴 수 있습니다.")
            .font(.medium16)
            .foregroundColor(.black)
            
            ButtonView(buttonText: "확인", foreground: .white, background: .black) {
                
                Task {
                    try await orderViewModel.updateOrderCancel()
                }
                self.price = 0
                orderViewModel.cancelOrderStatus()
                
                    self.isModalPresented.toggle()
            }
            .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
        }
        .padding()
        
        .task {
            do {
                try await orderViewModel.fetchData()
            } catch {
                
            }
        }
    }
}

struct CancelOrderModalView_Previews: PreviewProvider {
    static var previews: some View {
        CancelOrderModalView(isModalPresented: .constant(true), price: .constant(0))
            .environmentObject(OrderViewModel())
    }
}
