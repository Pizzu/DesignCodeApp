//
//  FormsView.swift
//  DesignCode
//
//  Created by Luca Lo Forte on 1/3/21.
//

import SwiftUI
import SwiftUIX

struct LoginForm: View {
    
    @Binding var email : String
    @Binding var password : String
    @Binding var isFocus : Bool
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "mail.fill")
                    .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                    .frame(width: 44, height: 44)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                    .padding(.leading)
                
                TextField("Email".uppercased(), text: self.$email)
                    .keyboardType(.emailAddress)
                    .font(.subheadline)
                    .padding(.leading)
                    .frame(height: 44)
                    .onTapGesture {
                        self.isFocus = true
                    }
            }
            
            Divider().padding(.leading, 76)
            
            HStack {
                Image(systemName: "lock.fill")
                    .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                    .frame(width: 44, height: 44)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                    .padding(.leading)
                
                SecureField("Password".uppercased(), text: self.$password)
                    .keyboardType(.default)
                    .font(.subheadline)
                    .padding(.leading)
                    .frame(height: 44)
                    .onTapGesture {
                        self.isFocus = true
                    }
            }
        }
        .frame(height: 136)
        .frame(maxWidth: .infinity)
        .background(BlurEffectView(style: .systemMaterial))
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: Color.black.opacity(0.15), radius: 20, x: 0, y: 20)
        .padding(.horizontal)
    }
}

struct SignupForm: View {
    
    @Binding var username : String
    @Binding var email : String
    @Binding var password : String
    @Binding var isFocus : Bool
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.crop.circle.fill")
                    .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                    .frame(width: 44, height: 44)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                    .padding(.leading)
                
                TextField("Username".uppercased(), text: self.$username)
                    .keyboardType(.emailAddress)
                    .font(.subheadline)
                    .padding(.leading)
                    .frame(height: 44)
                    .onTapGesture {
                        self.isFocus = true
                    }
            }
            
            Divider().padding(.leading, 76)
            
            HStack {
                Image(systemName: "mail.fill")
                    .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                    .frame(width: 44, height: 44)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                    .padding(.leading)
                
                TextField("Email".uppercased(), text: self.$email)
                    .keyboardType(.emailAddress)
                    .font(.subheadline)
                    .padding(.leading)
                    .frame(height: 44)
                    .onTapGesture {
                        self.isFocus = true
                    }
            }
            
            Divider().padding(.leading, 76)
            
            HStack {
                Image(systemName: "lock.fill")
                    .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                    .frame(width: 44, height: 44)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                    .padding(.leading)
                
                SecureField("Password".uppercased(), text: self.$password)
                    .keyboardType(.default)
                    .font(.subheadline)
                    .padding(.leading)
                    .frame(height: 44)
                    .onTapGesture {
                        self.isFocus = true
                    }
            }
        }
        .frame(height: 180)
        .frame(maxWidth: .infinity)
        .background(BlurEffectView(style: .systemMaterial))
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: Color.black.opacity(0.15), radius: 20, x: 0, y: 20)
        .padding(.horizontal)
    }
}

struct LoginButtons: View {
    
    @Binding var isSignup : Bool
    @Binding var showAlert : Bool
    @Binding var alertMessage : String
    @Binding var isFocus : Bool
    
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
                self.showAlert = true
                self.isFocus = false
                self.hideKeyboard()
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

struct SignupButtons: View {
    
    @Binding var isSignup : Bool
    @Binding var showAlert : Bool
    @Binding var alertMessage : String
    @Binding var isFocus : Bool
    
    var body: some View {
        HStack {
            
            VStack(alignment: .leading, spacing: 5.0) {
                Text("Sign in")
                    .font(.headline)
                    .onTapGesture {
                        self.isSignup = false
                    }
                
                Text("Have an account yet?")
                    .font(.subheadline)
            }
                
            Spacer()
            
            Button(action: {
                self.showAlert = true
                self.isFocus = false
                self.hideKeyboard()
            }) {
                Text("Sign up").foregroundColor(.black)
            }
            .padding(12)
            .padding(.horizontal, 30)
            .background(Color(#colorLiteral(red: 0, green: 0.7529411765, blue: 1, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .shadow(color: Color(#colorLiteral(red: 0, green: 0.7529411765, blue: 1, alpha: 1)).opacity(0.3), radius: 20, x: 0.0, y: 20)
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("Error Sign up"), message: Text(self.alertMessage), dismissButton: .default(Text("Ok")))
            })
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}
