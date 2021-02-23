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
    var logo : URL
    var image : URL
    var color : Color
}

let courseData : [Course] = [
    Course(title: "Prototype designs in SwiftUI", subtitle: "18 Sections", logo: URL(string: "https://assets.ctfassets.net/95ilbmfk1xxd/29Rq3vZcux8jm9cNeUIScd/38894fad2380875fe8b3c71711165ecb/Logo1.pdf")!, image: URL(string: "https://images.ctfassets.net/95ilbmfk1xxd/SS6fYdtn180GIm5KouiFV/25892e261faec4be389d61295abec312/Card2_2x.png")!, color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
]
