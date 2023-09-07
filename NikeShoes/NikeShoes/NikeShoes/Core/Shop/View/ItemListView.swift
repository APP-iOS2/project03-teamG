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
    
    // 그리드 레이아웃을 위한 컬럼 설정
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    // 좋아요 버튼의 상태를 관리하는 변수
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
                
                // 탭바 추가
                TabBarView(tabs: tabs, selectedTab: $selectedTab, progressBarOffset: $progressBarOffset, progressBarWidth: $progressBarWidth)
                    .padding(.bottom, -23)
                
                // 상품 목록을 그리드로 표시
                LazyVGrid(columns: columns) {
                    // 선택된 탭에 따라 상품을 필터링
                    ForEach(ShoesSampleData.filter { selectedTab == "전체" ? true : $0.modelName.rawValue == selectedTab }) { data in
                        
                        // 각 상품을 누르면 ProductDetailView로 이동
                        NavigationLink(destination: ProductDetailView()) {
                            ZStack {
                                VStack(alignment: .leading) {
                                    // 상품 이미지
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
                                    
                                    // 상품 정보
                                    Group {
                                        Text("\(data.name)")
                                            .foregroundColor(Color.black)
                                            .bold()
                                        Text("\(data.category.rawValue)")
                                            .foregroundColor(Color.textGray)
                                        Text("₩\(data.price)")
                                            .foregroundColor(Color.black)
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
                }
                .padding()
            }
            .navigationTitle("앱 전용 제품")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            
            // 네비게이션 바 아이템 설정
            .navigationBarItems(
                leading: Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                },
                // 검색 아이콘을 네비게이션 바 오른쪽에 배치
                trailing: NavigationLink(destination: SearchItemView()) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.black)
                }
            )
        }
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ItemListView()
        }
    }
}
