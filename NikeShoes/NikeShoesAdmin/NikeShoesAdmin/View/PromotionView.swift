//
//  PromotionView.swift
//  NikeShoesAdmin
//
//  Created by kaikim on 2023/09/12.
//

import SwiftUI
import NikeShoesCore
import FirebaseFirestoreSwift


struct PromotionView: View {
    
    let service: FirestoreService
   
    
    init(service: FirestoreService = DefaultFireStoreService()) {
        self.service = service
        //        action()
    }
    
    
    @DocumentID  var id: String?
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
                        
                        Task {
                            let new = PromotionModel(id: id, promotionCode: promotionCode, promotionPercent: Int(promotionPercent) ?? 0, promotionExpireDate: promotionExpireDate)
                            
                            addNewPromotion(new)
                            
                            //                            try await service.update(collection: .promotion, document: , fields: ["memberReward" : "test1"])
                            let abc = try await service.create(send: new, collection: .promotion)
                            
                            print("\(abc)")
                            
                            
                        }
                        
                        
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
                                    Text("프로모션 코드 :\(code.promotionCode),  할인률: \(code.promotionPercent) % , 종료날짜: \(code.promotionExpireDate.description)")
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
struct PromotionModel:Hashable, Codable, Identifiable {

    
    @DocumentID var id: String?
    //    var promotionRange: PromotionRange
    var promotionCode:String
    var promotionPercent:Int
    var promotionExpireDate: Date
    
}

class PromotionViewModel: ObservableObject {
    
    @Published var promotionStore : [PromotionModel] =
    [
        
        PromotionModel(
        promotionCode: "할인50",
        promotionPercent: 50, promotionExpireDate: Date()),
     PromotionModel(
        promotionCode: "할인50",
        promotionPercent: 50, promotionExpireDate: Date()),
     PromotionModel(
        promotionCode: "할인50",
        promotionPercent: 50, promotionExpireDate: Date()),
     PromotionModel(
        promotionCode: "할인50",
        promotionPercent: 50, promotionExpireDate: Date()),
    ]
    
}

