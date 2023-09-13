//
//  AddAddressView.swift
//  NikeShoes
//
//  Created by 이희찬 on 2023/09/07.
//

import SwiftUI
import NikeShoesCore

struct AddAddressView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: AddressViewModel

    @State private var name = ""
    @State private var city = ""
    @State private var district = ""
    @State private var town = ""
    @State private var fullAddress = ""
    @State private var postalCode = ""
    @State private var phoneNumber = ""
    @State private var country = ""
    @State private var isDefault = false
    
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Personal Details")) {
                    TextField("이름", text: $name)
                    TextField("전화번호", text: $phoneNumber)
                }
                
                Section(header: Text("Address")) {
                    TextField("시", text: $city)
                    TextField("구", text: $district)
                    TextField("동", text: $town)
                    TextField("상세주소", text: $fullAddress)
                    TextField("우편번호", text: $postalCode)
                    TextField("국가", text: $country)
                }
                
                Section {
                    Toggle(isOn: $isDefault) {
                        Text("기본 배송지")
                    }
                }
            }
            
            CustomButton(
                background: .black,
                foregroundColor: .white,
                title: "Save Address",
                action: validateAndSaveAddress
            )
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Invalid Input"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
        .navigationTitle("Add New Address")
    }
    
    func validateAndSaveAddress() {
            if name.isEmpty || city.isEmpty || district.isEmpty || town.isEmpty || fullAddress.isEmpty || postalCode.isEmpty || phoneNumber.isEmpty || country.isEmpty {
                alertMessage = "정보를 모두 입력하세요."
                showAlert = true
                return
            }

            let newAddress = AddressDTO(
                name: name,
                city: city,
                district: district,
                town: town,
                fullAddress: fullAddress,
                postalCode: postalCode,
                phoneNumber: phoneNumber,
                country: country,
                isDefault: isDefault
            )
            viewModel.addAddress(address: newAddress)
            presentationMode.wrappedValue.dismiss()
        }
}

struct AddAddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddAddressView(viewModel: AddressViewModel())
    }
}
