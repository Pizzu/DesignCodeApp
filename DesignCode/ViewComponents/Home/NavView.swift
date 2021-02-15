//
//  NavView.swift
//  DesignCode
//
//  Created by Luca Lo Forte on 15/2/21.
//

import SwiftUI

struct NavView: View {
    
    @Binding var showProfile : Bool
    
    var body: some View {
        HStack {
            Text("Watching")
                .font(.system(size: 28, weight: .bold))
            
            Spacer()
            
            AvatarView(showProfile: $showProfile)
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
        })
    }
}

struct NavView_Previews: PreviewProvider {
    static var previews: some View {
        NavView(showProfile: .constant(false))
    }
}
