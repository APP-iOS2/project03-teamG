//
//  TermsOfServiceView.swift
//  NikeShoes
//
//  Created by yunjikim on 2023/09/05.
//

import SwiftUI

struct TermsOfServiceView: View {
    @Binding var index: Int
    
    @State private var isAllAgree: Bool = false
    @State private var isAgreeTermsOfService: Bool = false
    @State private var isAgreeCollectPersonalInfo: Bool = false
    @State private var isAgreeThirdParties: Bool = false
    
    @State private var checkAgreeTermsOfServic: Bool = true
    @State private var checkAgreeCollectPersonalInfo: Bool = true
    @State private var checkAgreeThirdParties: Bool = true
    
    @State private var cautionAgree: String = ""
    
    var checkAllAgree: String {
        if isAllAgree {
            return "checkmark.square.fill"
        } else if isAgreeTermsOfService && isAgreeCollectPersonalInfo && isAgreeThirdParties {
            return "checkmark.square.fill"
        } else {
            return "square"
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("계속 진행하시려면 아래 권한에 동의해 주세요.")
                    .font(.mediumBold24)
                    .padding(.bottom, 12)
                
                Text("* 필수 항목")
                    .font(.callout)
                    .foregroundColor(.gray)
                
                Text("나이키에 오신 것을 환영합니다! 법률 약관이 업데이트되었습니다. 진행하시기 전에 내용을 검토하고 동의해 주세요.")
                    .font(.regular12)
                    .foregroundColor(.gray)
                    .padding(.vertical, 20)
                
                agreeGroup
                
                Text("이 약관에 동의하지 않을 수 있지만, 그럴 경우 나이키 계정에 로그인할 수 없으며 새로운 계정을 생성할 수도 없습니다.")
                    .font(.regular12)
                    .foregroundColor(.gray)
                    .padding(.top, 25)
                    .padding(.bottom)
                
                ButtonView(buttonText: "계속", foreground: .white, background: .black) {
                    if isCheckAllAgree() {
                        index += 1
                    }
                }
                ButtonView(buttonText: "취소", foreground: .black, background: .white) {
                    index -= 1
                }
            }
            .padding(.horizontal)
        }
    }
    
    var agreeGroup: some View {
        VStack(alignment: .leading, spacing: 12) {
            Button {
                isAllAgree.toggle()
                pressedAllAgreeButton()
            } label: {
                HStack {
                    Image(systemName: checkAllAgree)
                    Text("모든 약관에 동의합니다.")
                }
                .foregroundColor(.primary)
            }
            
            Divider()
                .padding(.vertical)
            
            Button {
                isAgreeTermsOfService.toggle()
            } label: {
                HStack {
                    Image(systemName: isAgreeTermsOfService ? "checkmark.square.fill" : "square")
                    Text("이용약관에 동의합니다 *")
                        .foregroundColor(checkAgreeTermsOfServic ? .primary : .red)
                        .onChange(of: isAgreeTermsOfService) { _ in
                            if isAgreeTermsOfService {
                                checkAgreeTermsOfServic = true
                            }
                        }
                }
                .foregroundColor(.primary)
            }
            
            Button {
                isAgreeCollectPersonalInfo.toggle()
            } label: {
                HStack {
                    Image(systemName: isAgreeCollectPersonalInfo ? "checkmark.square.fill" : "square")
                    Text("개인 정보 수집 및 이용에 동의합니다. *")
                        .foregroundColor(checkAgreeCollectPersonalInfo ? .primary : .red)
                        .onChange(of: isAgreeCollectPersonalInfo) { _ in
                            if isAgreeCollectPersonalInfo {
                                checkAgreeCollectPersonalInfo = true
                            }
                        }
                }
                .foregroundColor(.primary)
            }
            
            Button {
                isAgreeThirdParties.toggle()
            } label: {
                HStack(alignment: .top) {
                    Image(systemName: isAgreeThirdParties ? "checkmark.square.fill" : "square")
                    Text("개인 정보의 제3자 제공 및 국외 이전에 동의합니다. *")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(checkAgreeThirdParties ? .primary : .red)
                        .onChange(of: isAgreeThirdParties) { _ in
                            if isAgreeThirdParties {
                                checkAgreeThirdParties = true
                            }
                        }
                }
                .foregroundColor(.primary)
            }
            
            Text(cautionAgree)
                .foregroundColor(.red)
        }
    }
    
    func pressedAllAgreeButton() {
        if isAllAgree {
            isAgreeTermsOfService = true
            isAgreeCollectPersonalInfo = true
            isAgreeThirdParties = true
        } else {
            isAgreeTermsOfService = false
            isAgreeCollectPersonalInfo = false
            isAgreeThirdParties = false
        }
    }
    
    func isCheckAllAgree() -> Bool {
        var checkAgree: Bool = false
        
        if isAllAgree {
            checkAgree = true
            checkAgreeTermsOfServic = true
            checkAgreeCollectPersonalInfo = true
            checkAgreeThirdParties = true
            cautionAgree = ""
        } else {
            cautionAgree = "오류: 계속하려면 모든 확인란을 선택해야 합니다."
        }
        
        if !isAgreeTermsOfService {
            checkAgree = false
            checkAgreeTermsOfServic = false
        } else {
            checkAgreeTermsOfServic = true
        }
        
        if !isAgreeCollectPersonalInfo {
            checkAgree = false
            checkAgreeCollectPersonalInfo = false
        } else {
            checkAgreeCollectPersonalInfo = true
        }
        
        if !isAgreeThirdParties {
            checkAgree = false
            checkAgreeThirdParties = false
        } else {
            checkAgreeThirdParties = true
        }
        
        return checkAgree
    }
}

struct TermsOfServiceView_Previews: PreviewProvider {
    static var previews: some View {
        TermsOfServiceView(index: .constant(1))
    }
}
