//
//  SectionListView.swift
//  DesignCode
//
//  Created by Luca Lo Forte on 16/2/21.
//

import SwiftUI


struct SectionListView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20.0) {
                ForEach(sectionCourseData) { courseSection in
                    GeometryReader { geometry in
                        SectionView(courseSection: courseSection)
                            .rotation3DEffect(
                                Angle(degrees: Double(geometry.frame(in: .global).minX - 16) / -20),
                                axis: (x: 0.0, y: 10.0, z: 0.0)
                            )
                    }
                    .frame(width: 275, height: 275)
                }
            }
            .padding(.top, 30)
            .padding(.horizontal)
            .padding(.bottom, 60)
        }
    }
}

struct SectionView: View {
    
    var courseSection : CourseSection
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(courseSection.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(Color.white)
                
                Spacer()
                
                Image(courseSection.logo)
            }
            
            Text(courseSection.subtitle.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.white)
            
            courseSection.bgImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: 275, height: 275)
        .background(courseSection.color)
        .cornerRadius(30)
        .shadow(color: courseSection.color.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}

struct SectionListView_Previews: PreviewProvider {
    static var previews: some View {
        SectionListView()
    }
}
