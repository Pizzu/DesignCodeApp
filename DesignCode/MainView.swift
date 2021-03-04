//
//  MainView.swift
//  DesignCode
//
//  Created by Luca Lo Forte on 4/3/21.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var userStore : UserStore
    
    func getUser() {
        self.userStore.getCurrentUser()
    }
    
    var body: some View {
        Group {
            if userStore.isLogged {
                TabBar()
            } else {
                AuthView()
            }
        }
        .onAppear(perform: getUser)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(UserStore())
    }
}
