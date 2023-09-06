//
//  OnBoarding.swift
//  NikeShoes
//
//  Created by 박형환 on 2023/09/05.
//

import SwiftUI



struct OBView: View {
    
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack{
            VStack{
                OBContainerView(isButtonClicked: false, index: 0)
                    .navigationBarBackButtonHidden(true)
            }//VStack
        }
    }
}

struct OBContainerView: View {
    
    @State var isButtonClicked: Bool = false
    @State var index: Int = 0
    
    let duration: Double = 0.5
    
    var colummID: [String]
    
    init(isButtonClicked: Bool, index: Int) {
        self.isButtonClicked = isButtonClicked
        self.index = index
        self.colummID = []
        
    }
    
    var imageURL: String = "https://static.nike.com/a/images/f_auto/f9b5ee1b-ea2d-4389-b296-1303680aafdd/image.png"
    
    enum ScrollPosition: Hashable {
        case screen(id: String)
    }
    
    var body: some View {
        
        VStack {
            ZStack {
                
                if index != 1 && index != 0 {
                    AsyncImage(url: URL(string: imageURL)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }.ignoresSafeArea()
                    
                    Blur(style: .systemUltraThinMaterialDark)
                        .ignoresSafeArea()
                }else{
                    Color.black
                        .ignoresSafeArea()
                }
                
                VStack {
                    if index < 7 {
                        HStack {
                            if index != 1 && index != 0 {
                                ProgressView(value: Double(index),
                                             total: Double(7))
                                .background(.gray)
                                .tint(.white)
                                .cornerRadius(12)
                                .padding(.top,10)
                                .padding(.horizontal,80)
                            }
                        }
                    }
                    
                    switch index {
                    case 0:
                        OBLocationDescriptionView()
                            .transition(AnyTransition.opacity.animation(.easeInOut(duration: duration)))
                        TempButton {
                            index += 1
                        }.padding(.bottom, 20)
                    case 1:
                        OBLanguageSelectionView()
                            .transition(AnyTransition.opacity.animation(.easeInOut(duration: duration)))
                        TempButton {
                            index += 1
                        }.padding(.bottom, 20)
                    case 2:
                        OBStartView()
                            .transition(AnyTransition.opacity.animation(.easeInOut(duration: duration)))
                        TempButton {
                            index += 1
                        }.padding(.bottom, 20)
                    case 3:
                        OBInterestSelectView()
                            .transition(AnyTransition.opacity.animation(.easeInOut(duration: duration)))
                        TempButton {
                            index += 1
                        }.padding(.bottom, 20)
                    case 4:
                        OBShoesSizeSelectView()
                            .transition(AnyTransition.opacity.animation(.easeInOut(duration: duration)))
                        TempButton {
                            index += 1
                        }.padding(.bottom, 20)
                    case 5:
                        OBAlarmView()
                            .transition(AnyTransition.opacity.animation(.easeInOut(duration: duration)))
                        TempButton {
                            index += 1
                        }.padding(.bottom, 20)
                    case 6:
                        OBLocationView()
                            .transition(AnyTransition.opacity.animation(.easeInOut(duration: duration)))
                        TempButton {
                            index += 1
                        }.padding(.bottom, 20)
                    case 7:
                        MainTabView()
                    default:
                        EmptyView()
                    }
                    
//                    TempButton {
//
//                        if index == 6 {
//                            index = 7
//                        }else {
//                            index += 1
//                        }
//                    }.padding(.bottom, 20)
                }
            }
        }
    }
}

struct OBView_Previews: PreviewProvider {
    static var previews: some View {
        OBView()
    }
}
