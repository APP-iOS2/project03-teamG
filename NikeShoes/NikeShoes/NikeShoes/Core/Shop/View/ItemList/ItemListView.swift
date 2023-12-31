//
//  ItemListView.swift
//  NikeShoes
//
//  Created by 여성은 on 2023/09/05.
//

import SwiftUI
import NikeShoesCore

// 상품 목록을 표시하는 뷰
struct ItemListView: View {
    
    // 뒤로 가기 버튼의 작동을 관리하기 위한 변수
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    // 그리드 레이아웃을 위한 컬럼 설정
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    // MARK: 파이어베이스에서 받아온 내용이 반영되어야 하는 변수
    // 네비게이션 타이틀 변수 (현재는 보류)
    
    // 신발 리스트
    @EnvironmentObject var itemListViewModel: ItemListViewModel
    
    @EnvironmentObject var wishListViewModel: WishListViewModel
    
    // 좋아요 버튼의 상태를 관리하는 변수
    @State var isLiked: Bool = false
    
    // 뷰 본문
    var body: some View {
        NavigationStack {
            ScrollView {
                // 상품 목록을 그리드로 표시
                LazyVGrid(columns: columns) {
                    // 선택된 탭에 따라 상품을 필터링
                   
                    ForEach(Array(zip(itemListViewModel.shoes.indices, itemListViewModel.shoes)), id: \.0) { index, data in
                        
                        // 각 상품을 누르면 ProductDetailView로 이동
                        NavigationLink(destination: ProductDetailView(shoesData: data)) {
                            ZStack {
                                VStack(alignment: .leading) {
                                    // 상품 이미지
                                    AsyncImage(url: URL(string: "\(data.imageURLString[0])")) { image in
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
                                }
                                
                                // 좋아요 버튼
                                Button {
                                    itemListViewModel.liked[index].toggle()
                                    Task {
                                        do {
                                            itemListViewModel.liked[index]
                                            ?
                                            try await wishListViewModel.likeUpdate(shoes: data.toLike())
                                            :
                                            try await wishListViewModel.unLikeShoes(shoes: data.toLike())
                                        } catch {
                                            Log.debug("BuyWishlistButtonView Error ❌")
                                            itemListViewModel.liked[index].toggle()
                                        }
                                    }
                                } label: {
                                    Circle()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.white)
                                        .overlay(
                                            Image(systemName: itemListViewModel.liked[index] ? "heart.fill" : "heart")
                                                .foregroundColor(itemListViewModel.liked[index] ? .red : .gray)
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
