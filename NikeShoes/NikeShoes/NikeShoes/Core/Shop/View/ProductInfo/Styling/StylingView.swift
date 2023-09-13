//
//  StylingView.swift
//  NikeShoes
//
//  Created by 전민돌 on 9/12/23.
//

import SwiftUI

struct StylingView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("스타일링 만나보기")
                .font(.mediumBold24)
                .padding(.bottom, 15)
            
            Text("Instagram에서 @Nike를 태그하여 나의 스타일이 게시될 기회를 노려보세요.")
            
            HStack {
                ScrollView(.horizontal) {
                    NavigationLink {
                        SelectItemVIew()
                    } label: {
                        HStack {
                            VStack {
                                ZStack {
                                    AsyncImage(url: URL(string: "https://static.pxlecdn.com/photos/559121339/original/4f0eec324b8270cb583d.jpg")) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .clipShape(Circle())
                                            .frame(width: 250, height: 250)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    
                                    ZStack {
                                        Circle()
                                            .foregroundColor(.black)
                                        Image(systemName: "plus.magnifyingglass")
                                            .renderingMode(.template)
                                            .foregroundColor(.white)
                                    }
                                    .frame(width: 40)
                                    .padding(.leading, -100)
                                    .padding(.top, 150)
                                }
                                
                                Text("by @anier_888")
                                    .foregroundColor(.black)
                                    .font(.caption)
                                    .padding(.top, -10)
                                    .padding(.leading, -90)
                            }
                            .padding(.top, -10)
                            
                            VStack {
                                ZStack {
                                    AsyncImage(url: URL(string: "https://static.pxlecdn.com/photos/522953445/original/b5bcb2294415960fae67.jpg")) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .clipShape(Circle())
                                            .frame(width: 200, height: 200)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    
                                    ZStack {
                                        Circle()
                                            .foregroundColor(.black)
                                        Image(systemName: "plus.magnifyingglass")
                                            .renderingMode(.template)
                                            .foregroundColor(.white)
                                    }
                                    .frame(width: 40)
                                    .padding(.leading, -100)
                                    .padding(.top, 150)
                                }
                                
                                Text("by @nastyflemme")
                                    .foregroundColor(.black)
                                    .font(.caption)
                                    .padding(.top, 15)
                                    .padding(.leading, -90)
                            }
                            .padding(.top, 10)
                            
                            VStack {
                                ZStack {
                                    AsyncImage(url: URL(string: "https://static.pxlecdn.com/photos/522355164/original/dfad24671f909b4590b4.jpg")) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .clipShape(Circle())
                                            .frame(width: 250, height: 250)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    
                                    ZStack {
                                        Circle()
                                            .foregroundColor(.black)
                                        Image(systemName: "plus.magnifyingglass")
                                            .renderingMode(.template)
                                            .foregroundColor(.white)
                                    }
                                    .frame(width: 40)
                                    .padding(.leading, -100)
                                    .padding(.top, 150)
                                }
                                
                                Text("by @rawww.af")
                                    .foregroundColor(.black)
                                    .font(.caption)
                                    .padding(.top, -10)
                                    .padding(.leading, -90)
                            }
                            .padding(.top, -10)
                            
                            VStack {
                                ZStack {
                                    AsyncImage(url: URL(string: "https://static.pxlecdn.com/photos/514663663/original/d399fc5b1a6f958f6a7e.jpg")) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .clipShape(Circle())
                                            .frame(width: 250, height: 250)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    
                                    ZStack {
                                        Circle()
                                            .foregroundColor(.black)
                                        Image(systemName: "plus.magnifyingglass")
                                            .renderingMode(.template)
                                            .foregroundColor(.white)
                                    }
                                    .frame(width: 40)
                                    .padding(.leading, -100)
                                    .padding(.top, 150)
                                }
                                
                                Text("by @blackthacreator")
                                    .foregroundColor(.black)
                                    .font(.caption)
                                    .padding(.top, -10)
                                    .padding(.leading, -90)
                            }
                            .padding(.top, -10)
                            
                            VStack {
                                ZStack {
                                    AsyncImage(url: URL(string: "https://static.pxlecdn.com/photos/612019710/original/a641b9e2e84a1cf91277.jpg")) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .clipShape(Circle())
                                            .frame(width: 250, height: 250)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    
                                    ZStack {
                                        Circle()
                                            .foregroundColor(.black)
                                        Image(systemName: "plus.magnifyingglass")
                                            .renderingMode(.template)
                                            .foregroundColor(.white)
                                    }
                                    .frame(width: 40)
                                    .padding(.leading, -100)
                                    .padding(.top, 150)
                                }
                                
                                Text("by @lincolnblache")
                                    .foregroundColor(.black)
                                    .font(.caption)
                                    .padding(.top, -10)
                                    .padding(.leading, -90)
                            }
                            .padding(.top, -10)
                        }
                    }
                }
            }
        }
        .padding()
    }
}

struct StylingView_Previews: PreviewProvider {
    static var previews: some View {
        StylingView()
    }
}
