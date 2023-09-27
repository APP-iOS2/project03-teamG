//
//  ItemListViewWithProgressbar.swift
//  NikeShoes
//
//  Created by 이승준 on 2023/09/12.
///

import SwiftUI
import NikeShoesCore

struct ItemListViewWithProgressbar: View {
    
    // 컬렉션에 네비게이션 제목과 상품 필터 기능을 위한 변수
    var navigationTitle: String
    var speciality: Speciality?
    var currentGender: String
    var modelName: ModelName?
    var tabs: [String]
    
    // 초기화
    init(speciality: Speciality?, modelName: ModelName?, navigationTitle: String, currentGender: String, customTabs: [String]) {
        self.speciality = speciality
        self.modelName = modelName
        self.navigationTitle = navigationTitle
        self.currentGender = currentGender
        self.tabs = customTabs
    }
    
    // 환경 변수 설정
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    // 그리드 레이아웃을 위한 컬럼 설정
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    // 좋아요 버튼 상태
    @State var isLiked: Bool = false
    
    // 현재 선택된 탭
    @State private var selectedTab: String = "전체"
    
    // 프로그레스 바 위치 및 넓이
    @State private var progressBarOffset: CGFloat = 0
    @State private var progressBarWidth: CGFloat = 0
    
    // 탭 목록
    //    var tabs: [String] = ["전체", "조던", "덩크", "코르테즈", "에어 포스 1"]
    
    // ViewModel
    @EnvironmentObject var viewModel: ItemListViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // 탭바 뷰
                TabBarView(tabs: tabs, selectedTab: $selectedTab, progressBarOffset: $progressBarOffset, progressBarWidth: $progressBarWidth)
                    .padding(.bottom, -23)
                    .onAppear {
                        DispatchQueue.main.async { // 프로그래스 바의 초기 위치 잡기.
                            self.selectedTab = tabs.first ?? "전체"
                            self.progressBarOffset = 0
                            self.progressBarWidth = 30
                        }
                    }
                        
                        // 상품 그리드 뷰
                        LazyVGrid(columns: columns) {
                            ForEach(viewModel.shoes.filter {
                                // 성별에 따른 필터링
                                ($0.category == self.currentGender || self.currentGender == "공용") &&
                                // 특별한 속성에 따른 필터링
                                ($0.speciality.contains(self.speciality ?? .none) || self.speciality == nil || self.speciality == .allProducts) &&
                                // 모델 이름에 따른 필터링
                                ($0.modelName == self.modelName?.rawValue || self.modelName == nil) &&
                                // 선택된 탭에 따른 필터링
                                ($0.modelName == self.selectedTab || self.selectedTab == "전체")
                            }) { data in
                                // 상품 카드 뷰
                                NavigationLink(destination: ProductDetailView(shoesData: data)) {
                                    ZStack {
                                        VStack(alignment: .leading) {
                                            // 상품 이미지
                                            AsyncImage(url: URL(string: data.imageURLString.first ?? "")) { image in
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
                                                Text("\(data.category)")
                                                    .foregroundColor(Color.textGray)
                                                Text("₩\(data.price)")
                                                    .foregroundColor(Color.black)
                                            }
                                            .padding(0.3)
                                            
                                            Spacer()
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
                                        .offset(x: 60, y: -124)
                                    }
                                }
                                .frame(height: 300)
                            }
                        }
                        .padding()
                    }
                // 네비게이션 설정
                    .navigationTitle(navigationTitle)
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarItems(
                        leading: Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                        },
                        trailing: NavigationLink(destination: SearchItemView()) {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.black)
                        }
                    )
            }
        }
    }
    
    struct ItemListViewWithProgressbar_Previews: PreviewProvider {
        static var previews: some View {
            ItemListViewWithProgressbar(speciality: .onlyApp, modelName: nil, navigationTitle: "앱 전용 제품", currentGender: "남성", customTabs: ["전체", "에어맥스", "에어포스"])
            
        }
    }
