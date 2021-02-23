//
//  CourseView.swift
//  DesignCode
//
//  Created by Luca Lo Forte on 19/2/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct CourseView: View {
    
    var course : Course
    @Binding var show : Bool
    var namespace : Namespace.ID
    
    var body: some View {
        
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 8.0) {
                    Text(self.course.title)
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(Color.white)
                    
                    Text(self.course.subtitle)
                        .foregroundColor(.white)
                }
                .matchedGeometryEffect(id: "title\(course.id)", in: namespace)
                
                Spacer()
                
                ZStack {
                    WebImage(url: self.course.logo)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 45, height: 45)
                        .matchedGeometryEffect(id: "logo\(course.id)", in: namespace)
                }
            }
            
            Spacer()
            
            WebImage(url: self.course.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .frame(height: 140, alignment: .top)
                .matchedGeometryEffect(id: "image\(course.id)", in: namespace)
        }
        .padding(20)
        .padding(.top, 0)
        .frame(width: UIScreen.main.bounds.width - 30)
        .frame(height: 280)
        .background(
            self.course.color
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .matchedGeometryEffect(id: "background\(course.id)", in: namespace)
        )
        .shadow(color: self.course.color.opacity(0.3), radius: 20, x: 0, y: 20)
        
    }
            

}

struct CourseView_Previews: PreviewProvider {
    
    @Namespace static var namespace
    
    static var previews: some View {
        CourseView(course: courseData[0], show: .constant(false), namespace: namespace)
    }
}

