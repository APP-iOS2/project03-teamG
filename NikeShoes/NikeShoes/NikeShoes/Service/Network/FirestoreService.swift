//
//  Service.swift
//  NikeShoes
//
//  Created by 최소정 on 2023/09/05.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift


enum APIError: Error {
    case createError(Error)
    case decodingError(Error)
    case fetchingError(Error)
    case deleteError(Error)
    case updateFailed(Error)
}


protocol FirestoreService {
    func create<T: Codable>(send model: T, collection path: Path) async throws -> String
    func fetchAll<T: Codable>(collection path: Path, query type: APIQuery<Any>? ) async throws -> [T]
    func delete(collection path: Path, document id: DocumentRefID) async throws -> String
    func update(collection path: Path, document id: DocumentRefID, fields: [String: Any]) async throws
}


class DefaultFireStroeService: FirestoreService {
    
    //TODO: Sigle 톤으로 호출해서 사용할 것이냐, 주입해서 사용할 것이냐...
    
    let firestore = Firestore.firestore()
    
    init() { }
    
    func create<T: Codable>(send model: T,
                            collection path: Path) async throws -> String {
        try await withCheckedThrowingContinuation { continuation in
            create(send: model, collection: path) { result in
                switch result {
                case .success(_):
                    continuation.resume(returning: "Success Create")
                    
                case .failure(let failure):
                    continuation.resume(throwing: failure)
                }
            }
        }
    }
    
    func fetchAll<T: Codable>(collection path: Path,
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

    func delete(collection path: Path,
                document id: DocumentRefID) async throws -> String {
        try await withCheckedThrowingContinuation { continuation in
            delete(collection: path, document: id) { result in
                switch result {
                case .success(_):
                    continuation.resume(returning: "Success Delete")
                case .failure(let failure):
                    continuation.resume(throwing: failure)
                }
            }
        }
    }
    
    func update(collection path: Path,
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
    
    private func create<T: Codable>(send model: T,
                                    collection path: Path,
                                    _ completion: @escaping (Result<Void, Error>) -> Void) {
        do {
            try firestore
                .collection(path)  // self.collection(collection.path)
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
    
}
