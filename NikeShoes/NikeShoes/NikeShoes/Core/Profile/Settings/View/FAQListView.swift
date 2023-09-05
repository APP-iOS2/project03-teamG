//
//  FAQListView.swift
//  NikeShoes
//
//  Created by 김성훈 on 2023/09/05.
//

import SwiftUI

struct FAQListView: View {
    var body: some View {
        List {
            Section {
                Text("질문 리스트 들...")
            }
        }
        .listStyle(.plain)
    }
}

struct FAQListView_Previews: PreviewProvider {
    static var previews: some View {
        FAQListView()
    }
}
