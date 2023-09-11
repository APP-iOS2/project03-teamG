//
//  ProductDetailView.swift
//  NikeShoes
//
//  Created by 전민돌 on 9/5/23.
//

import SwiftUI

struct ProductDetailView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                AsyncImage(url: URL(string: ShoesSampleData[1].imageURLString)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        AsyncImage(url: URL(string: ShoesSampleData[1].imageURLString)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200, height: 200)
                        } placeholder: {
                            ProgressView()
                        }
                        .padding(.horizontal, -10)
                        AsyncImage(url: URL(string: ShoesSampleData[2].imageURLString)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200, height: 200)
                        } placeholder: {
                            ProgressView()
                        }
                        .padding(.horizontal, -10)
                    }
                    
                    .padding(.bottom)
                    
                    VStack(alignment: .leading) {
                        Group {
                            Text("\(ShoesSampleData[1].category.rawValue) 신발")
                                .padding(.bottom, 5)
                            
                            Text(ShoesSampleData[1].name)
                                .font(.mediumBold24)
                                .padding(.bottom, 25)
                            
                            Text("₩\(ShoesSampleData[1].price)")
                                .padding(.bottom, 25)
                            
                            Text(ShoesSampleData[1].description)
                                .font(.system(size: 16))
                                .lineSpacing(11)
                                .padding(.bottom, 28)
                            
                            Text("""
                            • 현재 컬러: 화이트/화이트
                            • 스타일: CW2288-111
                            • 제조 국가/지역: 중국, 인도, 베트남
                            """)
                            .font(.system(size: 16))
                            .lineSpacing(20)
                            .padding(.bottom, 32)
                        }

                        NavigationLink {
                            ProductDetailInfoView()
                        } label: {
                            Text("상품 상세 정보 보기")
                                .foregroundColor(.textGray)
                        }
                        .padding(.bottom, 35)
                        
                        Group {
                            SizeButtonView()
                                .padding(.bottom, 8)
                            
                            CartButtonView()
                                .padding(.bottom, 8)
                            
                            BuyWishlistButtonView()
                                .padding(.bottom, 35)
                        }
                        
                        Group {
                            DeliveryReturnInfoView()
                            
                            Divider()
                            
                            SizeTipButtonView()
                            
                            Divider()
                            
                            ReviewButton()
                            
                            Divider()
                            
                            MoreInfoButtonView()
                            
                            Divider()
                            
                            ShareButtonView()
                            
                            Divider()
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle(ShoesSampleData[1].name)
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
        ProductDetailView()
    }
}
