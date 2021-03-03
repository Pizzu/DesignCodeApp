//
//  LoginButtons.swift
//  DesignCode
//
//  Created by Luca Lo Forte on 3/3/21.
//

import SwiftUI

struct LoginButtons: View {
    
    @EnvironmentObject var userStore : UserStore
    
    @Binding var email : String
    @Binding var password : String
    @Binding var isSignup : Bool
    @Binding var showAlert : Bool
    @Binding var alertMessage : String
    @Binding var isFocus : Bool
    @Binding var isLoading : Bool
    @Binding var isSuccesful : Bool
    
    private func login() {
        self.isFocus = false
        self.isLoading = true
        
        userStore.signinUser(email: self.email, password: self.password) { (response) in
            self.isLoading = false
            if response.errorMessage != nil {
                self.alertMessage = response.errorMessage!
                self.showAlert = true
            } else {
                self.isSuccesful = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.isSuccesful = false
                    self.email = ""
                    self.password = ""
                }
            }
        }
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5.0) {
                Text("Sign up")
                    .font(.headline)
                    .onTapGesture {
                        self.isSignup = true
                    }
                
                Text("Forgot Password?")
                    .font(.subheadline)
            }
            
            Spacer()
            
            Button(action: {
                self.hideKeyboard()
                self.login()
            }) {
                Text("Log in").foregroundColor(.black)
            }
            .padding(12)
            .padding(.horizontal, 30)
            .background(Color(#colorLiteral(red: 0, green: 0.7529411765, blue: 1, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: Color(#colorLiteral(red: 0, green: 0.7529411765, blue: 1, alpha: 1)).opacity(0.3), radius: 20, x: 0.0, y: 20)
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("Error Sign in"), message: Text(self.alertMessage), dismissButton: .default(Text("Ok")))
            })
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}

struct LoginButtons_Previews: PreviewProvider {
    static var previews: some View {
        LoginButtons(email: .constant(""), password: .constant(""), isSignup: .constant(false), showAlert: .constant(false), alertMessage: .constant(""), isFocus: .constant(false), isLoading: .constant(false), isSuccesful: .constant(false))
    }
}
