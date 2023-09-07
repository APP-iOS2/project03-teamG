//
//  ManageDelivery.swift
//  NikeShoes
//
//  Created by 이희찬 on 2023/09/05.
//

import SwiftUI

struct ManageAdress: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: AddressViewModel = AddressViewModel()
    
    let title: String
    
    var body: some View {
        VStack {
            ForEach(viewModel.addresses, id: \.self) { address in
                AddressRow(address: address, isChecked: $viewModel.isChecked)
            }
            
            Spacer()
            
            CustomButton(
                background: .black,
                foregroundColor: .white,
                title: "배송지 추가",
                action: {})
            
        }
        .modifier(NavigationNikeSetting(title: title))
    }
}

struct ManageAdress_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ManageAdress(title: "배송지 관리")
        }
    }
}

struct AddressRow: View {
    var address: Address
    @Binding var isChecked: Bool
    
    var body: some View {
        HStack {
            // 기본 배송지 여부
            Button {
                isChecked.toggle()
            } label: {
                HStack {
                    Image(systemName: isChecked ? "checkmark.square" : "square")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .fontWeight(Font.Weight.thin)
                        .foregroundColor(.black)
                    
                    // 배달 정보
                    VStack {
                        AddressText(text: address.name)
                        AddressText(text: address.city)
                        AddressText(text: address.district)
                        AddressText(text: address.postalCode)
                        AddressText(text: address.phoneNumber)
                        AddressText(text: address.country)
                    }
                    .padding(20)
                }
            }
            
            Spacer()
            
            // edit button
            NavigationLink(destination: AdressEditView(title: "배송지 관리")) {
                Text("수정")
                    .foregroundColor(.gray)
                    .padding()
            }
        }
    }
}

struct AddressText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(Font.caption)
            .foregroundColor(.black)
    }
}
