//
//  NavView.swift
//  DesignCode
//
//  Created by Luca Lo Forte on 15/2/21.
//

import SwiftUI

struct NavView: View {
    
    @Binding var showProfile : Bool
    @State var showUpdate : Bool = false
    
    var body: some View {
        HStack {
            Text("Watching")
                .font(.system(size: 28, weight: .bold))
            
            Spacer()
            
            AvatarView(showProfile: $showProfile)
            
            Button(action: {
                self.showUpdate.toggle()
            }, label: {
                Image(systemName: "bell")
                    .renderingMode(.original)
                    .font(.system(size: 16, weight: .medium))
                    .frame(width: 36, height: 36)
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
            })
            .sheet(isPresented: $showUpdate) {
                UpdateListView()
            }
            
        }
        .padding(.horizontal)
        .padding(.top, 30)
    }
}

struct AvatarView: View {
    
    @Binding var showProfile : Bool
    
    var body: some View {
        Button(action: {
            self.showProfile.toggle()
        }, label: {
            Image("Avatar")
                .renderingMode(.original)
                .resizable()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
                .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
        })
    }
}

struct NavView_Previews: PreviewProvider {
    static var previews: some View {
        NavView(showProfile: .constant(false))
    }
}
