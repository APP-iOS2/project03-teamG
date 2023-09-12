//
//  Location.swift
//  NikeShoes
//
//  Created by 안지영 on 2023/09/05.
//

import Foundation

struct StoreData: Identifiable, ImageURL {
    var id = UUID().uuidString
    var name: String
    // 서울특별시, 경기도, ...
    var district: String
    // 시,군,구
    var city: String
    // 상세주소
    var detailAddress: String
    var locationCoordinates: [Double]
    var storePhoneNumber: String
    var openingTime: String
    var terminatedTime: String
    var imageURLString: String
    var now: Date
    
    var imageURL: URL {
        URL(string: imageURLString)!
    }
    
    var operationTime: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_kr")
        dateFormatter.timeZone = TimeZone(abbreviation: "KST")
        dateFormatter.dateFormat = "a hh:mm"
        dateFormatter.amSymbol = "오전"
        dateFormatter.pmSymbol = "오후"
        return dateFormatter.string(from: now)
    }
}

// 뷰모델 파일 나누기
class StoreModel: ObservableObject {
    
    @Published var stores: [StoreData] = [
        StoreData(name: "나이키 롯데 동탄", district: "경기도", city: "화성시", detailAddress: "동탄역로 160 롯데백화점 동탄점 5층", locationCoordinates: [37.20074, 127.09805], storePhoneNumber: "+82 31-8036-3871", openingTime: "오전 10:30", terminatedTime: "오후 08:00", imageURLString: "https://static.nike.com/a/images/t_default/2e8d9338-b43d-4ef5-96e1-7fdcfd838f8e/image.jpg", now: Date()),
        StoreData(name: "나이키 유나이트 용인", district: "경기도", city: "용인시", detailAddress: "기흥구 신고매로124 롯데프리미엄아울렛", locationCoordinates: [37.22518, 127.12067], storePhoneNumber: "+82 31-8036-3029", openingTime: "오전 10:30", terminatedTime: "오후 09:00", imageURLString: "https://static.nike.com/a/images/f_auto/428e1194-21f3-434c-9730-40fd79ec602f/image.jpg", now: Date()),
        StoreData(name: "나이키 수원 망포", district: "경기도", city: "수원시", detailAddress: "영통구 덕영대로 1556번지 16 (영통동)", locationCoordinates: [37.24511, 127.05930], storePhoneNumber: "+82 31-203-1166", openingTime: "오전 10:30", terminatedTime: "오후 09:00", imageURLString: "https://static.nike.com/a/images/t_default/2e8d9338-b43d-4ef5-96e1-7fdcfd838f8e/image.jpg", now: Date()),
        StoreData(name: "나이키 송탄", district: "경기도", city: "평택시", detailAddress: "쇼핑로 23-2", locationCoordinates: [37.08114, 127.05209], storePhoneNumber: "+82 31-662-2376", openingTime: "오전 10:00", terminatedTime: "오후 10:00", imageURLString: "https://static.nike.com/a/images/t_default/2e8d9338-b43d-4ef5-96e1-7fdcfd838f8e/image.jpg", now: Date()),
        StoreData(name: "나이키 영통", district: "경기도", city: "용인시", detailAddress: "기흥구 중부대로 64 용인프리미엄 C동 1층", locationCoordinates: [37.26676, 127.07621], storePhoneNumber: "+82 31-204-3456", openingTime: "오전 10:00", terminatedTime: "오후 09:00", imageURLString: "https://static.nike.com/a/images/t_default/2e8d9338-b43d-4ef5-96e1-7fdcfd838f8e/image.jpg", now: Date()),
        StoreData(name: "나이키 AK 기흥", district: "경기도", city: "용인시", detailAddress: "기흥구 구갈동 234번지 AK기흥 1층 나이키", locationCoordinates: [37.27485, 127.11660], storePhoneNumber: "+82 31-5186-6577", openingTime: "오전 10:30", terminatedTime: "오후 10:00", imageURLString: "https://static.nike.com/a/images/t_default/2e8d9338-b43d-4ef5-96e1-7fdcfd838f8e/image.jpg", now: Date()),
        StoreData(name: "나이키 갤러리아 광교", district: "경기도", city: "수원시", detailAddress: "영통구 광교호수공원로 320", locationCoordinates: [37.28530, 127.05727], storePhoneNumber: "+82 31-5174-7706", openingTime: "오전 10:30", terminatedTime: "오후 08:00", imageURLString: "https://static.nike.com/a/images/t_default/2e8d9338-b43d-4ef5-96e1-7fdcfd838f8e/image.jpg", now: Date()),
        StoreData(name: "나이키 롯데 광교", district: "경기도", city: "수원시", detailAddress: "영통구 도청로 10 광교센트럴푸르지오시티 1층", locationCoordinates: [37.28658, 127.05553], storePhoneNumber: "+82 31-8064-2245", openingTime: "오전 11:00", terminatedTime: "오후 09:00", imageURLString: "https://static.nike.com/a/images/t_default/2e8d9338-b43d-4ef5-96e1-7fdcfd838f8e/image.jpg", now: Date()),
        StoreData(name: "나이키 롯데 수원", district: "경기도", city: "수원시", detailAddress: "권선구 세화로 134 롯데백화점수원점 5층", locationCoordinates: [37.26457, 126.99828], storePhoneNumber: "+82 31-8066-0532", openingTime: "오전 10:30", terminatedTime: "오후 08:00", imageURLString: "https://static.nike.com/a/images/t_default/2e8d9338-b43d-4ef5-96e1-7fdcfd838f8e/image.jpg", now: Date()),
        StoreData(name: "나이키 AK 수원", district: "경기도", city: "수원시", detailAddress: "팔달구 덕영대로 924 AK플라자 수원점 4층", locationCoordinates: [37.26633, 127.00029], storePhoneNumber: "+82 31-240-1483", openingTime: "오전 10:30", terminatedTime: "오후 10:00", imageURLString: "https://static.nike.com/a/images/t_default/2e8d9338-b43d-4ef5-96e1-7fdcfd838f8e/image.jpg", now: Date()),
    ]
    
    @Published var shoesInfo: [Shoes] = [
        Shoes(name: "에어 조던 1 미드",
              category: .male,
              modelName: .jordan,
              price: 159000,
              size: [250, 255, 260, 265, 270, 275, 280, 285, 290, 295, 300, 305, 310],
              description: "오리지널 AJ1에서 영감을 받은 이 미드 탑 에디션은 모두가 사랑하는 아이코닉한 스타일을 유지하면서 다양한 색상과 산뜻한 가죽으로 독특한 개성을 표현합니다.",
              imageURLString: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/385588b7-b56c-4814-8d6c-b373e5530c5b/%EC%97%90%EC%96%B4-%EC%A1%B0%EB%8D%98-1-%EB%AF%B8%EB%93%9C-%EC%8B%A0%EB%B0%9C-AEOS7OZl.png",
              like: true),
        
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
    
    func toggle(_ data: Shoes) { //좋아요를 토글해서 이미지로 반영되게 하는 방식
        for index in 0..<shoesInfo.count {
            if data.id == shoesInfo[index].id {
                shoesInfo[index].like.toggle()
            }
        }
    }
    
    func setToggle() { // like는 토글용이다.
        
    }
    
    func getSearchArray(searchText: String) -> [String] {
        let mapStores = stores.map { store in
            store.name
        }
        let filterStores = mapStores.filter { store in
            store.contains(searchText)
        }
        return filterStores
    }
}
