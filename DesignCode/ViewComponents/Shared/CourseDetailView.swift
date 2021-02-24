//
//  CourseDetailView.swift
//  DesignCode
//
//  Created by Luca Lo Forte on 22/2/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct CourseDetailView: View {
    
    var course : Course
    @Binding var show : Bool
    var namespace : Namespace.ID
    @State var showText : Bool = false
    @Binding var selectedCourse : Course?
    @Binding var isDisabled : Bool
    
    var body: some View {
        ScrollView {
            VStack {
                VStack(spacing: 0) {
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
                            Image(systemName: "xmark")
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(.white)
                                .padding(10)
                                .background(Color.black)
                                .clipShape(Circle())
                                .matchedGeometryEffect(id: "logo\(course.id)", in: namespace)
                                .onTapGesture {
                                    withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0)) {
                                        self.show = false
                                        self.selectedCourse = nil
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                            self.isDisabled = false
                                        }
                                    }
                                }
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
                .padding(30)
                .padding(.top, 30)
                .frame(maxWidth: .infinity)
                .frame(height: 460)
                .background(
                    self.course.color
                        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                        .matchedGeometryEffect(id: "background\(course.id)", in: namespace)
                )
                .shadow(color: self.course.color.opacity(0.3), radius: 20, x: 0, y: 20)
                .zIndex(1.0)
                
                VStack(alignment: .leading, spacing: 30.0) {
                    Text("Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS.")
                    
                    Text("About this course")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    
                    Text("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.")
                    
                    Text("Minimal coding experience required, such as in HTML and CSS. Please note that Xcode 11 and Catalina are essential. Once you get everything installed, it'll get a lot friendlier! I added a bunch of troubleshoots at the end of this page to help you navigate the issues you might encounter.")
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 30)
                .padding(.bottom, 60)
                .offset(y: self.showText ? 0 : -150)
            }
        }
        .background(Color("background2"))
        .onAppear {
            self.showText = true
        }
        .onDisappear {
            self.showText = false
        }
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0), value: self.showText)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    
    @Namespace static var namespace
    
    static var previews: some View {
        CourseDetailView(course: courseData[0], show: .constant(true), namespace: namespace, selectedCourse: .constant(nil), isDisabled: .constant(false))
    }
}
