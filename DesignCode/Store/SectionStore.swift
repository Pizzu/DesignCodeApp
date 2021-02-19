//
//  SectionStore.swift
//  DesignCode
//
//  Created by Luca Lo Forte on 19/2/21.
//

import SwiftUI
import Combine

class SectionStore : ObservableObject {
    
    @Published var sections : [Section] = sectionData
    
}
