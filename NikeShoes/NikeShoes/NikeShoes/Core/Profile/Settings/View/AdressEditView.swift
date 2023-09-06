struct UserInfo {
    var name: String
    var PhoneNumber: String
}

import SwiftUI

struct AdressEditView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let title: String
    
    @State private var name: String = ""
    
    var body: some View {
        VStack{
            Divider()
            
            // User Info
            VStack{
                TextField("이름", text: $name)
                    .padding(15)
                    .background(Color.white)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 0.5))
                    .padding()
            }
            .padding(.top)
            
            Spacer()
            
            CustomButton(
                background: .black,
                foregroundColor: .white,
                title: "배송지 추가",
                action: {})
        }
        .modifier(NavigationNikeSetting(title: title))
    }
    
}

struct AdressEditView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            AdressEditView(title: "배송지 수정")
        }
    }
}
