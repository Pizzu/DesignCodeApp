//
//  AuthView.swift
//  DesignCode
//
//  Created by Luca Lo Forte on 28/2/21.
//

import SwiftUI

struct AuthView: View {
    
    //General State
    @State private var isSignup : Bool = false
    @State private var isFocus : Bool = false
    @State private var showAlert : Bool = false
    @State private var alertMessage : String = "Something went wrong!"
    
    //Login State
    @State private var loginEmail : String = ""
    @State private var loginPassword : String = ""
    
    // Signup State
    @State private var signupUsername : String = ""
    @State private var signupEmail : String = ""
    @State private var signupPassword : String = ""
    
    var body: some View {
        ZStack {
            
            Color.black.ignoresSafeArea()
            
            ZStack {
                
                Color("background2")
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .edgesIgnoringSafeArea(.bottom)
                
                CoverView()
                
                
                LoginForm(email: self.$loginEmail, password: self.$loginPassword, isFocus: self.$isFocus)
                    .offset(x: self.isSignup ? UIScreen.main.bounds.width : 0, y: 160)
                    .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0), value: self.isSignup)
                

                SignupForm(username: self.$signupUsername, email: self.$signupEmail, password: self.$signupPassword, isFocus: self.$isFocus)
                    .offset(x: self.isSignup ? 0 : UIScreen.main.bounds.width, y: 160)
                    .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0), value: self.isSignup)
                
                
                VStack {
                    
                    Spacer()
                    
                    if self.isSignup {
                        SignupButtons(isSignup: self.$isSignup, showAlert: self.$showAlert, alertMessage: self.$alertMessage, isFocus: self.$isFocus)
                    } else {
                        LoginButtons(isSignup: self.$isSignup, showAlert: self.$showAlert, alertMessage: self.$alertMessage, isFocus: self.$isFocus)
                    }
                    
                }
                
            }
            .offset(y: self.isFocus ? -300 : 0)
            .animation(.easeInOut, value: self.isFocus)
            .onTapGesture {
                self.isFocus = false
                self.hideKeyboard()
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
