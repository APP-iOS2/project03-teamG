//
//  ManageDelivery.swift
//  NikeShoes
//
//  Created by 이희찬 on 2023/09/05.
//

import SwiftUI

struct ManageAdress: View {
    @Environment(\.presentationMode) var presentationMode
    
    let title: String
    
    @State private var isChecked: Bool = true
    
    var body: some View {
        VStack{
            
            HStack{
                //check button
                Button {
                    isChecked.toggle()
                } label: {
                    HStack {
                        Image(systemName: isChecked ? "checkmark.square" : "square")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .fontWeight(Font.Weight.thin)
                            .foregroundColor(.black)
                        //info
                        VStack{
                            Text("이름")
                                .font(Font.caption)
                                .foregroundColor(.black)
                            // adress
                            Text("시")
                                .font(Font.caption)
                                .foregroundColor(.black)
                            Text("구")
                                .font(Font.caption)
                                .foregroundColor(.black)
                            Text("동")
                                .font(Font.caption)
                                .foregroundColor(.black)
                            Text("주소")
                                .font(Font.caption)
                                .foregroundColor(.black)
                            Text("우편번호")
                                .font(Font.caption)
                                .foregroundColor(.black)
                            Text("전화번호")
                                .font(Font.caption)
                                .foregroundColor(.black)
                            Text("국가")
                                .font(Font.caption)
                                .foregroundColor(.black)
                            //기본 배송지 여부
                            Text("기본")
                                .font(Font.caption)
                                .foregroundColor(.black)
                        }
                        
                    }
                    .padding(20)
                }
                
                Spacer()
                
                //edit button
                NavigationLink(destination: AdressEditView(title: "배송지 관리")) {
                    Text("수정")
                        .foregroundColor(.gray)
                }
                
            }
            
            Spacer()
            
            // add button
            CustomButton(
                background: .black,
                foregroundColor: .white,
                title: "배송지 추가",
                action: {})
            
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                }
                .foregroundColor(.black)
            }
        }
        .navigationBarTitle(title, displayMode: .inline)
        .navigationBarBackButtonHidden()
    }
}

struct ManageAdress_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ManageAdress(title: "배송지 관리")
        }
    }
}
