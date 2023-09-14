//
//  AddressViewModel.swift
//  NikeShoes
//
//  Created by 이희찬 on 2023/09/07.
//

import Foundation
import Firebase
import NikeShoesCore

class AddressViewModel: ObservableObject {
    @Published var addresses: [AddressDTO] = [sample]
    
    private var db = Firestore.firestore()
    
    init() {
        fetchData()
    }
    
    func addAddress(address: AddressDTO) {
        do {
            if address.isDefault {
                if let currentDefault = addresses.first(where: { $0.isDefault }) {
                    var updatedAddress = currentDefault
                    updatedAddress.isDefault = false
                    try db.collection("addresses").document(currentDefault.id ?? "").setData(from: updatedAddress)
                }
            }
            let _ = try db.collection("user").document(Auth.auth().currentUser!.uid) .collection("addresses").addDocument(from: address)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func fetchData() {
        guard let userID = Auth.auth().currentUser?.uid else {
            print("No user ID available")
            return
        }
        
        db.collection("user").document(userID).collection("addresses").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.addresses = documents.compactMap { queryDocumentSnapshot in
                try? queryDocumentSnapshot.data(as: AddressDTO.self)
            }
        }
    }
    
    func updateAddress(address: AddressDTO) {
        guard let addressID = address.id else {
            print("No address ID available")
            return
        }

        do {
            try db.collection("user").document(Auth.auth().currentUser!.uid)
                .collection("addresses").document(addressID)
                .setData(from: address)
        } catch let error {
            print("Error updating address: \(error)")
        }
    }
    
    func setAsDefault(index: Int) {
        if addresses[index].isDefault {
            // 기존 기본 배송지 해제
            if let currentDefault = addresses.first(where: { $0.isDefault }) {
                var updatedAddress = currentDefault
                updatedAddress.isDefault = false
                updateAddress(address: updatedAddress)
            }
        }
        
        // 새로운 기본 배송지 설정
        updateAddress(address: addresses[index])
    }
    
}

let sample = AddressDTO(
    id: "12345",
    name: "나이키",
    city: "서울",
    district: "강남구",
    town: "삼성동",
    fullAddress: "서울특별시 강남구 삼성동 123-45",
    postalCode: "06164",
    phoneNumber: "010-1234-5678",
    country: "대한민국",
    isDefault: true
)
