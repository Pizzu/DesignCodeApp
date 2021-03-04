//
//  TabBar.swift
//  DesignCode
//
//  Created by Luca Lo Forte on 18/2/21.
//

import SwiftUI

struct TabBar: View {
    
    @Namespace var namespace
    var courseStore = CourseStore()
    
    var body: some View {
        TabView {
            HomeView().tabItem {
                Image(systemName: "house.circle.fill")
                Text("Home")
            }
            
            CourseListView().tabItem {
                Image(systemName: "rectangle.stack.fill")
                Text("Courses")
            }
            
            CertficateView().tabItem {
                Image(systemName: "graduationcap.fill")
                Text("Certificates")
            }
        }
        .environmentObject(courseStore)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            .environmentObject(UserStore())
    }
}
