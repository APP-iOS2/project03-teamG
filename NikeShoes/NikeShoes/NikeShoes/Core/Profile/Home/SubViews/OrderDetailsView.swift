//
//  OrderDetailsView.swift
//  NikeShoes
//
//  Created by Suji Jang on 2023/09/05.
//

import SwiftUI
import NikeShoesCore
import Firebase

struct OrderDetailsView: View {
    @EnvironmentObject var orderViewModel: OrderViewModel
    var dto: OrderDTO
    
    var title: String
    
    var purchaseID: String = "C01272876223"
    @State var price: Int = 179000
    
    var orderListImageURL: String = "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/d3123e79-53e5-4a03-aa5b-fbc5c18b9bfd/%EC%97%90%EC%96%B4-%EC%A1%B0%EB%8D%98-1-%EB%A1%9C%EC%9A%B0-%EC%97%AC%EC%84%B1-%EC%8B%A0%EB%B0%9C-FBbeey7u.png"
    var productName: String = "에어 조던 1 로우 G"
    var productType: String = "골프화"
    var productSize: String = "290"
    var productSerialNumber: String = "Style DD9315-104"
    var productColor: String = "화이트/미드나이트 네이비/블랙"
    
//    var userName: String = "장수지"
    var streetAddress: String = "00로 00나길 0"
    var building: String = "000호"
    var province: String = "서울특별시"
    var district: String = "00구"
    var postalCode: String = "12345"
//    var userEmail: String = "ddudi@gmail.com"
//    var userPhoneNumber: String = "010-0000-0000"
    
    var deliveryFee: Int = 0
    @State private var isModalPresented = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Divider()
                VStack(alignment: .leading) {
                    Text("온라인 구매 - \(orderViewModel.toString(orderDate: dto.orderDate))")
                            .padding(EdgeInsets(top: 20, leading: 20, bottom: 3, trailing: 0))
                    
                    Text("\(purchaseID) ⏤ ₩\(price)")
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    
                    Rectangle()
                        .fill(Color.defaultGray)
                        .frame(height: 11)
                        .padding(EdgeInsets(top: 13, leading: 0, bottom: 13, trailing: 0))
                    
                        Text(dto.deliveryStatus.rawValue)
                            .font(.bold16)
                            .foregroundColor(.nikeGreen)
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    
                    HStack(alignment: .top, spacing: 15) {
                        AsyncImage(url: URL(string: orderListImageURL)) { image in
                            image.resizable()
                                .frame(width: 130, height: 130)
                        } placeholder: {
                            ProgressView()
                        }
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                        
                        VStack(alignment: .leading, spacing: 6) {
                            Text(productName)
                                .font(.bold16)
                                .foregroundColor(.black)
                            
                            Text("₩\(price)")
                                .font(.bold16)
                                .foregroundColor(.black)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
                            
                            Group {
                                Text(productColor)
                                Text(productType)
                                Text("\(productSize) 사이즈")
                                Text(productSerialNumber)
                            }
                            .font(.medium16)
                            .foregroundColor(.gray)
                        }
                    }
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 13, trailing: 0))
                    
                    if dto.deliveryStatus == .orderComplete || dto.deliveryStatus == .paymentComfirm {
                        HStack {
                            Spacer()
                            ButtonView(buttonText: "주문 취소", foreground: .white, background: .black) {
                                self.isModalPresented.toggle()
                            }
                            .sheet(isPresented: $isModalPresented) {
                                CancelOrderModalView(isModalPresented: self.$isModalPresented, price: $price)
                                    .presentationDetents([.fraction(0.35), .large])
                            }
                            Spacer()
                        }
                    }
                    
                    Rectangle()
                        .fill(Color.defaultGray)
                        .frame(height: 11)
                        .padding(EdgeInsets(top: 13, leading: 0, bottom: 13, trailing: 0))
                    
                    HStack(alignment: .top) {
                        Text("배송 정보")
                            .font(.bold16)
                            .foregroundColor(.black)
                            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                        
                        Spacer()
                        
                        VStack(alignment: .trailing, spacing: 6) {
                            if let orderData = orderViewModel.userData {
                                Text("\(orderData.lastName)\(orderData.firstName)")
                                
                                HStack {
                                    Text(province)
                                    Text(district)
                                }
                                
                                Text("\(streetAddress)")
                                Text(postalCode)
                                Text("\(orderData.email)")
                                Text("\(orderData.phoneNumber)")
                            }
                        }
                        .font(.medium16)
                        .foregroundColor(.gray)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20))
                    }
                    .padding(EdgeInsets(top: 13, leading: 0, bottom: 13, trailing: 0))
                }
                .font(.medium16)
                .foregroundColor(.gray)
                .frame(minHeight: 5)
                
                Divider()
                
                HStack {
                    Text("주문번호")
                        .font(.bold16)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Text(purchaseID)
                        .font(.medium16)
                        .foregroundColor(.gray)
                }
                .padding(EdgeInsets(top: 13, leading: 20, bottom: 13, trailing: 20))
                
                Divider()
                
                HStack {
                    Text("결제 방법")
                        .font(.bold16)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Image(systemName: "menubar.rectangle")
                        .font(.medium16)
                        .foregroundColor(.black)
                }
                .padding(EdgeInsets(top: 13, leading: 20, bottom: 13, trailing: 20))
                
                Divider()
                
                VStack(alignment: .leading, spacing: 10) {
                    Group {
                        Text("결제 정보")
                            .font(.bold16)
                            .foregroundColor(.black)
                        
                        HStack {
                            Text("총 상품금액")
                            Spacer()
                            Text("₩\(price)")
                        }
                        .font(.medium16)
                        .foregroundColor(.gray)
                        
                        HStack {
                            Text("배송비")
                            Spacer()
                            Text("₩\(deliveryFee)")
                        }
                        .font(.medium16)
                        .foregroundColor(.gray)
                        
                        HStack {
                            Text("총 결제금액")
                            Spacer()
                            Text("₩\(price-deliveryFee)")
                        }
                        .font(.bold16)
                        .foregroundColor(.black)
                    }
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                }
                .padding(EdgeInsets(top: 13, leading: 0, bottom: 13, trailing: 0))
            }
        }
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
        .navigationTitle("주문상세")
        .navigationBarTitleDisplayMode(.inline)
        .modifier(NavigationNikeSetting(title: title))
    }
}

struct OrderDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailsView(dto: OrderDTO.init(id: "", shoesID: "", userID: "", address: "", deliveryStatus: .orderComplete, orderDate: Date()), title: "주문 상세")
            .environmentObject(OrderViewModel())
    }
}
