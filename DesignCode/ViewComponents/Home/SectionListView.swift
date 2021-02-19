//
//  SectionListView.swift
//  DesignCode
//
//  Created by Luca Lo Forte on 16/2/21.
//

import SwiftUI


struct SectionListView: View {
    
    @ObservedObject var sectionStore = SectionStore()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20.0) {
                ForEach(sectionStore.sections) { section in
                    GeometryReader { geometry in
                        SectionView(section: section)
                            .rotation3DEffect(
                                Angle(degrees: Double(geometry.frame(in: .global).minX - 16) / -20),
                                axis: (x: 0.0, y: 10.0, z: 0.0)
                            )
                    }
                    .frame(width: 275, height: 275)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 50)
        }
    }
}

struct SectionListView_Previews: PreviewProvider {
    static var previews: some View {
        SectionListView()
    }
}
