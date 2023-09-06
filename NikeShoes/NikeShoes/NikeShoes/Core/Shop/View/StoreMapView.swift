//
//  MapView.swift
//  NikeShoes
//
//  Created by 안지영 on 2023/09/05.
//

import SwiftUI
import MapKit

struct Annotation: Identifiable {
    var id: UUID = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct StoreMapView: View {
    
    var store: StoreData
    
    @State var isChangedState: Bool = false
    @State var center = CLLocationCoordinate2D(latitude: 37.20074, longitude: 127.09805)
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.20074, longitude: 127.09805), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
    @Binding var isShowingMap: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                if isChangedState {
                    Map(coordinateRegion: $region,
                        annotationItems: [Annotation(coordinate: center)]) { annotation in
                        MapMarker(coordinate: annotation.coordinate)
                    }
                }
            }
            .navigationTitle("위치 확인")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button {
                        isShowingMap = false
                    } label: {
                        Text("닫기")
                    }
                    
                }
            }
            .onAppear {
                center = CLLocationCoordinate2D(latitude: store.locationCoordinates[0], longitude: store.locationCoordinates[1])
                region.center = CLLocationCoordinate2D(latitude: store.locationCoordinates[0], longitude: store.locationCoordinates[1])
                isChangedState = true
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        
        StoreMapView(store: StoreData(name: "나이키 롯데 동탄", district: "경기도", city: "화성시", detailAddress: "동탄역로 160 롯데백화점 동탄점 5층", locationCoordinates: [37.20074, 127.09805], storePhoneNumber: "+82 31 8036 3871", openingTime: "오전 10시 30분", terminatedTime: "오후 8시", imageURLString: "https://static.nike.com/a/images/t_default/2e8d9338-b43d-4ef5-96e1-7fdcfd838f8e/image.jpg"), isShowingMap: .constant(false))
    }
}
