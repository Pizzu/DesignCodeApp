//
//  Update.swift
//  DesignCode
//
//  Created by Luca Lo Forte on 17/2/21.
//

import SwiftUI

struct Update : Identifiable {
    var id : UUID = UUID()
    var title : String
    var text : String
    var image : String
    var date : String
}

let updateData : [Update] = [
    Update(title: "SwiftUI Advanced", text: "Take your SwiftUI app to the app store with advanced techniques like Api data, packages and CMS.", image: "Card1", date: "Jan 1"),
    Update(title: "Webflow", text: "Design and animate a high converting landing page with advanced interactions, payments and CMS.", image: "Card2", date: "Oct 17"),
    Update(title: "Protopie", text: "Quickly prototype advanced animations and interactions for mobile and web.", image: "Card3", date: "Aug 27"),
    Update(title: "SwiftUI", text: "Learn how to code custom UIs, animations, gestures and components in Xcode 12.", image: "Card4", date: "June 26"),
    Update(title: "Framer Playground", text: "Create powerful animations and interactions with the Framer X code editor.", image: "Card5", date: "Aug 14")
]
