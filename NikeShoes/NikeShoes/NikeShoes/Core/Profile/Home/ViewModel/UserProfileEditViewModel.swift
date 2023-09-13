//
//  UserProfileEditViewModel.swift
//  NikeShoes
//
//  Created by 김성준 on 2023/09/11.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import NikeShoesCore

final class UserProfileEditViewModel: ObservableObject {
    @Published var userData: UserDTO? = sampleData
    let service: FirestoreService
    
    init(service: FirestoreService = DefaultFireStoreService()) {
        self.service = service
    }
    
    func updateUserData(firstName: String, lastName: String, activityArea: String, introContent: String) {
        guard var userData else {
            return
        }
        userData.firstName = firstName
        userData.lastName = lastName
        userData.activityArea = activityArea
        userData.introContent = introContent
        
        self.userData = userData
    }
    
    @MainActor
    func fetchUserData() async throws {
        do {
            let values: [UserDTO] = try await service.fetchAll(collection: .user, query: .equal("email", Auth.auth().currentUser?.email ?? ""))
            self.userData = values.first
        } catch {
            throw error
        }
    }
    
    func updateUserData() async throws {
        guard let userData else {
            return
        }
        do {
            try await service.update(collection: .user,
                                     document: userData.id ?? "",
                                     fields: [
                                        "firstName": userData.firstName,
                                        "lastName": userData.lastName,
                                        "activityArea": userData.activityArea ?? "",
                                        "introContent": userData.introContent ?? ""
                                     ])
//            try await service.update(collection: .user, document: userData.id ?? "", fields: ["address": userData.address])
        } catch {
            print(#function, "firebase CRUD")
            throw error
        }
    }
}

extension UserProfileEditViewModel {
    static let sampleData: UserDTO =  UserDTO(firstName: "김",
                                              lastName: "성준",
                                              email: "tjdwns@naver.com",
                                              phoneNumber: "01091889188",
                                              dateOfBirth: "20230912",
                                              memberReward: "멤버리워드",
                                              address: [ AddressDTO(name: "나의 주소1",
                                                                    city: "하남시",
                                                                    district: "하남시 어디",
                                                                    town: "롯데",
                                                                    fullAddress: "하남시 하남시 어디",
                                                                    postalCode: "22312",
                                                                    phoneNumber: "01091889188",
                                                                    country: "한국",
                                                                    isDefault: true)],
                                              following: [Following(title: "남아",
                                                                    imageURL: "https://static.nike.com/a/images/f_auto,cs_srgb/w_1536,c_limit/78d4df4d-f803-40c6-8b41-2cface972373/image.jpg",
                                                                    isChecked: true)],
                                              size: [250, 255],
                                              activityArea: "경기도 하남시 어디",
                                              introContent: "자기소개입니다.")
}
