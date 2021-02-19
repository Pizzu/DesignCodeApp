//
//  CourseView.swift
//  DesignCode
//
//  Created by Luca Lo Forte on 19/2/21.
//

import SwiftUI

struct CourseView: View {
    
    @State private var show : Bool = false
    
    var course : Course
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            VStack(alignment: .leading, spacing: 30.0) {
                Text("Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS.")
                
                Text("About this course")
                    .font(.title)
                    .fontWeight(.bold)
                
                
                Text("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.")
                
                Text("Minimal coding experience required, such as in HTML and CSS. Please note that Xcode 11 and Catalina are essential. Once you get everything installed, it'll get a lot friendlier! I added a bunch of troubleshoots at the end of this page to help you navigate the issues you might encounter.")
            }
            .padding(30)
            .frame(maxWidth: self.show ? .infinity : UIScreen.main.bounds.width - 30, maxHeight: self.show ? .infinity : 280, alignment: .top)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 20)
            .opacity(self.show ? 1 : 0)
            .offset(y: self.show ? 460 : 0)
            
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text(self.course.title)
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(Color.white)
                        
                        Text(self.course.subtitle)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    ZStack {
                        Image(self.course.logo)
                            .opacity(self.show ? 0 : 1)
                        
                        Image(systemName: "xmark")
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.black)
                            .clipShape(Circle())
                            .opacity(self.show ? 1 : 0)
                    }
                }
                
                Spacer()
                
                self.course.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .frame(height: 140, alignment: .top)
            }
            .padding(self.show ? 30 : 20)
            .padding(.top, self.show ? 30 : 0)
            .frame(maxWidth: self.show ? .infinity : UIScreen.main.bounds.width - 30)
            .frame(height: self.show ? 460 : 280)
            .background(self.course.color)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: self.course.color.opacity(0.3), radius: 20, x: 0, y: 20)
            .onTapGesture {
                self.show.toggle()
            }
            
            
        }
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        .edgesIgnoringSafeArea(.all)
        
    }
            

}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView(course: courseData[1])
    }
}

