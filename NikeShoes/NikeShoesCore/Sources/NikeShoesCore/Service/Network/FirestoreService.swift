//
//  Service.swift
//  NikeShoes
//
//  Created by 최소정 on 2023/09/05.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

public enum APIError: Error {
    case createError(Error)
    case createDocumentError(Error)
    case decodingError(Error)
    case fetchingError(Error)
    case deleteError(Error)
    case updateFailed(Error)
}

public protocol FirestoreService {
    
    
    /// DB에 데이터를 Create하는 함수
    /// - Parameters:
    ///   - model: DB에 저장할 모델, 반드시 Encodable protocol 을 implement 해야한다.
    ///   - path: API.path의 경로, 모델이 저장될 collection 경로
    /// - Returns: 결과 확인용 문자열
    func create<T: Encodable>(send model: T,
                              collection path: Path,
                              document id: DocumentRefID?,
                              collection2 path2: Path?) async throws -> String
    
    
    /// DB 에 특정 document ID로 document 생성하는 함수 입니다.
    /// - Parameters:
    ///   - model: 
    ///   - path: 가져올 데이터의 PATH, API.Path에 정의 되어있다.
    ///   - id: 저장할 Doucmnet의 id를 지정해준다. ex) 파이어베이스 유저에 있는 uid : User.uid
    func createDocument<T: Encodable>(send model: T,
                                      collection path: Path,
                                      document id: String) async throws -> Bool
    
    /// 전체 데이터를 가져오는 함수
    /// - Parameters:
    ///   - path: 가져올 데이터의 PATH, API.Path에 정의 되어있다.
    ///   - type:  API.APIQuery에 정의된 쿼리의 제약조건, ex) equal, not, in etc.... ,
    /// - Returns: 결과 데이터 배열
    func fetchAll<T: Decodable>(collection path: Path,
                                query type: APIQuery<Any>? ) async throws -> [T]
    
    /// 페이지 네이션 호출을 위한 함수
    /// - Parameters:
    ///   - path: 가져올 데이터의 PATH, API.Path에 정의 되어있다.
    ///   - count: 가져올 데이터의 갯수
    ///   - snapShot: 가져온 데이터의 마지막 페이지, 옵셔널 값으로 되어있고, nil 일경우 ex) 1~10,  nil 이 아니고 10번째의 snapShot을 보내준경우 ex) 11~20
    ///   - type: API.APIQuery에 정의된 쿼리의 제약조건, ex) equal, not, in etc.... ,
    /// - Returns: (데이터 배열과, 마지막 DocumentSnapshot) ... 마지막 documentSnapshot은 다음번 페이지 네이션 요청에 인자로 넣어준다.
    func fetchPagination<T: Decodable>(collection path: Path,
                                       limit count: Int,
                                       lastPage snapShot: DocumentSnapshot?,
                                       query type: APIQuery<Any>?) async throws -> ([T],DocumentSnapshot?)
    
    /// 특정 documentID를 삭제 하는 함수
    /// - Parameters:
    ///   - path: 삭제할 데이터의 PATH, API.Path에 정의 되어있다.
    ///   - id: 삭제할 모델의 DocumentID, DTO 모델의 ID를 인자로 넣어주면 된다.
    /// - Returns: 결과 확인용 문자열
    func delete(collection path: Path,
                document id: DocumentRefID) async throws
    
    /// 특정 documentID의 fields를 업데이트 하는 함수
    /// - Parameters:
    ///   - path: 업데이트할 데이터의 PATH, API.Path에 정의 되어있다.
    ///   - id: 업데이트할 모델의 DocumentID, DTO 모델의 ID를 인자로 넣어주면 된다.
    ///   - fields: 업데이트를 하고싶은 fields를 인자로 넘긴다.
    func update(collection path: Path,
                document id: DocumentRefID,
                fields: [String: Any]) async throws
    
    @available(iOS 13.0.0, *)
    func fetchAllDocumet<T: Decodable>(collection path: Path,
                                       documentid docId: String ) async throws -> T
}

public class DefaultFireStoreService: FirestoreService {
    
