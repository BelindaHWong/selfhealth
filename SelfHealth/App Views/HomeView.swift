//
//  HomeView.swift
//  SelfHealth
//
//  Created by Belinda Wong on 23/7/2023.
//

import SwiftUI

struct HomeView: View {
    @State var isExperimentActive = false
    var body: some View {
        ZStack {
            if(isExperimentActive) {
                Color.red
                Image(systemName: "house.fill")
                    .foregroundColor(Color.white)
                    .font(.system(size: 100.0))
            } else {
                VStack(spacing: 20) {
                    
                    Text("Experiment Summary")
                        .font(.title.bold())
                        .foregroundColor(.gray)


                    
                    Text("You currently have no active experiments. Get started by selecting the Experiments tab!")
                        .font(.title2)
                        .frame(width: 300)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .fontWeight(.medium)
                    
                  
                    Image(systemName: "list.clipboard.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                        .frame(width: 100, height: 100)
                        
                }

            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
