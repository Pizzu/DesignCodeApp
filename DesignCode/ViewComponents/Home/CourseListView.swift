//
//  CourseListView.swift
//  DesignCode
//
//  Created by Luca Lo Forte on 19/2/21.
//

import SwiftUI

struct CourseListView: View {
    
    @ObservedObject var courseStore = CourseStore()
    
    var body: some View {
        VStack(spacing: 20.0) {
            HStack {
                Text("Courses")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(.horizontal)
            
            ForEach(courseStore.courses) { course in
                CourseView(course: course)
            }
        }
    }
}

struct CourseListView_Previews: PreviewProvider {
    static var previews: some View {
        CourseListView()
    }
}
