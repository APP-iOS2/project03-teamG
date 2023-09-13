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
    
    @DocumentID  var id: String?
    @StateObject var promotionStore: MemberRewardViewModel = MemberRewardViewModel()
    @State var promotionCode: String = ""
    @State var promotionPercent: String = ""
    @State var promotionExpireDate: Date = Date()
    
    var body: some View {
        
        NavigationStack {
            
            HStack {
                
                VStack(alignment:.leading) {
                    
                    TextField("프로모션 코드", text: $promotionCode)
                    TextField("프로모션 할인(숫자로 입력)", text: $promotionPercent)
                    DatePicker("프로모션 종료날짜", selection: $promotionExpireDate, displayedComponents: [.date])
                    
                    Button {
                        
                        Task {
                            let new = PromotionDTO(code: promotionCode, discountRate: Double(promotionPercent) ?? 0, restrict: 0, promotionExpireDate: promotionExpireDate)
                            
                            let newPromotion = try await promotionStore.service.create(send: new, collection: .promotion)
                            
                            let newFetch = try await promotionStore.fetchPromotion()
                            promotionStore.memberReward = newFetch
                            resetPromotion()
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
                        List {
                            ForEach(promotionStore.memberReward) { code in
                                
                                VStack(alignment:.leading) {
                                    Text("프로모션 코드: \(code.code)")
                                    Text("할인률: " + String(format: "%.0f", code.discountRate) + "%")
                                    Text("종료 날짜: \(code.promotionExpireDate.description)")
                                    
                                }
                            }
                            .onDelete { index in
                                
                                Task {
                                    
                                    var tempPromotion: PromotionDTO?
                                    
                                    let deletedIndexes = index.map { $0 }
                                    
                                    for index in deletedIndexes {
                                        let memberReward = promotionStore.memberReward[index]
                                        tempPromotion = memberReward
                                    }
                                    
                                    guard let removedPromotion = tempPromotion else {return}
                                    guard let removedID = removedPromotion.id else {return}
                                    
                                    let result = try await promotionStore.deletePromotion(removedPromotion, id: removedID)
                                    
                                    promotionStore.memberReward.remove(atOffsets: index)
                                }
                            }
                        }
                        .listStyle(.plain)
                    }
                }
            }
            .navigationTitle("멤버 리워드 제공")
        }
    }
    
    func resetPromotion() {
        promotionCode = ""
        promotionPercent = ""
        promotionExpireDate = Date()
    }
}

