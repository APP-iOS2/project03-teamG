//
//  AdminLoginView.swift
//  NikeShoesAdmin
//
//  Created by kaikim on 2023/09/11.
//

import SwiftUI

import SwiftUI

struct AdminLoginView: View {
    @State var forNextView:Bool = false
    
    @State private var firstName: String = ""
   
    @State private var password: String = ""

    @State private var isAgreePrivacyPolicyandTerms: Bool = false
    
    @State private var isFirstNameValid: Bool = true
    @State private var isLastNameValid: Bool = true
    
    @State private var isPasswordValid: Bool = true
    @State private var isPasswordCountEight: Bool = true
    @State private var isPasswordCombination: Bool = true
    @State private var isRightPasswordCountEightSymbol: String = "xmark"
    @State private var isRightPasswordCountEightColor: Color = .gray
    @State private var isRightPasswordCombinationSymbol: String = "xmark"
    @State private var isRightPasswordCombinationColor: Color = .gray
    @State private var showPassword: Bool = false
    
  
    
    @State private var checkAgreePrivacyPolicyandTerms: Bool = true
    
    @State private var cautionFirstName: String = ""
    @State private var cautionLastName: String = ""
    @State private var cautionPassword: String = ""

    var body: some View {
        NavigationStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.clear)
                .frame(width: 500)
                .padding(.vertical)
            //                .fill(.white)
            
                .overlay {
                    VStack(alignment: .leading) {
                        Text("관리자 계정 로그인")
                            .padding(.bottom, 12)
                        
                        NameTextField
                        
                        PasswordTextField
                        
                        AgreePrivacyPolicyandTerms
                        
                        HStack {
                            Spacer()
                            
                            ButtonView(buttonText: "계속", foreground: .white, background: .black) {
                                forNextView = true
                            }
                            Spacer()
                        }
                    }
                    .padding(.horizontal, 30)
                }
                .padding(.vertical, 50)
        }
        .fullScreenCover(isPresented: $forNextView) {
            ContentView()
        }
        //.navigationBarBackButtonHidden()
        
        .padding(.horizontal)
    }
    
    // MARK: - name
    var NameTextField: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(alignment: .leading) {
                TextField("아이디", text: $firstName)
                    .modifier(SignInTextFieldStyle(isTextFieldValid: $isFirstNameValid))
                    .onChange(of: firstName) { newValue in
                        isCheckFirstName()
                        firstName = newValue.trimmingCharacters(in: .whitespaces)
                    }
                Text(cautionFirstName)
                    .foregroundColor(.red)
            }
            
 
        }
    }
    
    // MARK: - password
    var PasswordTextField: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                if showPassword {
                    TextField("비밀번호", text: $password)
                } else {
                    SecureField("비밀번호", text: $password)
                }
                
                Button {
                    self.showPassword.toggle()
                } label: {
                    if showPassword == true {
                        Image(systemName: "eye")
                            .foregroundColor(.black)
                    } else if showPassword == false {
                        Image(systemName: "eye.slash")
                            .foregroundColor(.black)
                    }
                }
            }
            .modifier(SignInTextFieldStyle(isTextFieldValid: $isPasswordValid))
            
            Text(cautionPassword)
                .foregroundColor(.red)
        }
        .padding(.bottom, 12)
    }
  
    // MARK: - AgreePrivacyPolicyandTerms
    var AgreePrivacyPolicyandTerms: some View {
        VStack {
            Button {
                isAgreePrivacyPolicyandTerms.toggle()
            } label: {
                HStack(alignment: .top) {
                    Image(systemName: isAgreePrivacyPolicyandTerms ? "checkmark.square.fill" : "square")
                    Text ("나이키 관리자 계정운영 및 이용약관에 동의합니다.")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(checkAgreePrivacyPolicyandTerms ? .primary : .red)
                        .onChange(of: isAgreePrivacyPolicyandTerms) { _ in
                            if isAgreePrivacyPolicyandTerms {
                                checkAgreePrivacyPolicyandTerms = true
                            }
                        }
                }
                .foregroundColor(.primary)
            }
        }
        .padding(.bottom, 45)
    }
    
    // MARK: - name function
    func isCheckFirstName() {
        if firstName.isEmpty {
            isFirstNameValid = false
            cautionFirstName = "필수"
        } else {
            isFirstNameValid = true
            cautionFirstName = ""
        }
    }
    
    // MARK: - password function
    func isEmptyPassword() {
        if password.isEmpty {
            isPasswordValid = false
            cautionPassword = "필수"
        } else {
            isPasswordValid = true
            cautionPassword = ""
        }
    }
    
    func isCheckPasswordCount() {
        if password.count < 8 {
            isRightPasswordCountEightSymbol = "xmark"
            isRightPasswordCountEightColor = .red
            isPasswordCountEight = false
        } else {
            isRightPasswordCountEightSymbol = "checkmark"
            isRightPasswordCountEightColor = .green
            isPasswordCountEight = true
        }
    }
    
    func isCheckPasswordCombination() {
        if isValidPassword(password) {
            isRightPasswordCombinationSymbol = "checkmark"
            isRightPasswordCombinationColor = .green
            isPasswordCombination = true
        } else {
            isRightPasswordCombinationSymbol = "xmark"
            isRightPasswordCombinationColor = .red
            isPasswordCombination = false
        }
    }
    
    func isValidPassword(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{8,}$"
        let passwordPredicate = NSPredicate(format:"SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }
    
    // MARK: - birth function
   
    // MARK: - agree function
    func isCheckAgreePrivacyPolicyandTerms() -> Bool {
        if isAgreePrivacyPolicyandTerms {
            checkAgreePrivacyPolicyandTerms = true
            return true
        } else {
            checkAgreePrivacyPolicyandTerms = false
            return false
        }
    }
        
}

struct AdminLoginView_Previews: PreviewProvider {
    static var previews: some View {
        AdminLoginView()
    }
}
