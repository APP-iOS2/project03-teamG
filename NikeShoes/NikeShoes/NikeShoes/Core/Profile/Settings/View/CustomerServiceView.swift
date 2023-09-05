//
//  CustomerServiceView.swift
//  NikeShoes
//
//  Created by 김성훈 on 2023/09/05.
//

import SwiftUI

struct CustomerServiceView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var title: String
    
    var body: some View {
        VStack {
            
            VStack(alignment: .center) {
                
                Text("나이키코리아 고객센터")
                    .font(.medium20)
                    .padding(.vertical)
                
                Text("제품 혹은 서비스 이용에 도움이 필요하신\n경우에는 도와드리겠습니다.")
                    .multilineTextAlignment(.center)
                
            }
            .padding(.vertical, 30)
            
            Divider()
            
            VStack(alignment: .leading) {
                HStack {
                    NavigationLink(destination: Text("전화가 걸려야함 흠")) {
                        Label("전화 문의", systemImage: "iphone")
                    }
                    .padding(.vertical)
                    Spacer()
                }
                
                Divider()
                
                HStack {
                    NavigationLink(destination: Text("")) {
                        Label("FAQ 살펴보기", systemImage: "questionmark.circle")
                    }
                    .padding(.vertical)
                    Spacer()
                }
            }
            .foregroundColor(.black)
            
            Spacer()
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                }
                .foregroundColor(.black)
            }
        }
        .navigationBarTitle(title, displayMode: .inline)
        .navigationBarBackButtonHidden()
    }
}

struct CustomerServiceView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerServiceView(title: "나이키코리아 고객센터")
    }
}
