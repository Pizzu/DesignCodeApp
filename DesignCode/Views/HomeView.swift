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
                NavView(showProfile: $showProfile)
                
                HStack {
                    HStack(spacing: 12.0) {
                        RingView(color1: Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)), color2: Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)), width: 44, height: 44, percent: 50)
                        
                        VStack(alignment: .leading, spacing: 4.0) {
                            Text("6 Minutes left")
                                .font(.subheadline)
                                .fontWeight(.bold)
                            
                            Text("Watched 10 mins today")
                                .font(.caption)
                        }
                    }
                    .padding(8)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                    .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                    
                    RingView(color1: Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)), color2: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)), width: 44, height: 44, percent: 80)
                        .padding(8)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                    
                    RingView(color1: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), color2: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)), width: 44, height: 44, percent: 75)
                        .padding(8)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                }
                
                SectionListView()
                
                Spacer()
            }
            .padding(.top, 44)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .offset(y: self.showProfile ? -450: 0)
            .scaleEffect(self.showProfile ? 0.9 : 1)
            .rotation3DEffect(Angle(degrees: self.showProfile ? -10 : 0), axis: (x: 10, y: 0, z: 0))
            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
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
