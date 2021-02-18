//
//  UpdateDetailView.swift
//  DesignCode
//
//  Created by Luca Lo Forte on 17/2/21.
//

import SwiftUI

struct UpdateDetailView: View {
    
    var update : Update
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20.0) {
                Image(update.image)
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .aspectRatio(contentMode: .fit)

                Text(update.text)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
            }
            
        }
        .navigationBarTitle(update.title)
    }
}

struct UpdateDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetailView(update: updateData[0])
    }
}
