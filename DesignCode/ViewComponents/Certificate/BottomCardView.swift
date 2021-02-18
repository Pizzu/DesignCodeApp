//
//  BottomCardView.swift
//  DesignCode
//
//  Created by Luca Lo Forte on 15/2/21.
//

import SwiftUI

struct BottomCardView: View {
    var body: some View {
        VStack(spacing: 20) {
            Rectangle()
                .frame(width: 40, height: 6, alignment: .center)
                .cornerRadius(3)
                .opacity(0.1)
            
            Text("This certificate is a proof that Meng To has achived the UI Design course with approval from a DesignCode Instructor.")
                .font(.subheadline)
                .lineSpacing(4)
                .multilineTextAlignment(.center)
            
            HStack(spacing: 20.0) {
                RingView(color1: Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)), color2: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)), width: 88, height: 88, percent: 80)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("SwiftUI")
                        .fontWeight(.bold)
                    
                    Text("12 of 12 sections completed\n10 hours spent so far")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .lineSpacing(4)
                }
                .padding(20)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 10)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
    }
}


struct BottomCardView_Previews: PreviewProvider {
    static var previews: some View {
        BottomCardView()
    }
}
