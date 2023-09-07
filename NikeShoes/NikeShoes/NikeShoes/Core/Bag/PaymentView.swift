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
                    Text("배송")
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("배송지 선택")
                            .foregroundColor(.red)
                        Image(systemName: "plus")
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
