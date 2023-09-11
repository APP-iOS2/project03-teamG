//
//  MoreInfoButtonView.swift
//  NikeShoes
//
//  Created by 전민돌 on 9/10/23.
//

import SwiftUI

struct MoreInfoButtonView: View {
    @State private var moreInfoToggle = false
    
    var body: some View {
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
    }
}

struct MoreInfoButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MoreInfoButtonView()
    }
}
