//
//  ItemListViewWithProgressbar.swift
//  NikeShoes
//
//  Created by 이승준 on 2023/09/12.
//

import SwiftUI
import NikeShoesCore

struct ItemListViewWithProgressbar: View {
    
    // 화면 전환을 위한 환경 변수
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    // 그리드 레이아웃을 위한 컬럼 설정
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    // 좋아요 버튼의 상태를 관리
    @State var isLiked: Bool = false
    
    // 현재 선택된 탭
    @State private var selectedTab: String = "전체"
    
    // 프로그레스 바 위치 및 넓이
    @State private var progressBarOffset: CGFloat = 0
    @State private var progressBarWidth: CGFloat = 0
    
    // 탭 목록
    var tabs: [String] = ["전체", "조던", "덩크", "코르테즈", "에어 포스 1"]
    
    // ViewModel을 관찰 (ObservedObject)
    @ObservedObject var viewModel: ItemListViewModel = ItemListViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                TabBarView(tabs: tabs, selectedTab: $selectedTab, progressBarOffset: $progressBarOffset, progressBarWidth: $progressBarWidth)
                    .padding(.bottom, -23)
                
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.shoes.filter { selectedTab == "전체" ? true : $0.modelName == selectedTab }) { data in
                        NavigationLink(destination: ProductDetailView(shoesData: detailSample)) {
                            ZStack {
                                VStack(alignment: .leading) {
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
                                    // 텍스트 정보
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
                                    
                                    // 빈 뷰를 추가하여 상품간 높이 일정하게 유지
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
                        .frame(height: 300) // 상품간 높이를 조절
                    }
                }
                .padding()
            }
            // 네비게이션 바 설정
            .navigationTitle("앱 전용 제품")
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
        // 화면이 나타날 때 데이터 로드
        .onAppear {
            viewModel.action()
        }
    }
}

struct ItemListViewWithProgressbar_Previews: PreviewProvider {
    static var previews: some View {
        ItemListViewWithProgressbar()
    }
}
