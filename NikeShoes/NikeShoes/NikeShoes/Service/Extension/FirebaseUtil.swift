//
//  FirebaseUtil.swift
//  NikeShoes
//
//  Created by 박형환 on 2023/09/10.
//

import Foundation
import FirebaseFirestore

typealias DocumentRefID = String

typealias APIQuery = API.APIQuery


extension Firestore {

    func documentBuild(_ document: DocumentRefID) -> DocumentReference {
        self.document(document)
    }
    
    func collection(_ collection: Path) -> CollectionReference {
        self.collection(collection.path)
    }
}

extension CollectionReference {
    
    func documentBuild(_ document: DocumentRefID) -> DocumentReference {
        self.document(document)
    }
}

extension CollectionReference {
    func queryBuild(query type: APIQuery<Any>?) -> Query {
        if let type {
            return type.queryBuild(query: self)
        } else {
            return self
        }
    }
}
