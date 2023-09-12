//
//  ShopDetailView.swift
//  NikeShoes
//
//  Created by 안지영 on 2023/09/05.
//

import SwiftUI

struct StoreDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var store: StoreData
    
    @State var isShowingMap = false
    @State var callingStore = false
    
    var body: some View {
        ScrollView {
            AsyncImage(url: store.imageURL) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading) {
                Text(store.name)
                    .font(Font.medium20) // 글씨체 좀 더 키워야하나?
                    .bold()
                Divider()
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(store.district)
                        Text(store.city)
                        Text(store.detailAddress)
                    }
                    Spacer()
                    
                    Link(destination: URL(string: "http://maps.apple.com/?ll=\(store.locationCoordinates[0]),\(store.locationCoordinates[1])")!) {
                        Image(systemName: "arrow.right.circle")
                            .font(Font.medium20)
                    }
                }
                
                Button {
                    callingStore = true
                } label: {
                    Text(store.storePhoneNumber) // 전화 연결
                        .padding(.top)
                }
                
                Divider()
                // 영업이 종료된 경우
                if store.operationTime > store.terminatedTime {
                    HStack {
                        Text("영업 종료")
                            .foregroundColor(.nikeRed)
                        Text("\(store.openingTime) - \(store.terminatedTime)")
                    }
                    // 영업시간일 경우
                } else if store.operationTime > store.openingTime {
                    HStack {
                        Text("영업 중")
                            .foregroundColor(.nikeGreen)
                        Text("\(store.openingTime) - \(store.terminatedTime)")
                    }
                    // 영업시작 전일 경우
                } else if store.operationTime < store.openingTime {
                    HStack {
                        Text("영업 전")
                            .foregroundColor(.nikeRed)
                        Text("\(store.openingTime) - \(store.terminatedTime)")
                    }
                }
            }
            .padding()
            
            Image("storeImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
        }
        .navigationTitle("매장 상세 정보")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        // back버튼
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                }
                
            }
        }
        // 매장 위치 보여주는 맵뷰 띄우는 sheet
        .sheet(isPresented: $isShowingMap) {
            StoreMapView(store: store, isShowingMap: $isShowingMap)
        }
        // 전화번호 누르면 나오는 dialog
        .confirmationDialog("매장 전화 연결", isPresented: $callingStore) {
            Button {
                touchUpCalling(phoneNumber: store.storePhoneNumber)
            } label: {
                Label("통화 \(store.storePhoneNumber)", systemImage: "phone.circle")
            }
        } message: {
            Text("매장 전화 연결")
        }
    }
    
    // 전화로 연결하는 함수
    func touchUpCalling(phoneNumber: String) {
        let url = "tel://\(phoneNumber)"
        
        if let openApp = URL(string: url), UIApplication.shared.canOpenURL(openApp) {
            // 버전별 처리
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(openApp, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(openApp)
            }
        }
        
        //외부앱 실행이 불가능한 경우
        else {
            print("[외부 앱 열기 실패]")
            print("주소 : \(url)")
        }
    }
    
}

struct ShopDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            StoreDetailView(store: StoreData(name: "나이키 롯데 동탄", district: "경기도", city: "화성시", detailAddress: "동탄역로 160 롯데백화점 동탄점 5층", locationCoordinates: [37.20074, 127.09805], storePhoneNumber: "+82 31 8036 3871", openingTime: "오전 10시 30분", terminatedTime: "오후 8시", imageURLString: "https://static.nike.com/a/images/t_default/2e8d9338-b43d-4ef5-96e1-7fdcfd838f8e/image.jpg", now: Date()))
        }
    }
}
