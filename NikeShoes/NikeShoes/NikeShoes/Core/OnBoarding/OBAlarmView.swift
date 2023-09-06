//
//  OBAlarmView.swift
//  NikeShoes
//
//  Created by 박형환 on 2023/09/05.
//

import SwiftUI


struct OBAlarmView: View {
    
    var description: String = "주문 업데이트 외에 어떤 알림을 받고 \n싶으신가요?"
    var description2: String = "아래 내용 중 하나 이상을 클릭함으로써, Nike에서 멤버십ID와 개인정보를 이용하고 마케팅 푸쉬 메시지를 받는 것에 동의합니다. 다른 법에서 요구사항이 있지 않는 한 Nike 계정이 유지되는 동안에는 개인정보를 계속 보유할 것입니다. 동의를 하지 않을 권리가 있으나, 동의하지 않을 경우에는 마케팅 푸쉬 메시지를 받으실 수 없습니다. '설정'에 들어가서 언제든지 바꿀 수 있습니다."
    
    var sizes: [Int] = (0..<16).reduce(into: [Int]()) { sizes, _ in
        sizes.isEmpty ? sizes.append(215) : sizes.append(sizes.last! + 5)
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("\(description)")
                    .font(.system(size: 26))
                    .bold()
                    .foregroundColor(.white)
                    .padding(.top, 30)
                    .padding(.horizontal, 10)
                
            }
            .padding(.bottom, 30)
            
            HStack {
                Text("\(description2)")
                    .font(.system(size: 15))
                    .foregroundColor(.white.opacity(0.6))
                    .padding(.horizontal, 10)
                    .padding(.bottom , 20)
            }

            AlarmList()
            Spacer()
        }
    }
}

struct AlarmList: View {
    
//    let bestSeller: String = "최신 상품 및 베스트 셀러"
//    let promotion: String = "나이키 멤버 리워드 및 프로모션"
//    let trainning: String = "기사, 이벤트 및 트레이닝 팁"
    
    var alarmTexts = ["최신 상품 및 베스트 셀러",  "나이키 멤버 리워드 및 프로모션" ,  "기사, 이벤트 및 트레이닝 팁"]
    
    var body: some View {
        ForEach(0..<3) { value in
            HStack {
                Text("\(alarmTexts[value])")
                    .font(.system(size: 18))
                    .bold()
                    .foregroundColor(.white)
                    .padding(10)
                
                Spacer()
                
                Circle()
                    .strokeBorder(.white.opacity(0.5), lineWidth: 1)
                    .frame(width: 25, height: 25)
                    .padding(20)
            }
            
            if value != 2 {
                Divider()
                    .frame(width: 300)
                    .padding(.horizontal, 30)
                    .background(Color.white.opacity(0.5))
            }
        }
    }
    
}


struct OBAlarmView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            Blur(style: .light)
            OBAlarmView()
                .padding(.top , 100)
        }.ignoresSafeArea()
    }
}
