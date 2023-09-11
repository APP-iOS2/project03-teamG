//
//  AddressDTO.swift
//  NikeShoes
//
//  Created by 박형환 on 2023/09/10.
//

import Foundation
import FirebaseFirestoreSwift

struct AddressDTO: Hashable, Codable {
    @DocumentID var id: String?
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
