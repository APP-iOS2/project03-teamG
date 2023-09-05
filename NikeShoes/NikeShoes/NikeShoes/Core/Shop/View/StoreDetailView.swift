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
    
    var body: some View {
            ScrollView {
                AsyncImage(url: URL(string: "https://static.nike.com/a/images/t_default/2e8d9338-b43d-4ef5-96e1-7fdcfd838f8e/image.jpg")) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                VStack(alignment: .leading) {
                    Text(store.name)
                        .font(.system(size: 20)) // 글씨체 좀 더 키워야하나?
                        .bold()
                    Divider()
                    
                    HStack {
                        Text(store.address)
                        Spacer()
                        Button {
                            isShowingMap = true
                        } label: {
                            Image(systemName: "arrow.right.circle")
                                .font(.title2)
                        } // 버튼 따로두는건 어떤지..?
                    }
                    
                    Text(store.storePhoneNumber) // 전화 연결
                        .padding(.top)
                    
                    Divider()
                    Text("영업 시간 : \(store.openingTime) - \(store.terminatedTime)")
                }
                .padding()
                
                Image("storeImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
            }
            .navigationTitle("매장 상세 정보")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                    }
                    
                }
            }
            .sheet(isPresented: $isShowingMap) {
                MapView(store: store, isShowingMap: $isShowingMap)
            }
    }
}

struct ShopDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            StoreDetailView(store: StoreData(name: "나이키 롯데 동탄", address: "경기도 화성시 동탄역로 160 롯데백화점 동탄점 5층", locationCoordinates: [37.20074, 127.09805], storePhoneNumber: "+82 31 8036 3871", openingTime: "오전 10시", terminatedTime: "오후 8시"))
        }
    }
}
