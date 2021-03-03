//
//  LoginForm.swift
//  DesignCode
//
//  Created by Luca Lo Forte on 3/3/21.
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

struct LoginForm_Previews: PreviewProvider {
    static var previews: some View {
        LoginForm(email: .constant(""), password: .constant(""), isFocus: .constant(false))
    }
}
