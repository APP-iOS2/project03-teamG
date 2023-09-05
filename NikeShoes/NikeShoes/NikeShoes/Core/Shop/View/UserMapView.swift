//
//  UserMapView.swift
//  NikeShoes
//
//  Created by 안지영 on 2023/09/05.
//

import SwiftUI
import MapKit

struct UserMapView: View {
    
    @StateObject private var viewModel = ContentViewModel()
    @Binding var isShowingMapSheet: Bool
    
    var body: some View {
        NavigationStack {
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                .accentColor(.pink)
                .onAppear {
                    viewModel.checkLocationServicesIsEnabled()
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

class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.5718, longitude: 126.9769),
                                               span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
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
    
    struct UserMapView_Previews: PreviewProvider {
        static var previews: some View {
            UserMapView(isShowingMapSheet: .constant(false))
        }
    }
}
