import Foundation
import SwiftUI

enum ProfileViewModel: Int, CaseIterable {
    case orders
    case pass
    case events
    case settings
    
    var title: String {
        switch self {
        case .orders: return "oreders"
        case .pass: return "pass"
        case .events: return "events"
        case .settings: return "settings"
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
            return AnyView(OrdersView())
        default:
            return AnyView(EmptyView())
//        case .pass:
//            return AnyView(SettingsView())
//        case .events:
//            return AnyView(SettingsView())
//        case .settings:
//            return AnyView(SettingsView())
        }
    }
}
