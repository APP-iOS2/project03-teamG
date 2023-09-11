//
//  ManageDelivery.swift
//  NikeShoes
//
//  Created by 이희찬 on 2023/09/05.
//

import SwiftUI

struct ManageAddress: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var addressviewModel: AddressViewModel = AddressViewModel()
    
    @State private var navigateToEmptyView: Bool = false
    
    let title: String
    
    var body: some View {
        VStack {
            ForEach(addressviewModel.addresses.indices, id: \.self) { index in
                AddressRow(viewModel: addressviewModel, index: index)
            }
            
            Spacer()
            
            NavigationLink(destination: AddAddressView(addressViewModel: addressviewModel)) {
                Text("배송지 추가")
                    .font(.system(size: 18))
                    .frame(width: 351, height: 63)
                    .background(.black)
                    .foregroundColor(.white)
                    .cornerRadius(31.5)
            }
            
        }
        .modifier(NavigationNikeSetting(title: title))
        .onAppear() {
            addressviewModel.fetchData()
        }
    }
}

struct ManageAddress_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ManageAddress(title: "배송지 관리")
        }
    }
}

struct AddressRow: View {
    @ObservedObject var viewModel: AddressViewModel
    let index: Int
    
    var body: some View {
        HStack {
            Button {
                // 기본 배송지 변경
            } label: {
                HStack {
                    Image(systemName: viewModel.addresses[index].isDefault ? "checkmark.square" : "square")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .fontWeight(Font.Weight.thin)
                        .foregroundColor(.black)
                    
                    // 배달 정보
                    VStack {
                        AddressText(text: viewModel.addresses[index].name)
                        AddressText(text: viewModel.addresses[index].city)
                        AddressText(text: viewModel.addresses[index].district)
                        AddressText(text: viewModel.addresses[index].postalCode)
                        AddressText(text: viewModel.addresses[index].phoneNumber)
                        AddressText(text: viewModel.addresses[index].country)
                    }
                    .padding(20)
                }
            }
            
            Spacer()
            
            // edit button
            NavigationLink(destination: AddressEditView(title: "배송지 관리", viewModel: viewModel, index: index)) {
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
