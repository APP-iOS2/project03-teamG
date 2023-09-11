//
//  UserDTO.swift
//  NikeShoes
//
//  Created by 박형환 on 2023/09/10.
//

import Foundation
import FirebaseFirestoreSwift

public struct UserDTO: Codable {
    @DocumentID public var id: String?
    public var email: String
    public var phoneNumber: String
    public var dateOfBirth: String
    public var memberReward: String // 유저한테 주는 프로모션
    public var name: String
    public var gender: [Gender] // 유저 팔로잉이랑 연결?
    public var address: [AddressDTO]
    public var interest: [String]
    public var size: [Int]
}
