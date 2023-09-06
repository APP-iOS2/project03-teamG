//
//  SettingsViewModel.swift
//  NikeShoes
//
//  Created by 이희찬 on 2023/09/05.
//

import Foundation
import SwiftUI

enum SettingsViewModel: Int, CaseIterable {
    case email
    case phoneNumber
    case birth
    case manageAddress
    case location
    case language
    case settingLocation
    case notification
    case manageInfo
    case profilePublish
    case findShop
    case customerㄴervice
    
    var title: String {
        switch self {
        case .email : return "이메일"
        case .phoneNumber : return "휴대폰 번호"
        case .birth : return "생년월일"
        case .manageAddress : return "배송지 관리"
        case .location : return "국가 / 지역"
        case .language : return "언어"
        case .settingLocation: return "위치 설정"
        case .notification : return "알림"
        case .manageInfo : return "개인 정보 관리"
        case .profilePublish : return "프로필 공개 설정"
        case .findShop : return "매장 찾기"
        case .customerㄴervice : return "고객센터"
        }
    }
    
}

extension SettingsViewModel {
    var destinationView: some View {
        switch self {
        case .email:
            return AnyView(EmailView(title: self.title))
        case .phoneNumber:
            return AnyView(PhonNumberView(title: self.title))
        case .birth:
            return AnyView(EmptyView())
        case .manageAddress:
            return AnyView(ManageAdress(title: self.title))
        case .location:
            return AnyView(LocationView(title: self.title))
        case .language:
            return AnyView(LanguageView(title: self.title))
            // 여기부터 하자
        case .settingLocation:
            return AnyView(SettingLocationView(title: self.title))
        case .notification:
            return AnyView(NotificationView(title: self.title))
        case .manageInfo:
            return AnyView(ManageInfoView(title: self.title))
        case .profilePublish:
            return AnyView(ProfilePublishView(title: self.title))
        case .findShop:
            return AnyView(FindShopView(title: self.title))
        case .customerㄴervice:
            return AnyView(CustomerServiceView(title: self.title))
        }
    }
}
