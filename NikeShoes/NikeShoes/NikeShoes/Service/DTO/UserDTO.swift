//
//  UserDTO.swift
//  NikeShoes
//
//  Created by 박형환 on 2023/09/10.
//

import Foundation
import FirebaseFirestoreSwift

struct UserDTO: Codable {
    @DocumentID var id: String?
    let email: String
    let phoneNumber: String
    let dateOfBirth: String
    let memberReward: String // 유저한테 주는 프로모션
    let name: String
    let gender: String
    let address: [AddressDTO]
    let interest: [String]
        // let size: Int
}
