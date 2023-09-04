import SwiftUI

struct GenderTabBarView: View {
    @State private var selectedTab = 0

    var body: some View {
        VStack {
            HStack {
                ForEach(GenderTab.allCases, id: \.self) { tab in
                    Button(action: {
                        selectedTab = tab.rawValue
                    }) {
                        Text(tab.title)
                            .padding()
                            .background(selectedTab == tab.rawValue ? Color.blue : Color.clear)
                            .foregroundColor(selectedTab == tab.rawValue ? .white : .blue)
                            .cornerRadius(8)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            
            Divider()
            
            switch selectedTab {
            case 0:
                ShopView()
            case 1:
                Text("여성")
            case 2:
                Text("키즈")
            default:
                Text("남성")
            }
        }
    }
}

enum GenderTab: Int, CaseIterable {
    case male, female, others

    var title: String {
        switch self {
        case .male:
            return "남성"
        case .female:
            return "여성"
        case .others:
            return "키즈"
        }
    }
}

struct GenderTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        GenderTabBarView()
    }
}
