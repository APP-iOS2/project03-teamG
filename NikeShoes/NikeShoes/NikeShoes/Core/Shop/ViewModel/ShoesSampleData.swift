//
//  ShoesSampleData.swift
//  NikeShoes
//
//  Created by 최소정 on 2023/09/05.
//

/*
 상품명
 카테고리 (남성/여성/키즈)
 모델명 (조던/에어포스1/덩크/코르테즈)
 가격
 사이즈 (배열?)
 이미지
 설명
 */

import Foundation
import NikeShoesCore

protocol ImageURL {
    var imageURLString: String { get set }
    var imageURL: URL { get }
}


struct Shoes: Identifiable, ImageURL, Hashable {

    let id: UUID = UUID()
    var name: String
    var category: Gender
    var modelName: ModelName
    var price: Int
    var size: [Int]
    var description: String
    var imageURLString: String
    var like: Bool
    
    var imageURL: URL {
        get {
            return URL(string: imageURLString)!
        }
    }
}


let ShoesSampleData: [Shoes] = [
    
    Shoes(name: "에어 조던 1 미드",
          category: .male,
          modelName: .jordan,
          price: 159000,
          size: [250, 255, 260, 265, 270, 275, 280, 285, 290, 295, 300, 305, 310],
          description: "오리지널 AJ1에서 영감을 받은 이 미드 탑 에디션은 모두가 사랑하는 아이코닉한 스타일을 유지하면서 다양한 색상과 산뜻한 가죽으로 독특한 개성을 표현합니다.",
          imageURLString: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/385588b7-b56c-4814-8d6c-b373e5530c5b/%EC%97%90%EC%96%B4-%EC%A1%B0%EB%8D%98-1-%EB%AF%B8%EB%93%9C-%EC%8B%A0%EB%B0%9C-AEOS7OZl.png",
          like: true
          ),
   
    Shoes(name: "나이키 에어 포스 1 '07",
          category: .male,
          modelName: .airForce,
          price: 139000,
          size: [240, 245, 250, 255, 260, 265, 270, 275, 280, 285, 290, 295, 300, 305, 310],
          description: "빛이 그대로 살아 있는 나이키 에어 포스 1 ’07은 OG 농구화로서 많은 사랑을 받아온 디자인에 새로운 멋을 더했습니다.튼튼하게 스티치 처리된 오버레이와 깔끔한 마감 처리, 과하지 않은 절제된 화려함으로 빛나는 존재감을 발휘해 보세요.",
          imageURLString: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b7d9211c-26e7-431a-ac24-b0540fb3c00f/air-force-1-07-mens-shoes-jBrhbr.png",
          like: true),
    
    Shoes(name: "나이키 덩크 로우",
          category: .kids,
          modelName: .dunk,
          price: 119000,
          size: [225, 230, 235, 240, 245, 250],
          description: "농구 역사의 전설. 스케이트보딩계의 아이콘. 덩크는 수십 년간 다양한 스포츠 문화에서 많은 사랑을 받아왔습니다. 내구성 좋은 가죽 디자인에서 클래식한 형태와 착화감에 이르기까지, 새로운 세대의 마음을 사로잡을 80년대 감성의 신발을 재현했습니다.",
          imageURLString: "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/a3e7dead-1ad2-4c40-996d-93ebc9df0fca/%EB%8D%A9%ED%81%AC-%EB%A1%9C%EC%9A%B0-%EB%A0%88%ED%8A%B8%EB%A1%9C-%EB%82%A8%EC%84%B1-%EC%8B%A0%EB%B0%9C-bDdzzUjf.png",
          like: true),
    
    Shoes(name: "나이키 코르테즈 SE",
          category: .female,
          modelName: .cortez,
          price: 129000,
          size: [220, 225, 230, 235, 240, 245, 250, 255, 260],
          description: "코르테즈 SE가 아이코닉한 트랙 스타일을 밤에 어울리는 감각으로 재현했습니다. 산뜻한 가죽과 헤링본 밑창으로 완성된 이 제품은 많은 사랑을 받은 오리지널 제품과 동일한 디자인 라인이 적용되었습니다. 어둠 속에서 빛을 발하는 스우시 로고 덕에 밤이 되면 더욱 근사해지는 스페셜 에디션 스니커즈입니다.",
          imageURLString: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/25ce0133-30c9-448d-9ca9-600f4175fb7c/%EC%BD%94%EB%A5%B4%ED%85%8C%EC%A6%88-se-%EC%97%AC%EC%84%B1-%EC%8B%A0%EB%B0%9C-NrNRnFf1.png",
          like: true),
]
