//
//  PromotionView.swift
//  NikeShoesAdmin
//
//  Created by kaikim on 2023/09/12.
//

import SwiftUI

struct PromotionView: View {
    @StateObject var promotionStore: PromotionViewModel = PromotionViewModel()
//    @State var promotionRange: PromotionRange = .All
    @State var promotionCode: String = ""
    @State var promotionPercent: String = ""
    @State var promotionExpireDate: Date = Date()
    @State var promotionExpireDate1: Date = Date()
    
    var body: some View {
        
        NavigationStack {
            
            HStack {
                VStack(alignment:.leading) {
//
//                    Picker("프로모션", selection: $promotionRange) {
//                        Text("전체").tag(PromotionRange.All)
//                        Text("멤버").tag(PromotionRange.Individual)
//                    }
                    

                    TextField("프로모션 코드", text: $promotionCode)
                    TextField("프로모션 할인(숫자로 입력)", text: $promotionPercent)
                    DatePicker("프로모션 종료날짜", selection: $promotionExpireDate, displayedComponents: [.date])
                    
                    Button {
                        
                   
                            let new = PromotionModel( promotionName: promotionCode, promotionPercent: Int(promotionPercent) ?? 0, promotionExpireDate: promotionExpireDate)
                            
                            addNewPromotion(new)
                       
                        
                    } label: {
                        Text("등록")
                    }
                    .buttonStyle(.borderedProminent)
                    Spacer()
                    
                }
                .padding()
                VStack {
                    Section("진행중인 프로모션") {
                        List{
                            ForEach(promotionStore.promotionStore) { code
                                
                                in
                                
                                HStack {
                                    Text("프로모션 코드 :\(code.promotionName),  할인률: \(code.promotionPercent) % , 종료날짜: \(code.promotionExpireDate.description)")
                                }
                            }
                            .onDelete { index in
                                promotionStore.promotionStore.remove(atOffsets: index)
                            }
                        }
                        .listStyle(.plain)
                    }
                    
                }
                
            }
            .navigationTitle("멤버 리워드 제공")
        }
    }
    
    func addNewPromotion(_ new:PromotionModel) {
        
        promotionStore.promotionStore.append(new)
//        promotionRange = .All
        promotionCode = ""
        promotionPercent = ""
        promotionExpireDate = Date()
    }
}
enum PromotionRange {
    case All
    case Individual
    
}
struct PromotionModel: Identifiable {
    
    var id: UUID = UUID()
//    var promotionRange: PromotionRange
    var promotionName:String
    var promotionPercent:Int
    var promotionExpireDate: Date
    
}

class PromotionViewModel: ObservableObject {
    
    @Published var promotionStore : [PromotionModel] =
    [PromotionModel(
                    promotionName: "할인50",
                    promotionPercent: 50, promotionExpireDate: Date()),
     PromotionModel(
                    promotionName: "할인50",
                    promotionPercent: 50, promotionExpireDate: Date()),
     PromotionModel(
                    promotionName: "할인50",
                    promotionPercent: 50, promotionExpireDate: Date()),
     PromotionModel(
                    promotionName: "할인50",
                    promotionPercent: 50, promotionExpireDate: Date()),
    ]
    
}

struct PromotionView_Previews: PreviewProvider {
    static var previews: some View {
        PromotionView()
    }
}
