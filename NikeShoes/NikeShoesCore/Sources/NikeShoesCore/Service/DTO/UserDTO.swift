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
    public var firstName: String
    public var lastName: String
    public var email: String
    public var phoneNumber: String
    public var dateOfBirth: String
    public var memberReward: String // 유저한테 주는 프로모션
    public var address: [AddressDTO]
    public var following: [Following] // 관심사
    public var size: [Int]
    public var activityArea : String //활동 지역(프로필 수정 뷰)
    public var introContent: String //자기소개(프로필 수정 뷰)
    
    public init(id: String? = nil, firstName: String, lastName: String, email: String, phoneNumber: String, dateOfBirth: String, memberReward: String, address: [AddressDTO], following: [Following], size: [Int], activityArea: String, introContent: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phoneNumber = phoneNumber
        self.dateOfBirth = dateOfBirth
        self.memberReward = memberReward
        self.address = address
        self.following = following
        self.size = size
        self.activityArea = activityArea
        self.introContent = introContent
    }
}
