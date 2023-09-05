//
//  Bag View.swift
//  NikeClone
//
//  Created by 이희찬 on 2023/09/04.
//

import SwiftUI

struct BagView: View {
    
    @State var selectedQty: Int = 1
    @State var buttonText: String = "주문하기"
    
    var quantities = [1, 2, 3]
    var productCount: Int = 1
    var defaultText: String = """
         장바구니가 비어있습니다.
제품을 추가하면 여기에 표시됩니다.
"""
    var productInfo: ProductInfo
    
    
    var body: some View {
        VStack {
            NavigationStack {
                
                if productCount != 0 {
                    
                    HStack {
                        Button {
                            
                        } label: {
                            AsyncImage(url: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcST0yWep66t1F76Ud7TeOu_JkZZVRZ_9F3ntLEyvWlN7OMHg0T56IZMcJrW8nfQQiuiZyQ&usqp=CA")) { img in
                                img
                                    .resizable()
                                    
                            } placeholder: {
                                ProgressView()
                            }
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                        }

                        
                        
                        // MARK: 아래는 임시 내용입니다.
                        VStack(alignment: .leading) {
                            Text("\(productInfo.name)")
                                .bold()
                                .font(.caption)
                            Text("\(productInfo.option)")
                                .font(.caption)
                            Text("\(productInfo.category)")
                                .font(.caption)
                            Text("\(productInfo.size)")
                                .font(.caption)
                        }

                        Spacer()
                    }
                    
                } else {
                    Spacer()
                    
                    Text(defaultText)
                    
                    Spacer()
                }
                
                HStack {
                    Text("수량")
                Picker("Quantity", selection: $selectedQty) {
                        ForEach(quantities, id: \.self) {
                            Text("\(String($0))")
                        }
                    }
                    
                    Spacer()
                    
                    // MARK: 천단위로 고치기
                    Text("₩\(String(totalPrice()))")
                }
                .padding()
                
                Divider()
                
                HStack {
                    Text("프로모션 코드가 있으신가요?")
                    
                    Spacer()
                    
                    // MARK: 버튼 누를경우 아래로 프로모션코드 입력 창 나타남
                    Button {
                        
                    } label: {
                        Image(systemName: "plus")
                    }

                }
                .padding()
                
                Divider()
                
                VStack {
                    HStack {
                        Text("상품 금액")
                        
                        Spacer()
                        
                        Text(String("₩\(totalPrice())"))
                    }
                    .foregroundColor(.gray)
                    //                .padding()
                    
                    HStack {
                        Text("배송 옵션")
                        
                        Spacer()
                        
                        Text("표준 - 무료")
                        
                    }
                    .foregroundColor(.gray)
                    //                .padding()
                    
                    HStack {
                        Text("총 결제 금액")
                        
                        Spacer()
                        
                        Text(String("₩\(totalPrice())"))
                    }
                    //                .padding()
                }
                .padding()
                    
                Spacer()
                
                
                Button {
                    // 기능 1) faceID 활성화 (구현할지?)
                    
                    // 기능 2) 결제 sheet 활성화
                    
                } label: {
                    //                    Image()
                    Text("구매하기")
                        .font(.title3)
                        .frame(width: 370, height: 70)
                }
                .foregroundColor(.white)
                .background(Color.black)
                .cornerRadius(40)
                .padding()
            }
            .navigationTitle("장바구니")
        }
    }
    func totalPrice() -> Int {
        var result = productInfo.price * selectedQty
        return result
    }
}

struct BagView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            BagView(productInfo: ProductInfo(name: "에어 조던 1 로우", category: "여성 신발", option: "화이트/알루미늄/울프 그레이", size: "250 사이즈", price: 139000))
        }
    }
}


