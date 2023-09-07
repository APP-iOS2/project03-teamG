//
//  HomeView.swift
//  NikeClone
//
//  Created by 이희찬 on 2023/09/04.
//

import SwiftUI

struct HomeView: View {
    
    var userName: String = "최소정"
    // 시간 별 인사
    var date: String {
        let now: Date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_kr")
        dateFormatter.timeZone = TimeZone(abbreviation: "KST")
        dateFormatter.dateFormat = "HH:mm"
        
        return dateFormatter.string(from: now)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    // 시간대별로 다르게 보이는거 구현해 주기
                    if date < "06:00" {
                        Text("\(userName)님, 꿀잠자고 계시는지~")
                            .font(.mediumBold24)
                    } else if date < "12:00" {
                        Text("\(userName)님, 좋은 아침이에요!")
                            .font(.mediumBold24)
                    } else if date < "18:00" {
                        Text("\(userName)님, 활기찬 오후 보내세요!")
                            .font(.mediumBold24)
                        
                    } else if date < "22:00" {
                        Text("\(userName)님, 즐거운 저녁 보내고 계신가요?")
                            .font(.mediumBold24)
                    } else {
                        Text("\(userName)님, 굿냣")
                            .font(.mediumBold24)
                    }
                    Spacer()
                }
            }
            .padding(10)
            
            CustomizedRecommendView()
            
            NikeNewsView()
            
            // 끝인사
            VStack(alignment: .center) {
                Image("nike_logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50)
                    .padding(5)
                Text("함께해 주셔서 감사합니다.")
                    .font(.regular12)
            }
            .padding(20)
        }
        .toolbar { SearchView() }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            HomeView()
        }
    }
}
