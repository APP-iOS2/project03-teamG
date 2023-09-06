//
//  EmailView.swift
//  NikeShoes
//
//  Created by 이희찬 on 2023/09/05.
//

import SwiftUI

struct EmailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let title: String
    
    @State private var newEmail: String = ""
    @State private var confirmEmail: String = ""
    
    @State private var canEditEmail: Bool = false
    
    var body: some View {
        VStack{
            
            Divider()
            
            Text("Your current account email address is:")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.top)
            
            Text("lhchan4010\("@")gmail.com")
                .padding(1)
            
            VStack {
                TextField("New Email", text: $newEmail)
                    .padding(15)
                    .background(Color.white)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 0.5))
                    .padding(.top)
                TextField("ConfirmEmail", text: $confirmEmail)
                    .padding(15)
                    .background(Color.white)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 0.5))
                    .padding(.top, 7)
            }
            .padding()
            .onChange(of: [newEmail, confirmEmail]) { _ in
                isConfirm(new: newEmail, confirm: confirmEmail)
            }
            
            CustomButton(
                background: canEditEmail ? Color.black : Color.gray.opacity(0.3),
                foregroundColor: canEditEmail ? Color.white : Color.black.opacity(0.5),
                title: "Done"
            ) {
                // mark: email update logic ----------------
                self.presentationMode.wrappedValue.dismiss()
            }
            .disabled(!canEditEmail)
            
            Spacer()
            
        }
        .modifier(NavigationNikeSetting(title: title))
    }
    
    func isConfirm(new: String, confirm: String) {
        if !new.isEmpty && !confirm.isEmpty {
            canEditEmail = (new == confirm)
            return
        }
        canEditEmail = false
        return
    }
}

struct EmailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            EmailView(title: "Email")
        }
    }
}
