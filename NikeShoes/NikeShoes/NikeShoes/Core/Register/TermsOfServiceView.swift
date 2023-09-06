//
//  TermsOfServiceView.swift
//  NikeShoes
//
//  Created by yunjikim on 2023/09/05.
//

import SwiftUI

struct TermsOfServiceView: View {
    @State private var isAllAgree: Bool = false
    @State private var isAgreeTermsOfService: Bool = false
    @State private var isAgreeCollectPersonalInfo: Bool = false
    @State private var isAgreeThirdParties: Bool = false
    
    var body: some View {
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
        }
        .padding(.horizontal)
    }
    
    var agreeGroup: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: isAllAgree ? "checkmark.square.fill" : "square")
                    .onTapGesture {
                        isAllAgree.toggle()
                    }
                Text ("모든 약관에 동의합니다.")
            }
            
            Divider()
                .padding(.vertical)
            
            HStack {
                Image(systemName: isAllAgree || isAgreeTermsOfService ? "checkmark.square.fill" : "square")
                    .onTapGesture {
                        isAgreeTermsOfService.toggle()
                    }
                Text ("이용약관에 동의합니다 *")
            }
            
            HStack {
                Image(systemName: isAllAgree || isAgreeCollectPersonalInfo ? "checkmark.square.fill" : "square")
                    .onTapGesture {
                        isAgreeCollectPersonalInfo.toggle()
                    }
                Text ("개인 정보 수집 및 이용에 동의합니다. *")
            }
            
            HStack(alignment: .top) {
                Image(systemName: isAllAgree || isAgreeThirdParties ? "checkmark.square.fill" : "square")
                    .onTapGesture {
                        isAgreeThirdParties.toggle()
                    }
                Text ("개인 정보의 제3자 제공 및 국외 이전에 동의합니다. *")
            }
        }
    }
}

struct TermsOfServiceView_Previews: PreviewProvider {
    static var previews: some View {
        TermsOfServiceView()
    }
}
