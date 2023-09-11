//
//  ReiviewDTO.swift
//  NikeShoes
//
//  Created by 박형환 on 2023/09/10.
//

import Foundation
import FirebaseFirestoreSwift

struct ReviewDTO: Codable {
    @DocumentID var id: String?
    let shoesID: String
    let starCount: Int // 모르겟어용...
    let title: String
    let content: String
    let date: Date
    // let image: String
}
