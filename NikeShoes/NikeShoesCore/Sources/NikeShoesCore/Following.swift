//
//  File.swift
//  
//
//  Created by 김성준 on 2023/09/06.
//

import Foundation

public struct Following: Identifiable, Codable {
    public var id: UUID = UUID()
    public let title: String
    public let imageURL: String
    public var isChecked: Bool
    public var image: URL{
        URL(string: imageURL) ?? URL(string: "")!
    }
    
    public init(title: String, imageURL: String, isChecked: Bool) {
        self.title = title
        self.imageURL = imageURL
        self.isChecked = isChecked
    }
}

extension Following {
    public static var sample: [Following] = [
        Following(title: "여성", imageURL: "https://static.nike.com/a/images/f_auto,cs_srgb/w_1536,c_limit/78d4df4d-f803-40c6-8b41-2cface972373/image.jpg", isChecked: true),
        Following(title: "남성", imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSH1ZzKaQLfmdVu21LzzSoWS3kdhITFjjMFyw&usqp=CAU", isChecked: true),
        Following(title: "키즈", imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdrrG44ZqsHrJlOVTT2MhJONM2n1yGWf4rVA&usqp=CAU", isChecked: false)
        ]
}

