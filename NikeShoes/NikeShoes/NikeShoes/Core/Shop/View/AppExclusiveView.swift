//
//  AppExclusiveView.swift
//  NikeShoes
//
//  Created by 최소정 on 2023/09/06.
//

import SwiftUI
import NikeShoesCore

struct AppExclusiveView: View {
    
    @EnvironmentObject var shoesDatas: ItemListViewModel
    
    var currentGender: String
    private var shoesArray: [ShoesDTO] {
        shoesDatas.shoes.filter {
            $0.speciality.contains(Speciality.onlyApp) && $0.category.contains(currentGender)}
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Text("이 주의 앱 전용 제품 🔒")
                    .font(Font.medium20)
                Group {
                    Text("매주 공개되는 앱 전용")
                    Text("제품을 만나보세요.")
                }
                .foregroundColor(.textGray)
                .font(Font.medium20)
            }
            .padding(1)
            .padding(.leading)
            
            // 가로 카테고리
            ScrollView(.horizontal) {
                LazyHStack {
                    
                    NavigationLink(destination: ItemListView()) {
                        VStack(alignment: .leading) {
                            AsyncImage(url: URL(string: "https://image-cdn.hypb.st/https%3A%2F%2Fhypebeast.com%2Fimage%2F2022%2F09%2Fnike-snkrs-air-force-1-low-korea-5th-anniversary-exclusive-access-dx3141-861-release-date-0.jpg?fit=max&cbr=1&q=90&w=750&h=500")) { image in
                                
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .clipped()
                            
                            HStack {
                                Text("앱 전용제품 전체 보기")
                                Image(systemName: "arrow.right.circle")
                            }
                            .foregroundColor(.black)
                            .font(Font.semiBold12)
                            .padding([.top, .leading], 10)
                            
                        }
                    }

                    ForEach(shoesArray) { item in
                        NavigationLink(destination: ProductDetailView(shoesData: item)) { // ItemListView로 이동

                            VStack(alignment: .leading) {
                                AsyncImage(url: URL(string:item.imageURLString.first!)) { image in
                                    
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 150, height: 150)
                                .clipped()
                                
                                Text(item.name.prefix(15))
                                    .allowsTightening(true)
                                    .truncationMode(.tail)
                                    .foregroundColor(.black)
                                    .font(Font.semiBold12)
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

//struct AppExclusiveView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationStack {
//            AppExclusiveView()
//                .frame(height: 350)
//
//        }
//    }
//}
