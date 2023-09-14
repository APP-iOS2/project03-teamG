//
//  File.swift
//  
//
//  Created by 박형환 on 2023/09/12.
//

import Foundation
import FirebaseFirestoreSwift

public struct FollowingDTO: Identifiable, Codable {
    @DocumentID public var id: String?
    public var title: String
    public var imageURL: String

    public init(id: String? = nil, title: String, imageURL: String) {
        self.title = title
        self.imageURL = imageURL
    }
}
