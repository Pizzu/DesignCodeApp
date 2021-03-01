//
//  AuthView.swift
//  DesignCode
//
//  Created by Luca Lo Forte on 28/2/21.
//

import SwiftUI
import SwiftUIX

struct AuthView: View {
    
    @State private var isFocus : Bool = false
    @State private var showAlert : Bool = false
    @State private var alertMessage : String = "Something went wrong!"
    
    @State private var email : String = ""
    @State private var password : String = ""
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    var body: some View {
        ZStack {
            
            Color.black.ignoresSafeArea()
            
            ZStack {
                
                Color("background2")
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .edgesIgnoringSafeArea(.bottom)
                
                CoverView()
                
                VStack {
                    HStack {
                        Image(systemName: "person.crop.circle.fill")
                            .foregroundColor(Color(#colorLiteral(red: 0.6549019608, green: 0.7137254902, blue: 0.862745098, alpha: 1)))
                            .frame(width: 44, height: 44)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 5)
                            .padding(.leading)
                        
                        TextField("Your Email".uppercased(), text: self.$email)
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
                .offset(y: 160)
                
                VStack {
                    
                    Spacer()
                    
                    HStack {
                        Text("Forgot Password?")
                            .font(.subheadline)
                        
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
                            Alert(title: Text("Error"), message: Text(self.alertMessage), dismissButton: .default(Text("Ok")))
                        })
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
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

struct CoverView: View {
    
    @State private var show : Bool = false
    @State private var isDragging : Bool = false
    @State private var dragPosition : CGSize = CGSize.zero
    
    var body: some View {
        VStack {
            VStack(spacing: 15.0) {
                Text("Learn design & code.\nFrom scratch.")
                    .font(.largeTitle, weight: .bold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .offset(x: self.dragPosition.width / 15, y: self.dragPosition.height / 15)
                
                Text("80 hours of courses of SwiftUI, React and design tools.")
                    .font(.subheadline)
                    .frame(width: 250)
                    .multilineTextAlignment(.center)
                    .offset(x: self.dragPosition.width / 20, y: self.dragPosition.height / 20)
                
                Spacer()
            }
            .padding(.top, 100)
            .frame(height: 477)
            .frame(maxWidth: .infinity)
            .background(
                Image(uiImage: #imageLiteral(resourceName: "Card3"))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 500)
                    .offset(x: self.dragPosition.width / 25, y: self.dragPosition.height / 25)
                ,
                alignment: .bottom
            )
            .background(
                Image(uiImage: #imageLiteral(resourceName: "Blob"))
                    .offset(x: -150, y: -200)
                    .rotationEffect(Angle(degrees: self.show ? 360+90 : 90))
                    .blendMode(.plusDarker)
                    .animation(Animation.linear(duration: 120).repeatForever(autoreverses: false), value: self.show)
            )
            .background(
                Image(uiImage: #imageLiteral(resourceName: "Blob"))
                    .offset(x: -200, y: -250)
                    .rotationEffect(Angle(degrees: self.show ? 360 : 0), anchor:.center)
                    .blendMode(.overlay)
                    .animation(Animation.linear(duration: 100).repeatForever(autoreverses: false), value: self.show)
            )
            .background(Color(#colorLiteral(red: 0.4117647059, green: 0.4705882353, blue: 1, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .scaleEffect(self.isDragging ? 0.92 : 1)
            .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
            .rotation3DEffect(
                Angle(degrees: 5),
                axis: (x: self.dragPosition.width, y: self.dragPosition.height, z: 0)
            )
            .gesture(
                DragGesture().onChanged { value in
                    self.dragPosition = value.translation
                    self.isDragging = true
                }
                .onEnded { value in
                    self.dragPosition = .zero
                    self.isDragging = false
                }
            )
            
            Spacer()
        }
    }
}
