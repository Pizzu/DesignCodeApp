//
//  RingView.swift
//  DesignCode
//
//  Created by Luca Lo Forte on 18/2/21.
//

import SwiftUI

struct RingView: View {
    
    var color1 : Color
    var color2 : Color
    var width : CGFloat = 54
    var height : CGFloat = 54
    var percent : CGFloat = 80
    
    var getPercentage : CGFloat {
        return self.percent / 100
    }
    
    var multiplier : CGFloat {
        return self.width / 54
    }
    
    var body: some View {
        ZStack {
            
            Circle()
                .stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: 5 * multiplier))
                .frame(width: self.width, height: self.height)
            
            Circle()
                .trim(from: 0, to: self.getPercentage)
                .stroke(LinearGradient(gradient: Gradient(colors: [self.color1, self.color2]), startPoint: .topTrailing, endPoint: .bottomLeading), style: StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round, lineJoin: .round, miterLimit: .infinity))
                .frame(width: self.width, height: self.height)
                .rotationEffect(Angle(degrees: -90))
                .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).opacity(0.1), radius: 3 * multiplier, x: 0, y: 3 * multiplier)
            
            Text("\(Int(self.percent))%")
                .font(.system(size: 14 * multiplier))
                .fontWeight(.bold)
            
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(color1: Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)), color2: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), width: 200, height: 200, percent: 70)
    }
}
