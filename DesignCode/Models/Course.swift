//
//  Course.swift
//  DesignCode
//
//  Created by Luca Lo Forte on 19/2/21.
//

import SwiftUI

struct Course : Identifiable {
    var id : UUID = UUID()
    var title : String
    var subtitle : String
    var logo : String
    var image : Image
    var color : Color
    var show : Bool
}

let courseData : [Course] = [
    Course(title: "Prototype designs in SwiftUI", subtitle: "18 Sections", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card4")), color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)), show: false),
    Course(title: "Build a Swift UI app", subtitle: "20 Sections", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card1")), color: Color(#colorLiteral(red: 0.07843137255, green: 0.7450980392, blue: 0.9921568627, alpha: 1)), show: false),
    Course(title: "SwiftUI Advanced", subtitle: "22 Sections", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card2")), color: Color(#colorLiteral(red: 0.968627451, green: 0.2156862745, blue: 0.3411764706, alpha: 1)), show: false)
]
