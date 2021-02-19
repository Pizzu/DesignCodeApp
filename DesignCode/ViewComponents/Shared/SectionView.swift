//
//  SectionView.swift
//  DesignCode
//
//  Created by Luca Lo Forte on 19/2/21.
//

import SwiftUI

struct SectionView: View {
    
    var section : Section
    var width : CGFloat = 275
    var height : CGFloat = 275
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(self.section.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(Color.white)
                
                Spacer()
                
                Image(self.section.logo)
            }
            
            Text(self.section.subtitle.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.white)
            
            self.section.bgImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: self.width, height: self.height)
        .background(self.section.color)
        .cornerRadius(30)
        .shadow(color: self.section.color.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(section: sectionData[0])
    }
}
