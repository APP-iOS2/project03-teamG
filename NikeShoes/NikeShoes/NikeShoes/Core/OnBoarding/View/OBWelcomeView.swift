//
//  OBWelcomeView.swift
//  NikeShoes
//
//  Created by 박형환 on 2023/09/05.
//

import SwiftUI

struct OBWelcomeView: View {
    
    var description: String = "박형환님, 안녕하세요.\n다시 오신것을 환영합니다."
    var description2: String = "\n함께해 주셔서\n감사합니다!"
    var date: String = "2023"
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Spacer(minLength: 300)
            
            Image("nike_ob")
            HStack {
                Text("\(description)")
                    .bold()
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.horizontal, 12)
                Spacer()
            }
            
            HStack {
                Text("\(description2)")
                    .bold()
                    .font(.title2)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 12)
                    .padding(.vertical, -40)
                Spacer()
            }
            
            Spacer()
            
            Text("\(date)년에 가입")
                .foregroundColor(.gray)
                .foregroundColor(.white)
                .padding(.horizontal, 12)
                .padding(.vertical, 100)
        }
    }
}

struct OBWelcomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ZStack {
            Color.black
            OBWelcomeView()
        }.ignoresSafeArea()
    }
}
