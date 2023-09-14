//
//  File.swift
//  
//
//  Created by 박형환 on 2023/09/12.
//

import Foundation
import FirebaseFirestoreSwift

extension Encodable {
    
    ///nil 인 필드 제외하고 생성
    func toDictionaryNotNil() -> [String: Any] {
        let mirror = Mirror(reflecting: self)
        var dictionary = [String: Any]()
        
        for (label, value) in mirror.children {
            if let label {
                if let _ = value as? DocumentID<String> {   //=> @DocumentID 프로퍼티래퍼 사용할때 필터해주기위해 사용했던 구문.
                    
                } else if !(Mirror(reflecting: value).displayStyle == .optional && Mirror(reflecting: value).children.isEmpty) {
                    dictionary[label] = value
                }
            }
        }
        return dictionary
    }
    
}
