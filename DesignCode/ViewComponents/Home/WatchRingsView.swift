//
//  WatchRingsView.swift
//  DesignCode
//
//  Created by Luca Lo Forte on 19/2/21.
//

import SwiftUI

struct WatchRingsView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30.0) {
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
                .background(Color("background3"))
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                
                RingView(color1: Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)), color2: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)), width: 32, height: 32, percent: 80)
                    .padding(8)
                    .background(Color("background3"))
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                    .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                
                RingView(color1: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), color2: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)), width: 35, height: 35, percent: 75)
                    .padding(8)
                    .background(Color("background3"))
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                    .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
            }
            .padding(.horizontal)
            .padding(.bottom, 30)
        }
    }
}

struct WatchRingsView_Previews: PreviewProvider {
    static var previews: some View {
        WatchRingsView()
    }
}
