//
//  CourseListView.swift
//  DesignCode
//
//  Created by Luca Lo Forte on 25/2/21.
//

import SwiftUI

struct CourseListView: View {
    
    @Namespace var namespaceTwo
    
    @EnvironmentObject var courseStore : CourseStore
    @State var selectedCourse : Course? = nil
    @State var isDisabled : Bool = false
    @State var show : Bool = false
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(spacing: 30.0) {
                    HStack {
                        Text("Courses")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    ForEach(courseStore.courses.indices, id: \.self) { index in
                        
                        VStack {
                            CourseView(course: self.courseStore.courses[index], namespace: self.namespaceTwo)
                                .frame(height: 280)
                                .onTapGesture {
                                    withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0)) {
                                        self.show = true
                                        self.selectedCourse = self.courseStore.courses[index]
                                        self.isDisabled = true
                                    }
                            }
                        }
                        .disabled(isDisabled)
                        .zIndex(1.0)
                    }
                    
                }
                .padding(.bottom, 45)
            }
            
            if self.show {
                VStack {
                    CourseDetailView(course: self.selectedCourse!, show: self.$show, namespace: self.namespaceTwo, selectedCourse: self.$selectedCourse, isDisabled: self.$isDisabled)
                }
                .zIndex(2)
            }
            
        }
    }
}

struct CourseListView_Previews: PreviewProvider {
    static var previews: some View {
        CourseListView().environmentObject(CourseStore())
    }
}
