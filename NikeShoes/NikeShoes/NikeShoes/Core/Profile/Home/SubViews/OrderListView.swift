//
//  OrderListView.swift
//  NikeShoes
//
//  Created by Suji Jang on 2023/09/05.
//

import SwiftUI

struct OrderListView: View {
    @Binding var purchaseID: String?
    var orderListImageURL: String = "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/d3123e79-53e5-4a03-aa5b-fbc5c18b9bfd/%EC%97%90%EC%96%B4-%EC%A1%B0%EB%8D%98-1-%EB%A1%9C%EC%9A%B0-%EC%97%AC%EC%84%B1-%EC%8B%A0%EB%B0%9C-FBbeey7u.png"
    var orderState: String = "주문 취소"
    var productName: String = "에어 조던 1 로우 G"
    var productType: String = "골프화"
    var productSize: String = "290 사이즈"
    var productSerialNumber: String = "Style DD9315-104"
    
    @State private var tag: Int? = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 15) {
                AsyncImage(url: URL(string: orderListImageURL)) { image in
                    image.resizable()
                        .frame(width: 130, height: 130)
                } placeholder: {
                    ProgressView()
                }
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(orderState)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.nikeGreen)
                    
                    Text(productName)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.black)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                    
                    Text(productType)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.gray)
                    
                    Text(productSize)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.gray)
                    
                    Text(productSerialNumber)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.gray)
                }
            }
            .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
            
            if orderState == "주문 취소" {
                NavigationLink(destination: OrderDetailsView(title: "주문 상세"), tag: 1, selection: self.$tag) {
                    ButtonStyle(buttonText: "재주문 하기", action: {self.tag = 1})
                }
            } else {
                NavigationLink(destination: OrderDetailsView(title: "주문 상세"), tag: 1, selection: self.$tag) {
                    ButtonStyle(buttonText: "주문 상세 보기", action: {self.tag = 1})
                }
            }
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView(purchaseID: .constant(nil))
    }
}
