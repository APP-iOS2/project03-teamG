//
//  ProductDetailView.swift
//  NikeShoes
//
//  Created by 전민돌 on 9/5/23.
//

import SwiftUI

struct ProductDetailView: View {
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
                        .padding(.horizontal, -20)
                        AsyncImage(url: URL(string: ShoesSampleData[2].imageURLString)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200, height: 200)
                        } placeholder: {
                            ProgressView()
                        }
                        .padding(.horizontal, -20)
                    }
                    
                    .padding(.bottom)
                    
                    VStack(alignment: .leading) {
                        Text("\(ShoesSampleData[1].category.rawValue) 신발")
                            .padding(.bottom, 5)
                        
                        Text(ShoesSampleData[1].name)
                            .font(.mediumBold24)
                            .padding(.bottom, 25)
                        
                        Text("₩\(ShoesSampleData[1].price)")
                            .padding(.bottom, 25)
                        
                        Text(ShoesSampleData[1].description)
                            .font(.system(size: 16))
                            .lineSpacing(13)
                            .padding(.bottom, 28)
                        
                        Text("""
                            • 현재 컬러: 화이트/화이트
                            • 스타일: CW2288-111
                            • 제조 국가/지역: 중국, 인도, 베트남
                            """)
                        .font(.system(size: 16))
                        .lineSpacing(20)
                        .padding(.bottom, 32)
                        
                        Button {
                            print("상품 상세 정보 보기")
                        } label: {
                            Text("상품 상세 정보 보기")
                                .foregroundColor(.textGray)
                        }
                        .padding(.bottom, 35)
                        
                        Button {
                            print("사이즈 선택")
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 31.5)
                                    .stroke(Color.defaultGray, lineWidth: 1)
                                    .frame(width: 351, height: 63)
                                    .background(.white)
                                
                                Text("사이즈 선택  \(Image(systemName: "chevron.down"))")
                                    .foregroundColor(.black)
                                    .font(.system(size: 18))
                                    .fontWeight(.medium)
                            }
                        }
                        
                        .padding(.bottom, 7)
                        
                        Button {
                            print("장바구니")
                        } label: {
                            ZStack {
                                Rectangle()
                                    .stroke(Color.black, lineWidth: 1)
                                    .frame(width: 351, height: 63)
                                    .background(.black)
                                    .cornerRadius(31.5)
                                
                                Text("장바구니")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18))
                                    .fontWeight(.medium)
                            }
                        }
                        
                        .padding(.bottom, 11)
                        
                        HStack {
                            Button {
                                print("구매하기")
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 31.5)
                                        .stroke(Color.defaultGray, lineWidth: 1)
                                        .frame(width: 170, height: 63)
                                        .background(.white)
                                    
                                    Text("구매하기")
                                        .foregroundColor(.black)
                                        .font(.system(size: 18))
                                        .fontWeight(.medium)
                                }
                            }
                            
                            .padding(.horizontal, 2)
                            
                            Button {
                                print("위시리스트")
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 31.5)
                                        .stroke(Color.defaultGray, lineWidth: 1)
                                        .frame(width: 170, height: 63)
                                        .background(.white)
                                    
                                    Text("\(Image(systemName: "heart"))")
                                        .foregroundColor(.black)
                                        .font(.system(size: 18))
                                        .fontWeight(.medium)
                                }
                            }
                        }
                        
                        .padding(.bottom, 35)
                        
                        Rectangle()
                            .stroke(Color.lightGray, lineWidth: 1)
                            .frame(width: 351, height: 100)
                            .background(Color.lightGray)
                            .padding(.bottom, 30)
                        
                        Divider()
                        
                        
                    }
                    .padding()
                }
                .toolbar {
                    ToolbarItem {
                        NavigationLink {
                            SearchItemView()
                        } label: {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.black)
                        }

                    }
                }
                .navigationTitle(ShoesSampleData[1].name)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
    }
}
