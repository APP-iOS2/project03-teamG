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
    
    @State private var isFolded = true
    @State private var lastName: String = ""
    @State private var firstName: String = ""
    @State private var mobileNumber: String = ""
    @State private var address: String = ""
    
    var body: some View {
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
                    
                    if isFolded {
                        Button {
                            withAnimation {
                                isFolded.toggle()
                            }
                        } label: {
                            HStack {
                                Text("배송")
                                    .foregroundColor(.black)
                                
                                Spacer()
                                
                                Text("배송지 선택")
                                    .foregroundColor(.red)
                                Image(systemName: "plus")
                            }
                        }
                    } else {
                        //                        ZStack(alignment: .leading) {
                        VStack {
                            Button {
                                withAnimation {
                                    isFolded.toggle()
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
                                
                                //                                TextField("배송 주소", text: $mobileNumber)
                                //                                    .textFieldStyle(.roundedBorder)
                                //                                    .frame(width: 250)
                                //                                    .keyboardType(.numberPad)
                                
                                TextField("배송 주소", text: $address)
                                    .textFieldStyle(.roundedBorder)
                                
                                Button {
                                    
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 31.5)
                                            .stroke(Color.defaultGray, lineWidth: 1)
                                            .frame(width: 220, height: 60)
                                            .background(.white)

                                        Text("수동으로 입력하기")
                                            .foregroundColor(.black)
                                            .font(.system(size: 20))
                                            .fontWeight(.medium)
                                    }
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(.black)
                                .buttonBorderShape(.roundedRectangle)
                                
                                if lastName != "" && firstName != "" && mobileNumber != "" && address != "" {
                                    // 내용이 모두 채워지면
                                    Button {
                                        
                                    } label: {
                                        Text("저장")
                                            .font(.title3)
                                            .frame(width: 350, height: 70)
                                    }
                                    .foregroundColor(.white)
                                    .background(Color.black)
                                    .cornerRadius(40)
                                    .padding()
                                } else {
                                    Text("저장")
                                        .font(.title3)
                                        .frame(width: 350, height: 70)
                                        .foregroundColor(.white)
                                        .background(Color.gray)
                                        .cornerRadius(40)
                                        .padding()
                                }
                            }
                        }
                    }
                }.padding()
                
                Divider()
                
                HStack {
                    Text("결제 수단")
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("선택")
                            .foregroundColor(.red)
                        Image(systemName: "plus")
                    }
                }
                .padding()
                
                Divider()
                
                HStack {
                    Text("총 결제 금액")
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("₩\(finalPrice)")
                            .foregroundColor(.gray)
                        Image(systemName: "plus")
                    }
                }
                .padding()
                
                Divider()
                
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
