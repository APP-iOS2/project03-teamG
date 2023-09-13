//
//  ProductDetailView.swift
//  NikeShoes
//
//  Created by 전민돌 on 9/5/23.
//

import SwiftUI
import NikeShoesCore

struct ProductDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedImageIndex = 0
    var shoesData: ShoesDTO
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // 현재 선택된 이미지 표시
                ZStack {
                    Color.lightGray
                        .frame(height: 500)
                    
                    TabView(selection: $selectedImageIndex) {
                        ForEach(0..<shoesData.imageURLString.count, id: \.self) { index in
                            AsyncImage(url: URL(string: shoesData.imageURLString[index])) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .tag(index)
                            } placeholder: {
                                ProgressView()
                            }
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .frame(height: 500)
                }
                
                VStack(alignment: .leading) {
                    // 이미지 슬라이더
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(0..<shoesData.imageURLString.count, id: \.self) { index in
                                ZStack {
                                    AsyncImage(url: URL(string: shoesData.imageURLString[index])) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 200, height: 200)
                                            .clipped()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .onTapGesture {
                                        // 이미지를 탭하면 선택된 이미지를 업데이트
                                        selectedImageIndex = index
                                    }
                                    
                                    Rectangle()
                                        .fill(Color.black.opacity(index == selectedImageIndex ? 0.2 : 0))
                                }
                            }
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Group {
                            Text("\(shoesData.category) 신발")
                                .padding(.bottom, 5)
                            
                            Text(shoesData.name)
                                .font(.mediumBold24)
                                .padding(.bottom, 25)
                            
                            Text("₩\(shoesData.price)")
                                .padding(.bottom, 25)
                            
                            Text(shoesData.description)
                                .font(.system(size: 16))
                                .lineSpacing(5)
                                .padding(.bottom, 28)
                            
                            Text("""
                            • 현재 컬러: 화이트/화이트
                            • 스타일: CW2288-111
                            • 제조 국가/지역: 중국, 인도, 베트남
                            """)
                            .font(.system(size: 16))
                            .lineSpacing(10)
                            .padding(.bottom, 32)
                        }
                        
                        NavigationLink {
                            ProductDetailInfoView(shoesData: shoesData)
                        } label: {
                            Text("상품 상세 정보 보기")
                                .foregroundColor(.textGray)
                        }
                        .padding(.bottom, 35)
                        
                        Group {
                            SizeButtonView(shoesData: shoesData)
                                .padding(.bottom, 8)
                            
                            CartButtonView()
                                .padding(.bottom, 8)
                            
                            BuyWishlistButtonView(data: shoesData)
                                .padding(.bottom, 35)
                        }
                        
                        Group {
                            DeliveryReturnInfoView()
                            
                            Divider()
                            
                            SizeTipButtonView()
                            
                            Divider()
                            
                            ReviewButtonView()
                            
                            Divider()
                            
                            MoreInfoButtonView()
                            
                            Divider()
                            
                            ShareButtonView()
                            
                            Divider()
                        }
                    }
                    .padding()
                    .padding(.bottom, 25)
                    
                    ProductPhotoView(shoesData: shoesData)
                    
                    StylingView()
                }
            }
            .navigationTitle(shoesData.name)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        SearchItemView()
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.black)
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(shoesData: detailSample)
    }
}
