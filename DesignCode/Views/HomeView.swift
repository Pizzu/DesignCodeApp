//
//  HomeView.swift
//  DesignCode
//
//  Created by Luca Lo Forte on 15/2/21.
//

import SwiftUI

struct HomeView: View {
    
    @Namespace var namespace
    
    @State private var showProfile : Bool = false
    @State private var menuPosition : CGSize = CGSize.zero
    
    @EnvironmentObject var courseStore : CourseStore
    @State private var selectedCourse : Course? = nil
    @State private var isDisabled : Bool = false
    @State private var show : Bool = false
    
    
    var body: some View {
        ZStack {
            
            Color("background2")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                NavView(showProfile: $showProfile)
                
                WatchRingsView()
                
                SectionListView()
                
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
                            CourseView(course: self.courseStore.courses[index], namespace: self.namespace)
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
                .padding(.bottom, 90)
            }
            .padding(.top, 44)
            .background(LinearGradient(gradient: Gradient(colors: [Color("background2"), Color("background1")]), startPoint: .top, endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .offset(y: self.showProfile ? -450: 0)
            .scaleEffect(self.showProfile ? 0.9 : 1)
            .rotation3DEffect(Angle(degrees: self.showProfile ? -10 : 0), axis: (x: 10, y: 0, z: 0))
            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0), value: self.showProfile)
            .edgesIgnoringSafeArea(.all)
            
            if self.show {
                VStack {
                    CourseDetailView(course: self.selectedCourse!, show: self.$show, namespace: self.namespace, selectedCourse: self.$selectedCourse, isDisabled: self.$isDisabled)
                }
                .zIndex(2)
            }
            
            MenuView()
                .offset(y: self.showProfile ? 0 : UIScreen.main.bounds.height)
                .offset(y: self.menuPosition.height)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .gesture(
                    DragGesture().onChanged({ (value) in
                        self.menuPosition = value.translation
                    })
                    .onEnded({ (value) in
                        if self.menuPosition.height > 50 {
                            self.showProfile = false
                        }
                        self.menuPosition = .zero
                    })
                )
            
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(CourseStore())
            .environmentObject(UserStore())
    }
}
