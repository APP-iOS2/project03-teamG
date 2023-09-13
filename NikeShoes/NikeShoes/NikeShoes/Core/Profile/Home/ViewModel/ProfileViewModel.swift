import Foundation
import SwiftUI

enum ProfileViewModel: Int, CaseIterable {
    case orders
    case pass
    case events
    case settings
    
    var title: String {
        switch self {
        case .orders: return "주문내역"
        case .pass: return "패스"
        case .events: return "이벤트"
        case .settings: return "셋팅"
        }
    }
    
    var imageName: String {
        switch self {
        case .orders: return "creditcard.fill"
        case .pass: return "hand.raised.square.on.square.fill"
        case .events: return "calendar"
        case .settings: return "gearshape"
        }
    }
}

extension ProfileViewModel {
    var destinationView: some View {
        switch self {
        case .orders:
            return AnyView(OrdersView(title: "주문내역"))
        case .settings:
            return AnyView(SettingsView())
        default:
            return AnyView(EmptyView())
//        case .pass:
//            return AnyView(SettingsView())
//        case .events:
//            return AnyView(SettingsView())
        }
    }
}
