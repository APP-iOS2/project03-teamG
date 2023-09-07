//
//  Adress.swift
//  NikeShoes
//
//  Created by 이희찬 on 2023/09/07.
//

import Foundation

struct Address: Hashable {
    var name: String
    var city: String
    var district: String
    var town: String
    var fullAddress: String
    var postalCode: String
    var phoneNumber: String
    var country: String
    var isDefault: Bool
}
