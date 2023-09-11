//
//  SizeTipButtonView.swift
//  NikeShoes
//
//  Created by 전민돌 on 9/10/23.
//

import SwiftUI

struct SizeTipButtonView: View {
    @State private var sizeTipToggle = false
    @State private var isShowingSizeGuideSheet = false
    
    var body: some View {
        Button {
            sizeTipToggle.toggle()
        } label: {
            VStack(alignment: .leading) {
                if sizeTipToggle == false {
                    HStack {
                        Text("사이즈 & 팁")
                        Spacer()
                        Image(systemName: "chevron.down")
                            .padding(.vertical, 28)
                    }
                } else {
                    HStack {
                        Text("사이즈 & 팁")
                        Spacer()
                        Image(systemName: "chevron.up")
                            .padding(.vertical, 28)
                    }
                    Button {
                        isShowingSizeGuideSheet.toggle()
                    } label: {
                        Text("사이즈 가이드")
                            .underline(true, color: .black)
                            .font(.system(size: 15))
                            .padding(.leading, 37)
                            .padding(.bottom, 23)
                    }
                    .sheet(isPresented: $isShowingSizeGuideSheet) {
                        SizeGuideView(urlString: "https://www.nike.com/kr/size-fit/mens-footwear")
                    }
                }
            }
            .foregroundColor(.black)
            .font(.system(size: 18))
        }
    }
}

struct SizeTipButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SizeTipButtonView()
    }
}
