//
//  OnBoarding.swift
//  NikeShoes
//
//  Created by 박형환 on 2023/09/05.
//

import SwiftUI


enum OnBoardingScreen: CaseIterable, Identifiable {
    case start
    case interest
    case shoesSize
    case alarm
    case location
    
    
    var string: String {
        switch self {
        case .start:
            return "시작"
        case .interest:
            return "관심있는 항목"
        case .shoesSize:
            return "신발사이즈"
        case .alarm:
            return "알림"
        case .location:
            return "위치"
        }
    }
    
    var id: Self {
        return self
    }
}


struct OnBoardingView: View {
  
    @State var screen: [OnBoardingScreen] = OnBoardingScreen.allCases
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack{
            Color
                .black
                .edgesIgnoringSafeArea(.all)
                .opacity(0.7)
            
            VStack{
                MainView(isButtonClicked: false, index: 0, questions: $screen)
                    .navigationBarBackButtonHidden(true)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                // 2
                                dismiss()
                            } label: {
                                HStack {
                                    Image(systemName: "chevron.backward")
                                        .foregroundColor(Color(red:255/255, green: 177/255, blue: 58/255))
                                }
                            }
                            Spacer()
                        }
                    }
            }//VStack
        }
        
    }
}

struct MainView: View {
    
    @State var isButtonClicked: Bool = false
    @State var index: Int = 0
    @Binding var screens: [OnBoardingScreen]
    var colummID: [String]
    
    init(isButtonClicked: Bool, index: Int, questions: Binding<[OnBoardingScreen]>) {
        self.isButtonClicked = isButtonClicked
        self.index = index
        self._screens = questions
        self.colummID = []
        
        for value in questions.wrappedValue {
            print(value.id)
            colummID.append("\(value.id)")
        }
    }
    
    let imageURL = "https://image"
    
    enum ScrollPosition: Hashable {
        case screen(id: String)
    }
   
    var body: some View {
        GeometryReader{ proxy in
            
            VStack{
                Spacer()
                VStack{
                    HStack{
                        Spacer(minLength: 40)
                        
                        ProgressView(value: Double(index + 1),
                                     total: Double(screens.count))
                        .background(.white)
                        .tint(.white)
                        
                        Spacer(minLength: 40)
                    }

                }

                ScrollView(.horizontal,showsIndicators: false){
                    ScrollViewReader{ proxy2 in
                        HStack{
                            ForEach(screens) { screen in
                                VStack {
                                    Spacer()
                                    
                                    Text("\(screen.string)")
                                        .fixedSize(horizontal: false, vertical: true)
                                        .foregroundColor(.white)
                                        .font(.title)
                                        .bold()
                                    
                                    Spacer()
                              
                                        AsyncImage(url: URL(string: imageURL)) { image in
                                            image.resizable()
                                                .cornerRadius(12)
                                            
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .frame(width: 300, height: 200)
                                        Spacer()
                                        
                                        Text("\(screen.string)")
                                            .foregroundColor(.white)
                                            .fixedSize(horizontal: false, vertical: true)
                                            .font(.body)
                                            .padding()
                                        
                                    HStack {
                                        Button(action: {
                                            withAnimation{
                                                self.isButtonClicked.toggle()
                                                index += 1
                                                proxy2.scrollTo(
                                                    ScrollPosition.screen(id: colummID[index]),
                                                    anchor: .leading
                                                )
                                            }
                                        }, label: {
                                            Text("Next")
                                        })
                                        .padding(.horizontal,30)
                                        .padding(.vertical,10)
                                        .background(.pink)
                                        .foregroundColor(.white)
                                        .cornerRadius(20)
                                    }
                                    Spacer()
                                    
                                }
                                .frame(width: proxy.size.width, height: proxy.size.height - 44, alignment: .center)
                                .id(ScrollPosition.screen(id: "\(screen.id)"))
                                
                                Spacer()
                            }
                        }
                    }
                }.frame(width: proxy.size.width, height: proxy.size.height - 44, alignment: .center)
                    .edgesIgnoringSafeArea(.leading)
                    .scrollDisabled(true)
            }
        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}


extension View {
    func barTitle(_ title: String,
             size: NavigationBarItem.TitleDisplayMode = .large) -> some View {
        self.navigationBarTitle(title, displayMode: size)
    }
}

struct Benchmark: Identifiable, Hashable {
    let id = UUID()
    var name: String
}


