//
//  UpdateStore.swift
//  DesignCode
//
//  Created by Luca Lo Forte on 18/2/21.
//

import SwiftUI
import Combine

class UpdateStore : ObservableObject {
    
    @Published var updates : [Update] = updateData
    
    func addUpdate() {
        self.updates.append(Update(title: "SwiftUI Advanced", text: "Take your SwiftUI app to the app store with advanced techniques like Api data, packages and CMS.", image: "Card1", date: "Jan 1"))
    }
    
    func deleteUpdate(at idx: Int?) {
        guard let index = idx else { return }
        self.updates.remove(at: index)
    }
    
}
