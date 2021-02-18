//
//  TabBar.swift
//  DesignCode
//
//  Created by Luca Lo Forte on 18/2/21.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            HomeView().tabItem {
                Image(systemName: "house.circle.fill")
                Text("Home")
            }
            CertficateView().tabItem {
                Image(systemName: "rectangle.stack.fill")
                Text("Certificates")
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
