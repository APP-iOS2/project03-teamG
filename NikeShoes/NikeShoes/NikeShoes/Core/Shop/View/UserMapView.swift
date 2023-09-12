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
    
    @State private var trackingMode = MapUserTrackingMode.follow
    @State private var selectedStore = StoreData(name: "나이키 롯데 동탄", district: "경기도", city: "화성시", detailAddress: "동탄역로 160 롯데백화점 동탄점 5층", locationCoordinates: [37.20074, 127.09805], storePhoneNumber: "+82 31 8036 3871", openingTime: "오전 10시 30분", terminatedTime: "오후 8시", imageURLString: "https://static.nike.com/a/images/t_default/2e8d9338-b43d-4ef5-96e1-7fdcfd838f8e/image.jpg", now: Date())
    
    var body: some View {
        NavigationStack {
            VStack {
                let stores = storeModel.stores
                Map(coordinateRegion: $viewModel.region, showsUserLocation: true, userTrackingMode: $trackingMode, annotationItems: stores) { store in
                    MapMarker(coordinate: CLLocationCoordinate2D(latitude: store.locationCoordinates[0], longitude: store.locationCoordinates[1]))
                }
                .onAppear {
                    viewModel.region.center = CLLocationCoordinate2D(latitude: stores.first?.locationCoordinates[0] ?? 0, longitude: stores.first?.locationCoordinates[1] ?? 0)
                    //viewModel.checkLocationServicesIsEnabled()
                }
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

class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.20074, longitude: 127.09805),
                                               span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    var locationManager: CLLocationManager?
    
    func checkLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self // 강제언포싱 바꾸기
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            checkLocationAutorization()
        } else {
            print("Show an alert letting them know this is off and to go turn it on")
        }
    }
    
    private func checkLocationAutorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restricted likely due to parental controls.")
        case .denied:
            print("You have denied this app location permission. Go into settings to change it.")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location?.coordinate ?? CLLocationCoordinate2D(latitude: 37.5718, longitude: 126.9769), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAutorization()
    }
}

struct UserMapView_Previews: PreviewProvider {
    static var previews: some View {
        UserMapView(isShowingMapSheet: .constant(false))
    }
}
