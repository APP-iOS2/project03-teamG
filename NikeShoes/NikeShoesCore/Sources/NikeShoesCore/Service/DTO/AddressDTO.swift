//
//  AddressDTO.swift
//  NikeShoes
//
//  Created by 박형환 on 2023/09/10.
//

import Foundation
import FirebaseFirestoreSwift

public struct AddressDTO: Hashable, Codable {
    @DocumentID public var id: String?
    public var name: String
    public var city: String
    public var district: String
    public var town: String
    public var fullAddress: String
    public var postalCode: String
    public var phoneNumber: String
    public var country: String
    public var isDefault: Bool
    
    public init(id: String? = nil, name: String, city: String, district: String, town: String, fullAddress: String, postalCode: String, phoneNumber: String, country: String, isDefault: Bool) {
        self.id = id
        self.name = name
        self.city = city
        self.district = district
        self.town = town
        self.fullAddress = fullAddress
        self.postalCode = postalCode
        self.phoneNumber = phoneNumber
        self.country = country
        self.isDefault = isDefault
    }
}
