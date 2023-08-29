//
//  HomeView.swift
//  SelfHealth
//
//  Created by Belinda Wong on 23/7/2023.
//

import SwiftUI

struct HomeView: View {
    // Should be false to start. True for dev rn.
    @State var isExperimentActive = false
    
    func toggleExperimentActive() {
        isExperimentActive.toggle()
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if(isExperimentActive) {
                Text("Experiment Summary")
                    .font(.title2)
                    .fontWeight(.semibold)
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(Color.white)
                        .shadow(color: Color.gray.opacity(0.3), radius: 8, x: 0, y: 4)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Current Goal")
                            .foregroundColor(.black)
                            .font(.headline)
                        
                        Text("If I change my gym routine, does that affect step count?")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                    .padding(16)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(Color.white)
                        .shadow(color: Color.gray.opacity(0.3), radius: 8, x: 0, y: 4)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Today's Action")
                            .foregroundColor(.black)
                            .font(.headline)
                        
                        Text("Go to the gym")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                    .padding(16)
                }

                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(Color.white)
                        .shadow(color: Color.gray.opacity(0.3), radius: 8, x: 0, y: 4)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Analysis")
                            .foregroundColor(.black)
                            .font(.headline)
                        
                        Text("At this stage, your step count appears higher when you visit the gym on the same day.")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                    .padding(16)
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(Color.white)
                        .shadow(color: Color.gray.opacity(0.3), radius: 8, x: 0, y: 4)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Experiment Reuslts")
                            .foregroundColor(.black)
                            .font(.headline)
                        
                        Text("Go to the gym")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                    .padding(16)
                }
                
//                Color.red
//                Image(systemName: "house.fill")
//                    .foregroundColor(Color.white)
//                    .font(.system(size: 100.0))
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
        }.padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
