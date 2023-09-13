//
//  UserMapView.swift
//  NikeShoes
//
//  Created by 안지영 on 2023/09/05.
//

import SwiftUI
import MapKit

struct UserMapView: View {
    
    @ObservedObject private var storeModel = StoreModel()
    @StateObject private var viewModel = MapViewModel()
    
    @Binding var isShowingMapSheet: Bool
    
    @State private var isShowingDetailSheet: Bool = false
    @State private var trackingMode = MapUserTrackingMode.follow
    @State var selectedStore = StoreData(name: "나이키 롯데 동탄",
                                         district: "경기도",
                                         city: "화성시",
                                         detailAddress: "동탄역로 160 롯데백화점 동탄점 5층",
                                         locationCoordinates: [37.20074, 127.09805],
                                         storePhoneNumber: "+82 31 8036 3871",
                                         openingTime: "오전 10시 30분",
                                         terminatedTime: "오후 8시",
                                         imageURLString: "https://static.nike.com/a/images/t_default/2e8d9338-b43d-4ef5-96e1-7fdcfd838f8e/image.jpg",
                                         now: Date())
    
    var body: some View {
        NavigationStack {
            VStack {
                let stores = storeModel.stores
                Map(coordinateRegion: $viewModel.region, showsUserLocation: true, userTrackingMode: $trackingMode, annotationItems: stores) { store in
                    MapAnnotation(coordinate: CLLocationCoordinate2D(
                        latitude: store.locationCoordinates[0],
                        longitude: store.locationCoordinates[1])) {
                            Image("marker").resizable()
                                .frame(width: 40, height: 40)
                                .scaleEffect(selectedStore == store ? 1.8 : 1.0)
                                .onTapGesture {
                                    // 지도에서 자연스럽게 이동하기
                                    withAnimation {
                                        selectedStore = store
                                        viewModel.region.center = CLLocationCoordinate2D(
                                            latitude: selectedStore.locationCoordinates[0],
                                            longitude: selectedStore.locationCoordinates[1])
                                        isShowingDetailSheet.toggle()
                                    }
                                }
                        }
                }
                .onAppear {
                    viewModel.region.center = CLLocationCoordinate2D(latitude: stores.first?.locationCoordinates[0] ?? 0, longitude: stores.first?.locationCoordinates[1] ?? 0)
                    // 실기기에서는 위에 코드 주석하고 아래 코드 살리기!!
                    // viewModel.checkLocationServicesIsEnabled()
                }
            }
            .navigationTitle("근처매장")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $isShowingDetailSheet) {
                GeometryReader { geometry in
                    if geometry.size.height < 300 {
                        MapDetailSheetView(selectedStore: selectedStore, isShowingDetailSheet: $isShowingDetailSheet)
                    } else {
                        StoreDetailView(store: selectedStore)
                    }
                }
                .presentationDetents([.fraction(0.3), .large])
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        isShowingMapSheet = false
                    } label: {
                        Text("닫기")
                    }
                    
                }
            }
        }
        
    }
}

struct UserMapView_Previews: PreviewProvider {
    static var previews: some View {
        UserMapView(isShowingMapSheet: .constant(false))
    }
}
