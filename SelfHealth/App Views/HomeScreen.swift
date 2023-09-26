//
//  HomeScreen.swift
//  SelfHealth
//
//  Created by Belinda Wong on 24/7/2023.
//

import SwiftUI


struct HomeScreen: View {
    @State private var isActive = false
    @EnvironmentObject private var appState: AppState
//    var homeView = HomeView()
//    private init() {}
    
    var body: some View {
        var homeView = HomeView(isExperimentActive: appState.isActivated)
        TabView {
         
            homeView.tabItem() {
                    Image(systemName: "house.fill")
                    Text("Home")
            }
            
            
//            ExperimentSummaryView()
            ExperimentScaffold()
                .tabItem() {
                    Image(systemName: "list.clipboard.fill")
                    Text("Experiments")
                    
                }
            HealthView()
                .tabItem() {
                    Image(systemName: "heart.fill")
                    Text("Health")
                }
//            ProfileView()
//                .tabItem() {
//                    Image(systemName: "person.circle.fill")
//                    Text("Profile")
//                }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
