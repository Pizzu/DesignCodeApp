//
//  ButtonsView.swift
//  DesignCode
//
//  Created by Luca Lo Forte on 26/2/21.
//

import SwiftUI

struct ButtonsView: View {
    
    var body: some View {
        VStack(spacing: 50) {
            RectangleButton()
            
            CircleButton()
            
            PayButton()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(#colorLiteral(red: 0.8539622744, green: 0.8864560573, blue: 0.9259157777, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView()
    }
}

struct RectangleButton: View {
    
    @State private var tap : Bool = false
    @State private var press : Bool = false
    
    var body: some View {
        Text("Button")
            .font(.system(size: 20, weight: .semibold, design: .rounded))
            .frame(width: 200, height: 60)
            .background(
                ZStack {
                    Color(self.press ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1))
                    
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .foregroundColor(Color(self.press ? #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                        .blur(radius: 4)
                        .offset(x: -8, y: -8)
                    
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8378019831, green: 0.8869340841, blue: 0.9651905136, alpha: 1)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .padding(2)
                        .blur(radius: 2)
                }
            )
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .shadow(color: self.press ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)) , radius: 20, x: 20, y: 20)
            .shadow(color: self.press ? Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)) : Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 20, x: -20, y: -20)
            .overlay(
                HStack {
                    Image(systemName: "person.crop.circle")
                        .font(.system(size: 24, weight: .light))
                        .foregroundColor(Color.white.opacity(self.press ? 0 : 1))
                        .frame(width: self.press ? 64 : 54, height: self.press ? 4 : 50)
                        .background(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                        .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).opacity(0.3), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 10, y: 10)
                        .offset(x: self.press ? 70 : -10, y: self.press ? 16 : 0)
                    
                    Spacer()
                }
            )
            .scaleEffect(self.tap ? 1.2 : 1)
            .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0))
            .gesture(
                LongPressGesture(minimumDuration: 0.5, maximumDistance: 10)
                    .onChanged { value in
                        self.tap = value
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            self.tap = false
                        }
                    }
                    .onEnded { value in
                        self.press.toggle()
                    }
            )
    }
}

struct CircleButton: View {
    
    @State private var tap : Bool = false
    @State private var press : Bool = false
    
    var body: some View {
        ZStack {
            Image(systemName: "sun.max")
                .font(.system(size: 44, weight: .light))
                .offset(x: self.press ? -90 : 0, y: self.press ? -90 : 0)
            
            Image(systemName: "moon")
                .font(.system(size: 44, weight: .light))
                .offset(x: self.press ? 0 : 90 , y: self.press ? 0 : 90)
        }
        .frame(width: 100, height: 100)
        .background(
            ZStack {
                Color(self.press ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1))
                
                Circle()
                    .foregroundColor(Color(self.press ? #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                    .blur(radius: 4)
                    .offset(x: -8, y: -8)
                    
                
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.white, Color(#colorLiteral(red: 0.8378019831, green: 0.8869340841, blue: 0.9651905136, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .padding(2)
                    .blur(radius: 2)
            }
        )
        .clipShape(Circle())
        .shadow(color: self.press ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)) , radius: 20, x: 20, y: 20)
        .shadow(color: self.press ? Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)) : Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 20, x: -20, y: -20)
        .scaleEffect(self.tap ? 1.2 : 1)
        .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0))
        .gesture(
            LongPressGesture(minimumDuration: 0.5, maximumDistance: 10)
                .onChanged { value in
                    self.tap = value
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        self.tap = false
                    }
                }
                .onEnded { value in
                    self.press.toggle()
                }
        )
    }
}

struct PayButton: View {
    
    @GestureState private var tap : Bool = false
    @State private var press : Bool = false
    
    var body: some View {
        ZStack {
            Image("fingerprint")
                .opacity(self.press ? 0 : 1)
                .scaleEffect(self.press ? 0 : 1)
            
            Image("fingerprint-2")
                .clipShape(Rectangle().offset(y: self.tap ? 0 : 50))
                .opacity(self.press ? 0 : 1)
                .scaleEffect(self.press ? 0 : 1)
                .animation(.easeInOut, value: self.tap)
            
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 44, weight: .light))
                .foregroundColor(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
                .opacity(self.press ? 1 : 0)
                .scaleEffect(self.press ? 1 : 0)

        }
        .frame(width: 120, height: 120)
        .background(
            ZStack {
                Color(self.press ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1))
                
                Circle()
                    .foregroundColor(Color(self.press ? #colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                    .blur(radius: 4)
                    .offset(x: -8, y: -8)
                    
                
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.white, Color(#colorLiteral(red: 0.8378019831, green: 0.8869340841, blue: 0.9651905136, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .padding(2)
                    .blur(radius: 2)
            }
        )
        .clipShape(Circle())
        .overlay(
            Circle()
                .trim(from: 0, to: self.tap ? 1 : 0)
                .stroke(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), lineWidth: 5)
                .frame(width: 88, height: 88)
                .rotationEffect(Angle(degrees: -90))
                .animation(.easeInOut, value: self.tap)
            
        )
        .shadow(color: self.press ? Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)) : Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)) , radius: 20, x: 20, y: 20)
        .shadow(color: self.press ? Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)) : Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 20, x: -20, y: -20)
        .scaleEffect(self.tap ? 1.2 : 1)
        .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0))
        .gesture(
            LongPressGesture()
                .updating(self.$tap) { currentState, gestureState, transaction in
                    
                    gestureState = currentState
                    
                }
                .onEnded { value in
                    self.press.toggle()
                    UINotificationFeedbackGenerator().notificationOccurred(.success)
//                    UIImpactFeedbackGenerator(style: type).impactOccurred()
                }
        )
    }
}
