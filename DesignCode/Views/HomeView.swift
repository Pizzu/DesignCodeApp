//
//  HomeView.swift
//  DesignCode
//
//  Created by Luca Lo Forte on 15/2/21.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showProfile : Bool = false
    @State private var menuPosition : CGSize = CGSize.zero
    
    var body: some View {
        ZStack {
            
            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text("Watching")
                        .font(.system(size: 28, weight: .bold))
                    
                    Spacer()
                    
                    Button(action: {
                        self.showProfile.toggle()
                    }, label: {
                        Image("Avatar")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 36, height: 36)
                            .clipShape(Circle())
                    })
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                Spacer()
            }
            .padding(.top, 44)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .offset(y: self.showProfile ? -450: 0)
            .scaleEffect(self.showProfile ? 0.9 : 1)
            .rotation3DEffect(Angle(degrees: self.showProfile ? -10 : 0), axis: (x: 10, y: 0, z: 0))
            .animation(.easeInOut)
            .edgesIgnoringSafeArea(.all)
            
            MenuView()
                .offset(y: self.showProfile ? 0 : UIScreen.main.bounds.height)
                .offset(y: self.menuPosition.height)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .gesture(
                    DragGesture().onChanged({ (value) in
                        self.menuPosition = value.translation
                    })
                    .onEnded({ (value) in
                        if self.menuPosition.height > 50 {
                            self.showProfile = false
                        }
                        self.menuPosition = .zero
                    })
                )
            
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
