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
