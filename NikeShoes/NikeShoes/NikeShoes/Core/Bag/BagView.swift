//
//  Bag View.swift
//  NikeClone
//
//  Created by 이희찬 on 2023/09/04.
//

import SwiftUI
import NikeShoesCore

struct BagView: View {
    @Binding var userPromCode: String
    //    @Binding var isShowingSheet: Bool
    
    @State var selectedQty: Int = 1
    @State var buttonText: String = "주문하기"
    
    @State private var isFolded = true
    @State private var showAlert = false
    @State private var isTapped = false
    @State private var alertMessage = ""
    @State var finalPrice: String = "0"
    @State var isShowingSheet: Bool = false
    
    @State private var sheetHeight: CGFloat = .zero
    @State private var size: CGSize = .zero
    @EnvironmentObject var bagViewModel: BagViewModel
    
    var animation: Animation = .spring()
    var quantities = [0, 1, 2, 3]
    
    var promotionCode: PromotionDTO = PromotionDTO(id: "", code: "", discountRate: 0.0, restrict: 1, promotionExpireDate: Date())

    var body: some View {
        ScrollView {
            VStack {
                    if !bagViewModel.bagArray.isEmpty {
                            ForEach(bagViewModel.bagArray) { bagItem in
                                VStack(alignment: .trailing) {
                                    Button {
                                        bagViewModel.removeFromBag(shoesData: bagItem)
                                    } label: {
                                        Image(systemName: "trash")
                                    }
                                    .padding()
                                    

                                    HStack {
                                        Button {
                                            //                                ProductDetailView()
                                        } label: {
                                            AsyncImage(url: URL(string: bagItem.imageURLString[0])) { img in
                                                img
                                                    .resizable()
                                                
                                            } placeholder: {
                                                ProgressView()
                                            }
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 200, height: 200)
                                        }
                                        
                                        VStack(alignment: .leading) {
                                            
                                            Text("\(bagItem.name)")
                                                .bold()
                                                .font(.caption)
                                            
                                            // MARK: shoes 데이터로 변경하기
                                            Text("\(bagItem.category)")
                                                .font(.caption)
                                            
                                            // MARK: 추후 사이즈 받아와야 함
                                            //                                Text("\(size)")
                                            //                                    .font(.caption)
                                            //                        Text("\(selectedSize)")
                                        }
                                        
                                        Spacer()
                                    }
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
                                    
                                    //                        MARK: 가격 살리기
                                    Text("₩\(bagItem.price * selectedQty)")
                                }
                                .padding()
                                
                                Divider()
                            }
                            //                        .onDelete(perform: { indexSet in
                            //                            bagViewModel.bagArray.remove(atOffsets: indexSet)
                            //                        })
                            
                    
                    HStack {
                        
                        Spacer()
                        
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
                                            .frame(width: 250)
                                        
                                        Spacer()
                                        
                                        Button {
                                            // MARK: 가격 살리기
//                                             prom code 데이터 만들어두고 확인하기
//                                                                                checkPromCode()
                                            
                                        } label: {
                                            Text("적용하기")
                                                .frame(width: 80, height: 35)
                                        }
                                        .foregroundColor(.black)
                                        .background(Color(.systemGray6))
                                        .cornerRadius(3)
                                    }
                                    .alert(isPresented: $showAlert) {
                                        Alert(title: Text("알림"),
                                              message: Text(alertMessage),
                                              dismissButton: .default(Text("확인")))
                                    }
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
                            // MARK: 가격 살리기
                                                
//                            Text(String("₩\(originalTotalPrice())"))
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
                            
                            // MARK: 가격 살리기
                            // finalTotalPrice()
                            //                    if showAlert == true {
                            //                        Text("₩\(originalTotalPrice())")
                            //                    } else {
                            //                        Text("₩\(finalTotalPrice())")
                            //                    }
                        }
                        //                .padding()
                    }
                    .padding()
                    
                    Spacer()
                    
                    Button {
                        // 기능 1) faceID 활성화 (구현할지?)
                        
                        // 기능 2) 결제 sheet 활성화
                        isShowingSheet.toggle()
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
                    .sheet(isPresented: $isShowingSheet) {
                        PaymentView(selectedQty: selectedQty, finalPrice: finalPrice, bagItemList: bagViewModel.bagArray)
                            .overlay {
                                GeometryReader { geometry in
                                    Color.clear.preference(key: InnerHeightPreferenceKey.self, value: geometry.size.height)
                                }
                            }
                            .onPreferenceChange(InnerHeightPreferenceKey.self) { newHeight in
                                
                                sheetHeight = newHeight
                                
                            }
                            .presentationDetents([.height(sheetHeight)])
                        //                    .presentationDetents([.medium])
                        
                    }
                    
                } else {
                    Spacer()
                    
                    Text(defaultText)
                    
                    Spacer()
                }
                
            }
            .navigationTitle("장바구니")
            .padding(.top, 1)
        }
        
    }
    // MARK: 가격 함수 되살리기
//    func originalTotalPrice() -> Int {
//        let result = shoesData.price * selectedQty
//        return result
//    }

//    func finalTotalPrice() -> String {
//        let promDiscount = promotionCode.discountRate
//        let result = Double(shoesData.price * selectedQty) * promDiscount
//        let formattedValue = String(format: "%.0f", result)
//
//        return formattedValue
//    }

//    private func checkPromCode() {
////        if promotionCode.code.contains(where: { $0.code == userPromCode }) {
//        if promotionCode.code.contains(userPromCode) {
//            alertMessage = "할인이 적용되었습니다."
//            finalPrice = finalTotalPrice()
//            print("vaild \(userPromCode)")
//
//        } else {
//            alertMessage = "유효하지 않은 코드입니다."
//            print("unvaild \(userPromCode)")
//        }
//        showAlert = true
//    }
}

struct BagView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            BagView(userPromCode: .constant("테스트20"))
                .environmentObject(BagViewModel())
        }
    }
}

struct InnerHeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
