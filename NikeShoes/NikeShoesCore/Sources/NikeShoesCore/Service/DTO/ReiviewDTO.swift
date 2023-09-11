//
//  ReiviewDTO.swift
//  NikeShoes
//
//  Created by 박형환 on 2023/09/10.
//

import Foundation
import FirebaseFirestoreSwift

public struct ReviewDTO: Codable {
    @DocumentID public var id: String?
    public let shoesID: String
    public let starRating: Int
    public let title: String
    public let content: String
    public let date: Date
}
