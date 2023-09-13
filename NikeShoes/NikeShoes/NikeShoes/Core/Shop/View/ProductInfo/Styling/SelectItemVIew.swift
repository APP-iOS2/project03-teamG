//
//  SelectItemVIew.swift
//  NikeShoes
//
//  Created by 전민돌 on 9/12/23.
//

import SwiftUI

struct SelectItemVIew: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    AsyncImage(url: URL(string: "https://static.pxlecdn.com/photos/559121339/original/4f0eec324b8270cb583d.jpg")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 500, height: 500)
                    } placeholder: {
                        ProgressView()
                    }
                    .padding(.bottom, 15)
                    Text("by @anier_888")
                        .fontWeight(.thin)
                        .padding(.leading, -170)
                        .padding(.bottom, 30)
                    
                    ProductLinkView()
                }
                
                VStack {
                    AsyncImage(url: URL(string: "https://static.pxlecdn.com/photos/522953445/original/b5bcb2294415960fae67.jpg")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 500, height: 500)
                    } placeholder: {
                        ProgressView()
                    }
                    .padding(.bottom, 15)
                    Text("by @nastyflemme")
                        .fontWeight(.thin)
                        .padding(.leading, -170)
                        .padding(.bottom, 30)
                    
                    ProductLinkView()
                }
                
                VStack {
                    AsyncImage(url: URL(string: "https://static.pxlecdn.com/photos/522355164/original/dfad24671f909b4590b4.jpg")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 500, height: 500)
                    } placeholder: {
                        ProgressView()
                    }
                    .padding(.bottom, 15)
                    Text("by @rawww.af")
                        .fontWeight(.thin)
                        .padding(.leading, -170)
                        .padding(.bottom, 30)
                    
                    ProductLinkView()
                }
                
                VStack {
                    AsyncImage(url: URL(string: "https://static.pxlecdn.com/photos/514663663/original/d399fc5b1a6f958f6a7e.jpg")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 500, height: 500)
                    } placeholder: {
                        ProgressView()
                    }
                    .padding(.bottom, 15)
                    Text("by @blackthacreator")
                        .fontWeight(.thin)
                        .padding(.leading, -170)
                        .padding(.bottom, 30)
                    
                    ProductLinkView()
                }
                
                VStack {
                    AsyncImage(url: URL(string: "https://static.pxlecdn.com/photos/612019710/original/a641b9e2e84a1cf91277.jpg")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 500, height: 500)
                    } placeholder: {
                        ProgressView()
                    }
                    .padding(.bottom, 15)
                    Text("by @lincolnblache")
                        .fontWeight(.thin)
                        .padding(.leading, -170)
                        .padding(.bottom, 30)
                    
                    ProductLinkView()
                }
                .navigationTitle("선택한 아이템")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct SelectItemVIew_Previews: PreviewProvider {
    static var previews: some View {
        SelectItemVIew()
    }
}
