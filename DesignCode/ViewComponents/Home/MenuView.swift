//
//  MenuView.swift
//  DesignCode
//
//  Created by Luca Lo Forte on 15/2/21.
//

import SwiftUI
import SwiftUIX

struct MenuView: View {
    
    @EnvironmentObject var userStore : UserStore
    
    var body: some View {
        VStack {
            
            Spacer()
            
            VStack(spacing: 16.0) {
                
                Text("\(userStore.currentUser?.username ?? "Luca") - 28% completed")
                    .font(.caption)
                
                Color.white
                    .frame(width: 38, height: 6)
                    .cornerRadius(3)
                    .frame(width: 130, height: 6, alignment: .leading)
                    .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.08))
                    .cornerRadius(3)
                    .padding()
                    .frame(width: 150, height: 24)
                    .background( Color.black.opacity(0.1))
                    .cornerRadius(12)
                
                
                MenuRowView(title: "Account", iconName: "gear")
                MenuRowView(title: "Billing", iconName: "creditcard")
                MenuRowView(title: "Sign Out", iconName: "person.crop.circle")
                    .onTapGesture {
                        self.userStore.logout()
                    }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .background(BlurEffectView(style: .systemThinMaterial))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .padding(.horizontal, 30)
            .overlay(
                Image("Avatar")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                    .offset(y: -150)
            )
        }
        .padding(.bottom, 30)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView().environmentObject(UserStore())
    }
}

struct MenuRowView: View {
    
    var title : String
    var iconName : String
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(systemName: self.iconName)
                .font(.system(size: 20, weight: .light))
                .frame(width: 32, height: 32)
                .imageScale(.large)
                .foregroundColor(Color(#colorLiteral(red: 0.662745098, green: 0.7333333333, blue: 0.831372549, alpha: 1)))
            
            Text(self.title)
                .font(.system(size: 20, weight: .bold, design: .default))
                .frame(width: 120, alignment: .leading)
        }
    }
}
