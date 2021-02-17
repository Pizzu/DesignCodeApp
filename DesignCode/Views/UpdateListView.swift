//
//  UpdateListView.swift
//  DesignCode
//
//  Created by Luca Lo Forte on 17/2/21.
//

import SwiftUI

struct UpdateListView: View {
    var body: some View {
        NavigationView {
            List(updateData) { updateItem in
                NavigationLink(destination: Text(updateItem.text)) {
                    UpdateCellView(update: updateItem)
                }
            }
            .navigationBarTitle(Text("Updates"))
        }
    }
}

struct UpdateListView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateListView()
    }
}

struct UpdateCellView: View {
    
    var update : Update
    
    var body: some View {
        HStack(alignment: .top, spacing: 20.0) {
            
            Image(update.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 70)
                .background(Color(#colorLiteral(red: 0.06366486243, green: 0.01889733462, blue: 0.4075666422, alpha: 1)))
                .cornerRadius(20)
                
            VStack(alignment: .leading, spacing: 10.0) {
                Text(update.title)
                    .font(.system(size: 20, weight: .bold))
                
                Text(update.text)
                    .lineLimit(2)
                    .font(.subheadline)
                    .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                
                Text(update.date.uppercased())
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(Color(#colorLiteral(red: 0.06366486243, green: 0.01889733462, blue: 0.4075666422, alpha: 1)))
                    .cornerRadius(20)
            }
        }
        .padding(.vertical, 10)
    }
}
