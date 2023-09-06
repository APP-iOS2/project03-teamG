//
//  Bag View.swift
//  NikeClone
//
//  Created by 이희찬 on 2023/09/04.
//

import SwiftUI

struct BagView: View {
    @Binding var userPromCode: String
    
    @State var selectedQty: Int = 1
    @State var buttonText: String = "주문하기"
    @State private var isFolded = true
    @State private var showAlert = false
    @State private var isTapped = false
    @State private var alertMessage = ""
    @State var finalPrice: String = "0"

    var animation: Animation = .spring()
    var quantities = [1, 2, 3]
    var productCount: Int = 1
    
    var productInfo: ProductInfo 
    var promotionCode: PromotionCode
    var shoes: Shoes
    
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
                            Text("\(shoes.name)")
                                .bold()
                                .font(.caption)
                            Text("\(productInfo.option)")
                                .font(.caption)
                            Text("\(shoes.category.rawValue)")
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
                .accentColor(.black)
                    
                    Spacer()
                    
                    // MARK: 천단위로 고치기
                    Text("₩\(String(originalTotalPrice()))")
                }
                .padding()
                
                Divider()
                
               
                    // MARK: 버튼 누를경우 아래로 프로모션코드 입력 창 나타남
                    VStack {
                        if isFolded {
                            Button {
                                withAnimation {
                                    isFolded.toggle()
                                }
                            } label: {
                                VStack {
                                    HStack {
                                        Text("프로모션 코드가 있으신가요?")
                                        
                                        Spacer()
                                        
                                        Image(systemName: "plus")
                                            .frame(height: 5)
                                    }
                                    .foregroundColor(.black)
                                }
                            }
                            
                        } else {
                            ZStack(alignment: .leading) {
                            Button {
                                withAnimation {
                                    isFolded.toggle()
                                }
                            } label: {
                                VStack {
                                    HStack {
                                        Text("프로모션 코드가 있으신가요?")
                                        
                                        Spacer()
                                        
                                        Image(systemName: "minus")
                                    }
                                    .foregroundColor(.black)
                                    
                                    Spacer()
                                }
                            }
                                HStack {
                                    TextField("프로모션 코드", text: $userPromCode)
                                        .textFieldStyle(.roundedBorder)
                                        .frame(width:250)
                                    
                                    Spacer()
                                    
                                    Button {
                                        // prom code 데이터 만들어두고 확인하기
                                       checkPromCode()
                                        
                                    } label: {
                                        Text("적용하기")
                                            .frame(width: 80, height: 35)
                                    }
                                    .foregroundColor(.black)
                                    .background(Color(.systemGray6))
                                    .cornerRadius(3)
                                }
                                .alert(isPresented: $showAlert) {
                                            Alert(title: Text("알림"), message: Text(alertMessage), dismissButton: .default(Text("확인")))
                                        }
                                
                            }

                        }
                    }
                    .padding()
                
                Divider()
                
                VStack {
                    HStack {
                        Text("상품 금액")
                        
                        Spacer()
                        
                        Text(String("₩\(originalTotalPrice())"))
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
                        
                        // finalTotalPrice()
                        if showAlert == true {
                            Text("₩\(originalTotalPrice())")
                        } else {
                            Text("₩\(finalTotalPrice())")
                        }
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
    
    func originalTotalPrice() -> Int {
        let result = productInfo.price * selectedQty
        return result
    }
    
    func finalTotalPrice() -> String {
        let promDiscount = promotionCode.discountRate
        let result = Double(productInfo.price * selectedQty) * promDiscount
        let formattedValue = String(format: "%.0f", result)
        
        return formattedValue
    }
    
    private func checkPromCode() {
        if promotionCodes.contains(where: { $0.code == userPromCode }) {
            alertMessage = "할인이 적용되었습니다."
            finalPrice = finalTotalPrice()
            print("vaild \(userPromCode)")
            
        } else {
            alertMessage = "유효하지 않은 코드입니다."
            print("unvaild \(userPromCode)")
        }
        showAlert = true
    }
}

struct BagView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            BagView(userPromCode: .constant("할인20"), productInfo: ProductInfo(name: "에어 조던 1 로우", category: "여성 신발", option: "화이트/알루미늄/울프 그레이", size: "250 사이즈", price: 139000), promotionCode: PromotionCode(code: "할인30", discountRate: 0.3), shoes: Shoes(name: "에어 조던 1 로우", category: .female, modelName: .airForce, price: 30000, size: [1], description: "", imageURLString: ""))
        }
    }
}


