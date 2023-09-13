//
//  FirebaseUtil.swift
//  NikeShoes
//
//  Created by 박형환 on 2023/09/10.
//

import Foundation
import FirebaseFirestore

public typealias DocumentRefID = String

public typealias APIQuery = API.APIQuery


public extension Firestore {
    func documentBuild(_ document: DocumentRefID) -> DocumentReference {
        self.document(document)
    }
    
    func collection(_ collection: Path) -> CollectionReference {
        self.collection(collection.path)
    }
}

public extension CollectionReference {
    
    func documentBuild(_ document: DocumentRefID?, collection: Path?) -> CollectionReference {
        if let document, let collection {
            return self.document(document).collection(collection.path)
        } else {
            return self
        }
    }
}

public extension CollectionReference {
    func queryBuild(query type: APIQuery<Any>?) -> Query {
        if let type {
            return type.queryBuild(query: self)
        } else {
            return self
        }
    }
}

extension Query {
    func pagination(document snapShot: DocumentSnapshot?) -> Query {
        if let snapShot {
            return self.start(afterDocument: snapShot)
        } else {
            return self
        }
    }
}
