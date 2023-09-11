//
//  SampleViewModel.swift
//  NikeShoes
//
//  Created by 박형환 on 2023/09/11.
//

import Foundation
import NikeShoesCore


class SampleViewModel {
    
    
    let service: FirestoreService
    
    @Published var shoes: [Shoes] = []
    
    // 여러 필터 타입 정의 ???

    // 모델은 베이스로 정해놓음
    //
    // TODO: db path 정의해서 만들기
    //
    // TODO: Service 쪽 generic으로 만들기

    // TODO: ViewModel 만들기
    //
    // TODO: ViewModel -> View로 데이터 바인딩
    //
    // TODO: 전체 앱에서 공유할 객체 정하기?
    
    init(service: FirestoreService = DefaultFireStoreService()) {
        self.service = service
//        action()
    }
    
    func action() {
        Task {
            
            let delete = try await nike상품삭제()
            print("delete result: \(delete)")
            
            try await nike상품업데이트()
            
            let shoes = try await nike상품가져오기()
            print("shoes : \(shoes)")
            shoes.map {dto in print(dto.id) }
        }
    }
    
    // MARK: 정상 작동 완료
    func nike상품등록() async throws {
        do {
            // let create: String = try await service.create(send: value, collection: .shoes)
            // 성공
            // shoesDTO
        } catch {
            throw error
        }
    }
    
    // MARK: 정상 작동 완료
    func nike상품삭제() async throws -> String {
        let delete: String = try await service.delete(collection: .shoes, document: "9JUAiEuwVy5SghynkTkr")
        return delete
    }
    
    // MARK: 정상 작동 완료
    func nike상품가져오기() async throws -> [ShoesDTO] {
        let values: [ShoesDTO] = try await service.fetchAll(collection: .shoes, query: nil)
        return values
    }
    
    // MARK: 정상 작동 완료
    func nike상품업데이트() async throws {
        try await service.update(collection: .shoes, document: "KkBs1DGm79dd26UqUA9o", fields: [ "color": "mint" ])
    }
}

/*
struct SampleData {
    static let sample: [ShoesDTO] = [
        ShoesDTO(name: "에어 조던 1 미드",
                 category: .male,
                 modelName: .airForce ,
                 description: "오리지널 AJ1에서 영감을 받은 이 미드 탑 에디션은 모두가 사랑하는 아이코닉한 스타일을 유지하면서 다양한 색상과 산뜻한 가죽으로 독특한 개성을 표현합니다.",
                 price: 159000,
                 size: [250, 255, 260, 265, 270, 275, 280, 285, 290, 295, 300, 305, 310],
                 colors: ["black"],
                 imageURLString: ["imageURL"],
                 speciality: [.hot,.newProduct]
              ),
        ShoesDTO(name: "나이키 에어 포스 1 '07",
                 category: .male,
                 modelName: .airForce,
                 description: "빛이 그대로 살아 있는 나이키 에어 포스 1 ’07은 OG 농구화로서 많은 사랑을 받아온 디자인에 새로운 멋을 더했습니다.튼튼하게 스티치 처리된 오버레이와 깔끔한 마감 처리, 과하지 않은 절제된 화려함으로 빛나는 존재감을 발휘해 보세요.",
                 price: 159000,
                 size: [250, 255, 260, 265, 270, 275, 280, 285, 290, 295, 300, 305, 310],
                 colors: ["black"],
                 imageURLString: ["imageURL"],
                 speciality: [.hot,.newProduct]
                ),
        ShoesDTO(name: "나이키 덩크 로우",
                 category: .kids,
                 modelName: .dunk,
                 description: "농구 역사의 전설. 스케이트보딩계의 아이콘. 덩크는 수십 년간 다양한 스포츠 문화에서 많은 사랑을 받아왔습니다. 내구성 좋은 가죽 디자인에서 클래식한 형태와 착화감에 이르기까지, 새로운 세대의 마음을 사로잡을 80년대 감성의 신발을 재현했습니다.",
                 price: 159000,
                 size: [250, 255, 260, 265, 270, 275, 280, 285, 290, 295, 300, 305, 310],
                 colors: ["black"],
                 imageURLString: ["imageURL"],
                 speciality: [.hot,.newProduct]
                ),
        ShoesDTO(name: "나이키 코르테즈 SE",
                 category: .female,
                 modelName: .cortez,
                 description: "코르테즈 SE가 아이코닉한 트랙 스타일을 밤에 어울리는 감각으로 재현했습니다. 산뜻한 가죽과 헤링본 밑창으로 완성된 이 제품은 많은 사랑을 받은 오리지널 제품과 동일한 디자인 라인이 적용되었습니다. 어둠 속에서 빛을 발하는 스우시 로고 덕에 밤이 되면 더욱 근사해지는 스페셜 에디션 스니커즈입니다.",
                 price: 159000,
                 size: [250, 255, 260, 265, 270, 275, 280, 285, 290, 295, 300, 305, 310],
                 colors: ["black"],
                 imageURLString: ["imageURL"],
                 speciality: [.hot,.newProduct]
                )
    ]
}
*/
