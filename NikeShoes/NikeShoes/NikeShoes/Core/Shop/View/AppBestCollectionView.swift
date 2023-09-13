//
//  AppBestCollectionView.swift
//  NikeShoes
//
//  Created by 여성은 on 2023/09/05.
///

import SwiftUI
import NikeShoesCore

// 컬렉션 정보를 담을 구조체
struct CollectionInfo {
    let title: String
    let imageURL: String
    let speciality: Speciality?
    let navigationTitle: String
}

struct AppBestCollectionView: View {
    // 샘플 컬렉션 데이터
    var sampleCollections: [CollectionInfo] = [
        CollectionInfo(title: "앱 전용 제품", imageURL: "https://static.nike.com/a/images/f_auto/dpr_1.7,cs_srgb/w_827,c_limit/0a286516-b1a3-4a3d-975f-170b7b8a7a50/nike-just-do-it.jpg", speciality: .onlyApp, navigationTitle: "앱 전용 제품"),
        CollectionInfo(title: "신제품", imageURL: "https://static.nike.com/a/images/f_auto/dpr_1.7,cs_srgb/w_827,c_limit/de43c365-10d2-41c9-89ba-7ed7cbcdb817/nike-just-do-it.jpg", speciality: .newProduct, navigationTitle: "신제품"),
        CollectionInfo(title: "이번 주 베스트", imageURL: "https://static.nike.com/a/images/f_auto/dpr_1.7,cs_srgb/w_827,c_limit/30dc6933-29ef-4973-a3f5-947e9f23a122/nike-just-do-it.jpg", speciality: .hot, navigationTitle: "이번 주 베스트"),
        CollectionInfo(title: "전체 제품 보기", imageURL: "https://static.nike.com/a/images/w_960,c_limit,f_auto/e2330902-f398-4559-95c1-405cdef9fc66/get-%E2%80%98em-while-you-can.jpg", speciality: nil, navigationTitle: "전체 제품 보기")
    ]
    
    var currentGender: String
    
    init(currentGender: String) {
        self.currentGender = currentGender
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("나이키 앱 베스트 컬렉션")
                .font(.headline)
                .padding(.leading, 20)
            
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(sampleCollections, id: \.title) { collection in
                        NavigationLink(
                            destination: ItemListViewWithProgressbar(
                                speciality: collection.speciality,
                                modelName: nil,
                                navigationTitle: collection.navigationTitle,
                                currentGender: currentGender
                            )
                        ) {
                            VStack(alignment: .leading) {
                                AsyncImage(url: URL(string: collection.imageURL)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 150, height: 150)
                                .cornerRadius(15)
                                
                                Text("\(collection.title)")
                                    .foregroundColor(.black)
                                    .font(.subheadline)
                                    .padding([.top, .leading], 10)
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .padding([.top, .bottom], 20)
    }
}

struct AppBestCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AppBestCollectionView(currentGender: "남성")
                .frame(height: 280)
        }
    }
}
