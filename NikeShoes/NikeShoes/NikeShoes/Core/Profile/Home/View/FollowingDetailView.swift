//
//  FollowingDetailView.swift
//  NikeShoes
//
//  Created by 김성준 on 2023/09/06.
//

import SwiftUI
import NikeShoesCore
enum FollowingCategory: String, CaseIterable, Identifiable {
    case sports, porducts
    var id: Self { self }
}

struct FollowingDetailView: View {
    
    @State private var selectedFlavor: FollowingCategory = .sports
    
    var body: some View {
        VStack {
            Picker("Flavor", selection: $selectedFlavor) {
                Text("스포츠").tag(FollowingCategory.sports)
                Text("제품").tag(FollowingCategory.porducts)
            }
            .pickerStyle(.segmented)
          
            List {
                ForEach(0..<3) { index in
                    FollowingEditCellView(
                        imageURL: Following.sample[index].imageURL,
                        title: Following.sample[index].title,
                        isChecked: Following.sample[index].isChecked)
                    .padding(.horizontal, 0)
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("팔로잉")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FollowingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            FollowingDetailView()
        }
    }
}
