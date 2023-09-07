//
//  AddressViewModel.swift
//  NikeShoes
//
//  Created by 이희찬 on 2023/09/07.
//

import Foundation

class AddressViewModel: ObservableObject {
    @Published var addresses: [Address] = [sampleAddress]
    
    func addAddress(address: Address) {
         addresses.append(address)
     }
}

let sampleAddress = Address(
    name: "이희찬",
    city: "서울특별시",
    district: "강남구",
    town: "삼성동",
    fullAddress: "123-45",
    postalCode: "06164",
    phoneNumber: "010-1234-5678",
    country: "대한민국",
    isDefault: true
)
