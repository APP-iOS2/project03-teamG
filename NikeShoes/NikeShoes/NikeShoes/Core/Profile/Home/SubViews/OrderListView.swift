//
//  OrderListView.swift
//  NikeShoes
//
//  Created by Suji Jang on 2023/09/05.
//

import SwiftUI
import NikeShoesCore

struct OrderListView: View {
    @EnvironmentObject var orderViewModel: OrderViewModel
    
    var dto: OrderDTO
    var shoes: ShoesDTO
    
    @State private var tag: Int? = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 15) {
                AsyncImage(url: URL(string: shoes.imageURLString.first ?? "")) { image in
                    image.resizable()
                        .frame(width: 130, height: 130)
                } placeholder: {
                    ProgressView()
                }
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(dto.deliveryStatus.rawValue)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.nikeGreen)
                    
                    Text(shoes.name)
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.black)
                    
                    Text(shoes.modelName)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.gray)
                    
                    Text("\(shoes.size.first ?? 250) 사이즈")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.gray)
                }
            }
            
            NavigationLink(
                destination: OrderDetailsView(dto: dto, shoes: shoes, title: "주문 상세")
                    .environmentObject(orderViewModel),
                tag: 1,
                selection: self.$tag
            ) {
                ButtonStyle(buttonText: "주문 상세 보기", action: { self.tag = 1 })
            }
        }
    }
}
//
//struct OrderListView_Previews: PreviewProvider {
//    static var previews: some View {
//        OrderListView(dto: OrderDTO.init(id: "", shoesID: "", userID: "", address: "", deliveryStatus: .orderComplete, orderDate: Date()))
//            .environmentObject(OrderViewModel())
//    }
//}
