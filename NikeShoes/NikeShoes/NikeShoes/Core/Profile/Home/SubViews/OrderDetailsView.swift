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
    @ObservedObject var addressviewModel: AddressViewModel = AddressViewModel()
    var dto: OrderDTO
    var shoes: ShoesDTO
    
    var title: String
    
    var purchaseID: String = "C01272876223"
    @State var price: Int = 179000
    
    var deliveryFee: Int = 0
    @State private var isModalPresented = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Divider()
                VStack(alignment: .leading) {
                    Text("온라인 구매 - \(orderViewModel.toString(orderDate: dto.orderDate))")
                        .padding(EdgeInsets(top: 20, leading: 20, bottom: 3, trailing: 0))
                    
                    Text("\(purchaseID) ⏤ ₩\(shoes.price)")
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
                        AsyncImage(url: URL(string: shoes.imageURLString.first ?? "")) { image in
                            image.resizable()
                                .frame(width: 130, height: 130)
                        } placeholder: {
                            ProgressView()
                        }
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                        
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
                            
                            Text("₩\(shoes.price)")
                                .font(.system(size: 16, weight: .medium))
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
                            }
                            /*
                             Text("\(addressviewModel.addresses.first?.city ?? "") \(addressviewModel.addresses.first?.district ?? "")")
                             Text(addressviewModel.addresses.first?.town ?? "") // street 없음
                             */
                            Text(addressviewModel.addresses.first?.fullAddress ?? "")
                            Text(addressviewModel.addresses.first?.postalCode ?? "")
                            Text(orderViewModel.userData?.email ?? "")
                            Text(orderViewModel.userData?.phoneNumber ?? "")
                            
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
                            Text("₩\(orderViewModel.shoesData?.first?.price ?? 0)")
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
                            Text("₩\((orderViewModel.shoesData?.first?.price ?? 0)-deliveryFee)")
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

//struct OrderDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        OrderDetailsView(dto: OrderDTO.init(id: "", shoesID: "", userID: "", address: "", deliveryStatus: .orderComplete, orderDate: Date()), title: "주문 상세")
//            .environmentObject(OrderViewModel())
//    }
//}