    // TODO: Sigle 톤으로 호출해서 사용할 것이냐, 주입해서 사용할 것이냐...
    
    let firestore = Firestore.firestore()
    
    public init() { }
    
    public func create<T: Encodable>(send model: T,
                                     collection path: Path,
                                     document id: DocumentRefID? = nil,
                                     collection2 path2: Path? = nil) async throws -> String {
        try await withCheckedThrowingContinuation { continuation in
            create(send: model,
                   collection: path,
                   document: id,
                   collection2: path2) { result in
                switch result {
                case .success(let value):
                    continuation.resume(returning: "Success Create \(value)")
                    
                case .failure(let failure):
                    continuation.resume(throwing: failure)
                }
            }
        }
    }
    
    public func createDocument<T: Encodable>(send model: T,
                                             collection path: Path,
                                             document id: String) async throws -> Bool {
        do {
            try await firestore
                .collection(path)
                .document(id)
                .setData(model.toDictionaryNotNil(), merge: true)
            return true
        } catch {
            throw APIError.createDocumentError(error)
        }
        return false
    }
    
    public func fetchPagination<T: Decodable>(collection path: Path,
                                              limit count: Int = 10,
                                              lastPage snapShot: DocumentSnapshot?,
                                              query type: APIQuery<Any>? ) async throws -> ([T],DocumentSnapshot?) {
        do {
            let documents = try await firestore
                .collection(path)
                .queryBuild(query: type)
                .pagination(document: snapShot)
                .limit(to: count)
                .getDocuments()
                .documents
            
            let resultData = documents.compactMap { try? $0.data(as: T.self) } as! [T]
            let lastDocument = documents.last
            return (resultData, lastDocument)
        } catch {
            throw APIError.fetchingError(error)
        }
    }
    
    public func fetchAll<T: Decodable>(collection path: Path,
                                       query type: APIQuery<Any>? ) async throws -> [T] {
        do {
            return try await firestore
                .collection(path)
                .queryBuild(query: type)
                .getDocuments()
                .documents
                .compactMap { try? $0.data(as: T.self) } as! [T]
        } catch {
            throw APIError.fetchingError(error)
        }
    }
    
    public func delete(collection path: Path,
                       document id: DocumentRefID) async throws {
        try await withCheckedThrowingContinuation { continuation in
            delete(collection: path, document: id) { result in
                switch result {
                case .success(_):
                    continuation.resume(returning: ())
                case .failure(let failure):
                    continuation.resume(throwing: failure)
                }
            }
        }
    }
    
    public func update(collection path: Path,
                       document id: DocumentRefID,
                       fields: [String: Any]) async throws {
        do {
            try await firestore
                .collection(path)
                .document(id)
                .updateData(fields)
        } catch {
            throw APIError.updateFailed(error)
        }
    }
    
    
    private func create<T: Encodable>(send model: T,
                                      collection path: Path,
                                      document id: DocumentRefID? = nil,
                                      collection2 path2: Path? = nil,
                                      _ completion: @escaping (Result<Void, Error>) -> Void) {
        
        do {
            try firestore
                .collection(path)  // self.collection(collection.path)
                .documentBuild(id, collection: path2)
                .addDocument(from: model) { error in
                    if let error {
                        completion(.failure(error))
                        return
                    }
                    completion(.success(()))
                }
        } catch {
            completion(.failure(APIError.decodingError(error)))
        }
    }
    
    private func delete(collection path: Path,
                        document id: DocumentRefID,
                        _ completion: @escaping (Result<Void, Error>) -> Void) {
        firestore
            .collection(path)    // self.collection(collection.path)
            .document(id)
            .delete { error in
                if let error {
                    completion(.failure(APIError.deleteError(error)))
                }
                completion(.success(()))
            }
    }
    
    
    public func fetchAllDocumet<T: Decodable>(collection path: Path,
                                              documentid id: String ) async throws -> T {
            do {
                let data =  try await firestore
                    .collection(path)
                    .document(id)
                    .getDocument()
                return try data.data(as: T.self)
            } catch {
                throw APIError.fetchingError(error)
            }
        }
}
