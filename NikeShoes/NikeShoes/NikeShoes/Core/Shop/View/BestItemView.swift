//
//  BestItemView.swift
//  NikeShoes
//
//  Created by 최소정 on 2023/09/06.
//

import SwiftUI
import NikeShoesCore

// 현재 날짜 몇월, 몇번째 주인지 Date extension
extension Date {
    func monthAndWeek() -> (Int, Int) {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.month, .weekOfMonth], from: self)
        if let month = components.month, let weekOfMonth = components.weekOfMonth {
            return (month, weekOfMonth)
        }
        return (0, 0)
    }
}

struct BestItemView: View {
    
    var currentGender: String
    
    var today: Date = Date()
    
    @EnvironmentObject private var shoesData: ItemListViewModel
    
    // ItemListViewModel에 ShoesDTO 배열이 있음. 거기서 filter를 걸어서 hot인 item만 가져오는거!
    private var shoesDataFilterHot: [ShoesDTO] {
        shoesData.shoes.filter { shoes in
            shoes.speciality.contains(.hot) && shoes.category.contains(currentGender)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                let (month, week) = today.monthAndWeek()
                Text("\(month)월 \(week)째주 베스트 아이템 🏅")
                Text("지난주 가장 사랑받은 나이키 제품")
                    .foregroundColor(.textGray)
                
            }
            .font(Font.medium20)
            .padding(1)
            .padding(.leading)
            
            // 가로 카테고리
            ScrollView(.horizontal) {
                LazyHStack {
                    
                    ForEach(shoesDataFilterHot) { item in
                        
                        NavigationLink(destination: ProductDetailView(shoesData: item)) { // ItemListView로 이동
                            
                            VStack(alignment: .leading) {
                                
                                AsyncImage(url: URL(string: item.imageURLString[0])) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 150, height: 150)
                                .clipped()
                                
                                Text(item.name)
                                    .foregroundColor(.black)
                                    .font(Font.semiBold12)
                                
                                    .padding([.top, .leading], 10)
                                
                            }
                        }
                    }
                    NavigationLink(destination: ItemListView()) {
                        VStack(alignment: .leading) {
                            AsyncImage(url: URL(string: "https://cdn-icons-png.flaticon.com/512/5553/5553769.png")) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .clipped()
                            
                            HStack {
                                Text("Top10 제품 보러가기")
                                Image(systemName: "arrow.right.circle")
                            }
                            .foregroundColor(.black)
                            .font(Font.semiBold12)
                            .padding([.top, .leading], 10)
                            
                        }
                    }
                }
                .padding()
            }
        }
        .padding([.top, .bottom], 20)
    }
}

struct BestItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            BestItemView(currentGender: "")
                .frame(height: 300)
        }
    }
}
