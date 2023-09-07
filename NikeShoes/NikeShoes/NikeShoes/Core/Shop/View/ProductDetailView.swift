//
//  ProductDetailView.swift
//  NikeShoes
//
//  Created by 전민돌 on 9/5/23.
//

import SwiftUI

struct ProductDetailView: View {
    @State private var isShowingSizeSheet = false
    @State private var isShowingSizeGuideSheet = false
    @State private var sizeTipToggle = false
    @State private var reviewToggle = false
    @State private var moreInfoToggle = false
    
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
                
                Group {
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
                            
                            Button {
                                isShowingSizeSheet.toggle()
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
                            .sheet(isPresented: $isShowingSizeSheet) {
                                SizeView()
                                    .presentationDetents([.medium, .medium])
                            }
                            
                            .padding(.bottom, 7)
                            
                            Button {
                                print("장바구니에 추가")
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
                            
                            Button {
                                sizeTipToggle.toggle()
                            } label: {
                                VStack(alignment: .leading) {
                                    if sizeTipToggle == false {
                                        HStack {
                                            Text("사이즈 & 팁")
                                            Spacer()
                                            Image(systemName: "chevron.down")
                                                .padding(.vertical, 28)
                                        }
                                    } else {
                                        HStack {
                                            Text("사이즈 & 팁")
                                            Spacer()
                                            Image(systemName: "chevron.up")
                                                .padding(.vertical, 28)
                                        }
                                        Button {
                                            isShowingSizeGuideSheet.toggle()
                                        } label: {
                                            Text("사이즈 가이드")
                                                .underline(true, color: .black)
                                                .font(.system(size: 15))
                                                .padding(.leading, 37)
                                                .padding(.bottom, 23)
                                        }
                                        .sheet(isPresented: $isShowingSizeGuideSheet) {
                                            SizeGuideView(urlString: "https://www.nike.com/kr/size-fit/mens-footwear")
                                        }
                                    }
                                }
                                .foregroundColor(.black)
                                .font(.system(size: 18))
                            }
                            
                            Group {
                                Divider()
                                
                                Button {
                                    reviewToggle.toggle()
                                } label: {
                                    VStack(alignment: .leading) {
                                        if reviewToggle == false {
                                            HStack {
                                                Text("리뷰 (9359)")
                                                Spacer()
                                                ForEach(0..<5) { _ in
                                                    Image(systemName: "star.fill")
                                                }
                                                Image(systemName: "chevron.down")
                                                    .padding(.vertical, 28)
                                            }
                                        } else {
                                            HStack {
                                                Text("리뷰 (9359)")
                                                Spacer()
                                                ForEach(0..<5) { _ in
                                                    Image(systemName: "star.fill")
                                                }
                                                Image(systemName: "chevron.up")
                                                    .padding(.vertical, 28)
                                            }
                                            Button {
                                                isShowingSizeGuideSheet.toggle()
                                            } label: {
                                                Text("사이즈 가이드")
                                                    .underline(true, color: .black)
                                                    .font(.system(size: 15))
                                                    .padding(.leading, 37)
                                                    .padding(.bottom, 23)
                                            }
                                            .sheet(isPresented: $isShowingSizeGuideSheet) {
                                                SizeGuideView(urlString: "https://www.nike.com/kr/size-fit/mens-footwear")
                                            }
                                        }
                                    }
                                    .foregroundColor(.black)
                                    .font(.system(size: 18))
                                }
                                
                                Divider()
                                
                                Button {
                                    moreInfoToggle.toggle()
                                } label: {
                                    VStack(alignment: .leading) {
                                        if moreInfoToggle == false {
                                            HStack {
                                                Text("추가 정보")
                                                Spacer()
                                                Image(systemName: "chevron.down")
                                                    .padding(.vertical, 28)
                                            }
                                        } else {
                                            VStack {
                                                HStack {
                                                    Text("추가 정보")
                                                    Spacer()
                                                    Image(systemName: "chevron.up")
                                                        .padding(.vertical, 28)
                                                }
                                                
                                                MoreInfoView()
                                                    .multilineTextAlignment(.leading)
                                                    .padding(.bottom, 30)
                                            }
                                        }
                                    }
                                    .foregroundColor(.black)
                                    .font(.system(size: 18))
                                }
                                
                                Divider()
                                
                                Button {
                                    print("공유 버튼")
                                } label: {
                                    HStack {
                                        Spacer()
                                        
                                        Text("\(Image(systemName: "square.and.arrow.up")) 공유")
                                            .foregroundColor(.black)
                                            .padding(.vertical, 28)
                                        
                                        Spacer()
                                    }
                                }
                                
                                Divider()
                            }
                            
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
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
    }
}
