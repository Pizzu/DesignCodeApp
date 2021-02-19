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
    
}

