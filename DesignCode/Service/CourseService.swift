//
//  CourseService.swift
//  DesignCode
//
//  Created by Luca Lo Forte on 23/2/21.
//

import SwiftUI
import Contentful

class CourseService {
    
    static let instance = CourseService()
    private let client : Client
    
    private init() {
        client = Client(spaceId: SPACE_ID, accessToken: TOKEN)
    }
    
    func getAllCourses(completion: @escaping([Entry]) -> Void) {
        let query = Query.where(contentTypeId: "course")
        client.fetchArray(of: Entry.self, matching: query) { result in
            switch result {
            case .success(let entry):
                DispatchQueue.main.async {
                    completion(entry.items)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

