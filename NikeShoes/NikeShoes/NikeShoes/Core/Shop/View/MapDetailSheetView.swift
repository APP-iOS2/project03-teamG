//
//  MapDetailSheetView.swift
//  NikeShoes
//
//  Created by 안지영 on 2023/09/13.
//

import SwiftUI

struct MapDetailSheetView: View {
    
    var selectedStore: StoreData
    @Binding var isShowingDetailSheet: Bool
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text(selectedStore.name)
                    .font(Font.mediumBold24)
                Divider()
                Text(selectedStore.district)
                Text(selectedStore.city)
                Text(selectedStore.detailAddress)
                Divider()
                if selectedStore.operationTime > selectedStore.terminatedTime {
                    HStack {
                        Text("영업 종료")
                            .foregroundColor(.nikeRed)
                        Text("\(selectedStore.openingTime) - \(selectedStore.terminatedTime)")
                    }
                    // 영업시간일 경우
                } else if selectedStore.operationTime > selectedStore.openingTime {
                    HStack {
                        Text("영업 중")
                            .foregroundColor(.nikeGreen)
                        Text("\(selectedStore.openingTime) - \(selectedStore.terminatedTime)")
                    }
                    // 영업시작 전일 경우
                } else if selectedStore.operationTime < selectedStore.openingTime {
                    HStack {
                        Text("영업 전")
                            .foregroundColor(.nikeRed)
                        Text("\(selectedStore.openingTime) - \(selectedStore.terminatedTime)")
                    }
                }
            }
            .padding([.bottom, .leading, .trailing])
            .toolbar {
                ToolbarItem {
                    Button {
                        isShowingDetailSheet = false
                    } label: {
                        Text("닫기")
                    }
                    
                }
            }
        }
    }
}

struct MapDetailSheetView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MapDetailSheetView(selectedStore: StoreData(name: "나이키 롯데 동탄",
                                                        district: "경기도",
                                                        city: "화성시",
                                                        detailAddress: "동탄역로 160 롯데백화점 동탄점 5층",
                                                        locationCoordinates: [37.20074, 127.09805],
                                                        storePhoneNumber: "+82 31 8036 3871",
                                                        openingTime: "오전 10시 30분",
                                                        terminatedTime: "오후 8시",
                                                        imageURLString: "https://static.nike.com/a/images/t_default/2e8d9338-b43d-4ef5-96e1-7fdcfd838f8e/image.jpg",
                                                        now: Date()),
                               isShowingDetailSheet: .constant(true))
        }
    }
}
