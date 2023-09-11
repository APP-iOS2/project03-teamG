//
//  ContentView.swift
//  NikeShoesAdmin
//
//  Created by 최소정 on 2023/09/04.
//

import SwiftUI
import NikeShoesCore
//import NikeShoes

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(NikeShoesCore().text)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
