//
//  PaymentView.swift
//  NikeShoes
//
//  Created by Chloe Chung on 2023/09/07.
//

import SwiftUI

struct PaymentView: View {
    @State var selectedQty: Int
    @State var finalPrice: String
    
    @State private var isShipmentFolded = true
    @State private var isPaymentFolded = true
    @State private var isPriceFolded = true
    
    @State private var lastName: String = ""
    @State private var firstName: String = ""
    @State private var mobileNumber: String = ""
    @State private var roadAddress: String = ""
    @State private var buildingUnit: String = ""
    @State private var state: String = ""
    @State private var city: String = ""
    @State private var province: String = ""
    @State private var zipcode: String = ""
    @State private var country: String = "대한민국"
    
    @State private var deiliveryAdd: String = ""
    @State private var paymentMethod: String = ""
    @State private var isPaymentTapped: Bool = true
    @State private var isArgreeTapped: Bool = true
    
    var body: some View {
        
        let isFormFilled = !lastName.isEmpty && !firstName.isEmpty && !mobileNumber.isEmpty && !roadAddress.isEmpty && !buildingUnit.isEmpty && !city.isEmpty && !zipcode.isEmpty
        
        VStack {
            Text("주문하기")
                .padding()
            Text("\(selectedQty)개의 제품")
                .font(.footnote)
                .foregroundColor(.gray)
            Group {
                Divider()
                
                HStack {
                    
                    Spacer()
                    
                    if isShipmentFolded {
                        Button {
                            withAnimation {
                                isShipmentFolded.toggle()
                            }
                        } label: {
                            HStack {
                                Text("배송")
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                if isFormFilled == false {
                                    Text("배송지 선택")
                                        .foregroundColor(.red)
                                } else {
                                    VStack(alignment: .trailing) {
                                        Text("무료 배송")
                                        Text("\(roadAddress)")
                                        Text("\(buildingUnit)")
                                        Text("9월 30일 도착 예정")
                                    }
                                }
                                Image(systemName: "plus")
                            }
                            .foregroundColor(.black)
                        }
                    } else {
                        //                        ZStack(alignment: .leading) {
                        VStack {
                            Button {
                                withAnimation {
                                    isShipmentFolded.toggle()
                                }
                            } label: {
                                VStack {
                                    HStack {
                                        Text("배송지 주소 추가")
                                        
                                        Spacer()
                                        
                                        Image(systemName: "minus")
                                    }
                                    .foregroundColor(.black)
                                    
                                }
                            }
                            VStack {
                                Group {
                                    TextField("성", text: $lastName)
                                        .textFieldStyle(.roundedBorder)
                                    //                                    .frame(width: 250)
                                    
                                    TextField("이름", text: $firstName)
                                        .textFieldStyle(.roundedBorder)
                                    //                                    .frame(width: 250)
                                    
                                    TextField("전화번호", text: $mobileNumber)
                                        .textFieldStyle(.roundedBorder)
                                    //                                    .frame(width: 250)
                                        .keyboardType(.numberPad)
                                    
                                    TextField("도로 주소", text: $roadAddress)
                                        .textFieldStyle(.roundedBorder)
                                    //                                    .frame(width: 250)
                                        .keyboardType(.numberPad)
                                    
                                    TextField("건물/아파트, 층, 호수", text: $buildingUnit)
                                        .textFieldStyle(.roundedBorder)
                                    //                                    .frame(width: 250)
                                        .keyboardType(.numberPad)
                                    
                                    TextField("도/광역시", text: $state)
                                        .textFieldStyle(.roundedBorder)
                                    //                                    .frame(width: 250)
                                        .keyboardType(.numberPad)
                                    
                                    TextField("시/구/군", text: $city)
                                        .textFieldStyle(.roundedBorder)
                                    //                                    .frame(width: 250)
                                        .keyboardType(.numberPad)
                                    
                                    TextField("동/읍/면(선택)", text: $province)
                                        .textFieldStyle(.roundedBorder)
                                    //                                    .frame(width: 250)
                                        .keyboardType(.numberPad)
                                    
                                    TextField("우편번호", text: $zipcode)
                                        .textFieldStyle(.roundedBorder)
                                    //                                    .frame(width: 250)
                                        .keyboardType(.numberPad)
                                    
                                    TextField("대한민국", text: $country)
                                        .textFieldStyle(.roundedBorder)
                                    //                                    .frame(width: 250)
                                        .keyboardType(.numberPad)
                                }
                                
                                //                                Button {
                                //
                                //                                } label: {
                                //                                    ZStack {
                                //                                        RoundedRectangle(cornerRadius: 31.5)
                                //                                            .stroke(Color.defaultGray, lineWidth: 1)
                                //                                            .frame(width: 220, height: 60)
                                //                                            .background(.white)
                                //
                                //                                        Text("수동으로 입력하기")
                                //                                            .foregroundColor(.black)
                                //                                            .font(.system(size: 20))
                                //                                            .fontWeight(.medium)
                                //                                    }
                                //                                }
                                //                                .frame(maxWidth: .infinity, alignment: .leading)
                                //                                .foregroundColor(.black)
                                //                                .buttonBorderShape(.roundedRectangle)
                                
                                // 내용이 모두 채워지면
                                Button {
                                    withAnimation {
                                        isShipmentFolded.toggle()
                                    }
                                } label: {
                                    Text("저장")
                                        .font(.title3)
                                        .frame(width: 350, height: 70)
                                        .foregroundColor(.white)
                                        .background(isFormFilled ? Color.black : Color.gray.opacity(0.5))
                                        .cornerRadius(40)
                                        .padding()
                                }
                            }
                        }
                    }
                }.padding()
            }
                
                Divider()
                
            VStack {
                HStack {
      
                    if isPaymentFolded {
                        
                        Button {
                            withAnimation {
                                isPaymentFolded.toggle()
                            }
                        } label: {
                            Text("결제 수단")
                            
                            Spacer()
                            
                            if isPaymentTapped {
                                Text("선택")
                                    .foregroundColor(.red)
                            } else {
                                Text("실시간 계좌이체")
                            }
                            Image(systemName: "plus")
                            
                        }
                        .foregroundColor(.black)
                        
                    } else {
                        VStack {
                            Button {
                                withAnimation {
                                    isPaymentFolded.toggle()
                                }
                            } label: {
                                HStack {
                                    Text("결제 수단")
                                    
                                    Spacer()
                                    
                                    Image(systemName: "minus")
                                }
                                .foregroundColor(.black)
                            }
                            
                            HStack {
                                Button {
                                    isPaymentTapped.toggle()
                                } label: {
                                    if isPaymentTapped {
                                        Image(systemName: "circlebadge")
                                            .padding()
                                    } else {
                                        Image(systemName: "circlebadge.fill")
                                            .padding()
                                    }
                                }
                                .foregroundColor(.black)

                                
                                
                                Spacer()
                                
                                Text("실시간 계좌이체")
                                
                            }
                        }
                        
                    }
                    
                }
                .padding()
            }
                Divider()
            
            VStack {
                HStack {
                    
                    if isPriceFolded {
                        Button {
                            withAnimation {
                                isPriceFolded.toggle()
                            }
                        } label: {
                            Text("총 결제 금액")
                            
                            Spacer()
                            
                            Text("₩\(finalPrice)")
                                .foregroundColor(.gray)
                            Image(systemName: "plus")
                        }
                        .foregroundColor(.black)
                    } else {
                        VStack {
                            Button {
                                withAnimation {
                                    isPriceFolded.toggle()
                                }
                            } label: {
                                Text("총 결제 금액")
                                
                                Spacer()
                                
                                Text("₩\(finalPrice)")
                                    .foregroundColor(.gray)
                                Image(systemName: "minus")
                            }
                            .foregroundColor(.black)
                            
                            Divider()
                            
                            HStack {
                                Text("상품 금액")
                                Spacer()
                                Text("₩\(finalPrice)")
                            }
                            .foregroundColor(.gray)
                            .padding(.vertical)
                            
                            HStack {
                                Text("배송 옵션")
                                Spacer()
                                Text("무료배송")
                            }
                            .foregroundColor(.gray)
                            .padding(.vertical)
                            
                            Divider()
                            
                            VStack {
                                HStack {
                                    Text("합계")
                                    
                                    Spacer()
                                    
                                    Text("₩\(finalPrice)")
                                }
                            }
                            .padding()
                            
                            Divider()
                            
                            VStack {
                                HStack {
                                    Button {
                                        isArgreeTapped.toggle()
                                    } label: {
                                        if isArgreeTapped {
                                            Image(systemName: "square")
                                        } else {
                                            Image(systemName: "checkmark.square")
                                        }
                                    }
                                    .foregroundColor(.black)
                                    
                                    
                                    Text("'결제하기'을(를) 누르면 이용약관에 동의하게 됩니다.")
                                        .font(.caption)
                                    
                                    Spacer()
                                }
                                
                                Button {
                                    withAnimation {
                                        isPaymentTapped.toggle()
                                    }
                                } label: {
                                    Text("결제하기")
                                        .font(.title3)
                                        .frame(width: 350, height: 70)
                                        .foregroundColor(.white)
                                        .background(isArgreeTapped ?
                                                    Color.gray.opacity(0.3)
                                                    : Color.black)
                                        .cornerRadius(40)
                                        .padding()
                                }
                            }.padding()
                        }
                    }
                }
                .padding()
            }
                
                
            
            Spacer()
        }
        //        .navigationTitle("주문하기")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PaymentView(selectedQty: 3, finalPrice: "300000")
        }
    }
}
