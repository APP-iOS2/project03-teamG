//
//  LocationView.swift
//  NikeShoes
//
//  Created by 이희찬 on 2023/09/05.
//

import SwiftUI

struct LocationView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let title: String
    
    @State private var nation: String = ""
    
    var body: some View {
        
        ScrollView{
            Divider()
            
            TextField("검색", text: $nation)
                .padding(15)
                .background(Color.white)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 0.5))
                .padding()
            
            LazyVStack{
                Text("Hello, World!")
            }
            
        }
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

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            LocationView(title: "국가 / 지역")
        }
    }
}
