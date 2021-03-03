//
//  CourseStore.swift
//  DesignCode
//
//  Created by Luca Lo Forte on 19/2/21.
//

import SwiftUI
import Combine

class CourseStore : ObservableObject {
    
    @Published var courses : [Course] = courseData
    
    init() {
        CourseService.instance.getAllCourses { (items) in
            items.forEach { (item) in
                guard let title = item.fields["title"] as? String else {return}
                guard let subtitle = item.fields["subtitle"] as? String else {return}
                guard let logo = item.fields.linkedAsset(at: "logo")?.url else {return}
                guard let image = item.fields.linkedAsset(at: "image")?.url else {return}
                guard let color = item.fields["color"] as? String else {return}
                
//                print(" ----------- COURSE STARTS ------------")
//                print(title)
//                print(subtitle)
//                print(logo)
//                print(image)
//                print(color)
//                print(" ----------- COURSE ENDS ------------")
                
                let newCourse = Course(title: title, subtitle: subtitle, logo: logo, image: image, color: Color(color))
                self.courses.append(newCourse)
            }
        }
    }
}

