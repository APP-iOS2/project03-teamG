//
//  ItemListView.swift
//  NikeShoes
//
//  Created by 여성은 on 2023/09/05.
//

import SwiftUI
import Foundation

// 상품 목록을 표시하는 뷰
struct ItemListView: View {
    
    // 뒤로 가기 버튼의 작동을 관리하기 위한 변수
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    // 그리드 레이아웃을 위한 컬럼
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    @State var isLiked: Bool = false
    
    // 현재 선택된 탭을 저장하는 변수
    @State private var selectedTab: String = "전체"
    
    // 프로그레스 바의 위치와 넓이를 저장하는 변수
    @State private var progressBarOffset: CGFloat = 0
    @State private var progressBarWidth: CGFloat = 0
    
    // 사용할 탭의 목록
    var tabs: [String] = ["전체", "조던", "덩크"]
    
    // 뷰 본문
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    
                    // 탭바
                    TabBarView(tabs: tabs, selectedTab: $selectedTab, progressBarOffset: $progressBarOffset, progressBarWidth: $progressBarWidth)
                        .padding(.bottom, 10)
                    
                    // 상품 목록 표시
                    LazyVGrid(columns: columns) {
                        ForEach(ShoesSampleData.filter { selectedTab == "전체" ? true : $0.modelName.rawValue == selectedTab }) { data in
                            // 각 상품에 대한 뷰
                            ZStack{
                                VStack(alignment: .leading) {
                                    AsyncImage(url: URL(string: "\(data.imageURLString)")) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(height: 180)
                                            .clipped()
                                    } placeholder: {
                                        Image("progress")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(height: 180)
                                            .clipped()
                                    }
                                    // 상품 정보 표시
                                    Group{
                                        Text("\(data.name)")
                                        Text("\(data.category.rawValue)")
                                            .foregroundColor(Color.gray)
                                        Text("₩\(data.price)")
                                    }
                                    .padding(0.3)
                                }
                                
                                // 좋아요 버튼
                                Button(action: {
                                    isLiked.toggle()
                                }) {
                                    Circle()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.white)
                                        .overlay(
                                            Image(systemName: isLiked ? "heart.fill" : "heart")
                                                .foregroundColor(isLiked ? .red : .gray)
                                        )
                                }
                                .offset(x: 65, y: -110)
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("신제품 어쩌고")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            // 네비게이션 바 아이템 설정
            .navigationBarItems(
                leading: Button(action: {
                    // 뒤로 가기 버튼 동작
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                },
                // 검색 아이콘을 네비게이션 바 오른쪽에 배치
                trailing: NavigationLink(destination: Text("Search View")) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.black)
                }
            )
        }
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ItemListView()
        }
    }
}
