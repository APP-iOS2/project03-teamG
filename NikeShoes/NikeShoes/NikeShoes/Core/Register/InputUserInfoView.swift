//
//  InputUserInfoView.swift
//  NikeShoes
//
//  Created by yunjikim on 2023/09/05.
//

import SwiftUI

struct InputUserInfoView: View {
    @Binding var index: Int
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var password: String = ""
    @State private var birthPicker = Date()
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
    
    @State private var isBirthValid: Bool = true
    
    @State private var checkAgreePrivacyPolicyandTerms: Bool = true
    
    @State private var cautionFirstName: String = ""
    @State private var cautionLastName: String = ""
    @State private var cautionPassword: String = ""
    @State private var cautionBirth: String = ""
    
    var birthFormat: String {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter.string(from: birthPicker)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("이제 나이키 멤버가 되어볼까요?")
                    .font(.mediumBold24)
                    .padding(.bottom, 12)
                
                NameTextField
                
                PasswordTextField
                
                BirthPicker
                
                AgreePrivacyPolicyandTerms
                
                ButtonView(buttonText: "계속", foreground: .white, background: .black) {
                    if !firstName.isEmpty && !lastName.isEmpty && isValidPassword(password) && isCheckAgreePrivacyPolicyandTerms() {
                        index += 1
                    } else {
                        isCheckFirstName()
                        isCheckLastName()
                        isEmptyPassword()
                        isCheckPasswordCount()
                        isCheckPasswordCombination()
                        isCheckBirth()
                    }
                    if !isCheckAgreePrivacyPolicyandTerms() {
                        checkAgreePrivacyPolicyandTerms = false
                    }
                }
            }
        }
        .padding(.horizontal)
    }
    
    // MARK: - name
    var NameTextField: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(alignment: .leading) {
                TextField("이름", text: $firstName)
                    .modifier(SignInTextFieldStyle(isTextFieldValid: $isFirstNameValid))
                    .onChange(of: firstName) { newValue in
                        isCheckFirstName()
                        firstName = newValue.trimmingCharacters(in: .whitespaces)
                    }
                Text(cautionFirstName)
                    .foregroundColor(.red)
            }
            
            VStack(alignment: .leading) {
                TextField("성", text: $lastName)
                    .modifier(SignInTextFieldStyle(isTextFieldValid: $isLastNameValid))
                    .onChange(of: lastName) { newValue in
                        isCheckLastName()
                        lastName = newValue.trimmingCharacters(in: .whitespaces)
                    }
                Text(cautionLastName)
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
            
            HStack {
                Image(systemName: isRightPasswordCountEightSymbol)
                Text("최소 8자")
            }
            .font(.regular12)
            .foregroundColor(isRightPasswordCountEightColor)
            .onChange(of: password) { newValue in
                isEmptyPassword()
                isCheckPasswordCount()
                isCheckPasswordCombination()
                password = newValue.trimmingCharacters(in: .whitespaces)
            }
            
            HStack {
                Image(systemName: isRightPasswordCombinationSymbol)
                Text("알파벳 대문자 및 소문자 조합, 최소 1개 이상의 숫자")
            }
            .font(.regular12)
            .foregroundColor(isRightPasswordCombinationColor)
        }
        .padding(.bottom, 12)
    }
    // MARK: - birth
    var BirthPicker: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(birthFormat)
                Spacer()
                Image(systemName: "calendar")
                    .overlay {
                        DatePicker("birth", selection: $birthPicker, displayedComponents: .date)
                            .blendMode(.destinationOver)
                            .onChange(of: birthPicker, perform: { newValue in
                                isCheckBirth()
                                birthPicker = newValue
                            })
                    }
            }
            .modifier(SignInTextFieldStyle(isTextFieldValid: $isBirthValid))
            
            Text(cautionBirth)
                .foregroundColor(.red)
        }
        .padding(.bottom, 20)
    }
    
    // MARK: - AgreePrivacyPolicyandTerms
    var AgreePrivacyPolicyandTerms: some View {
        VStack {
            Button {
                isAgreePrivacyPolicyandTerms.toggle()
            } label: {
                HStack(alignment: .top) {
                    Image(systemName: isAgreePrivacyPolicyandTerms ? "checkmark.square.fill" : "square")
                    Text ("나이키의 개인정보 처리방침 및 이용약관에 동의합니다.")
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
    
    func isCheckLastName() {
        if lastName.isEmpty {
            isLastNameValid = false
            cautionLastName = "필수"
        } else {
            isLastNameValid = true
            cautionLastName = ""
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
    func isCheckBirth() {
        if birthPicker > Date() {
            cautionBirth = "잘못된 생년월일입니다"
            isBirthValid = false
        } else {
            cautionBirth = ""
            isBirthValid = true
        }
    }
    
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

struct InputUserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        InputUserInfoView(index: .constant(2))
    }
}
