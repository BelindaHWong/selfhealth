//
//  ExperimentScaffold.swift
//  SelfHealth
//
//  Created by Belinda Wong on 24/7/2023.
//

import SwiftUI

struct ExperimentScaffold: View {

    @State var isExpanded = false
    @State var selectedOption: String?
    @State var isShowingNextScreen = false
    let causeOptions = ["Step count", "Moderately active minutes", "Sedentary minutes"]
    let green = Color(red: 0.0, green: 0.5, blue: 0.0)
    @State private var selectedCause = "Option 1"
    @State private var selectedEffect = "Option A"
    let effectOptions = ["Sleep quality", "Mood"]

    
    var body: some View {
        VStack {
            if isShowingNextScreen {
                ExperimentRecommendation()
            } else {
                VStack(alignment: .center, spacing: 20) {
                    Text("Your first experiment")
                        .font(.title.bold())
                        .multilineTextAlignment(.center)
                    let header = Text("Find out if there is a relationship between two variables in your daily life by identifying a possible ") + Text("cause").foregroundColor(Color.red).bold() + Text(" and an ") + Text("effect").foregroundColor(green).bold()
                    header.font(.title3)
                        .frame(width: 300)
                        .multilineTextAlignment(.center)

                    HStack(spacing: 20) {
                        Image("run")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                        Image("right-arrow")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                        Image("sleeping")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                    }
                    
                    .padding()
                    Text("A sample goal would be:")
                        .font(.title3)
                        .bold()
                        .frame(width: 400)
                        .multilineTextAlignment(.center)
                    
                    let expGoal = Text("I want to find out whether my ") + Text("running").foregroundColor(.red).bold() + Text(" affects my ") + Text("sleep quality.").foregroundColor(green).bold()
                    
                    expGoal
                        .font(.title3)
                        .italic()
                        .frame(width: 350)
                        .multilineTextAlignment(.center)
                    

                    Divider()
                    Button(action: {
                        // Button action code here
                        print("View Recommendation Button Tapped")
                        isShowingNextScreen = true
                    }) {
                        HStack(spacing: 10) {
                            Image(systemName: "waveform.path.ecg")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                            
                            Text("Experiment Recommendation")
                                .foregroundColor(.white)
                                .font(.headline)
                        }
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(16)
                    }

                    .padding()
                    
                }
                .navigationBarTitle("Next View")
                .navigationBarHidden(true)
            }
            }
            
    }

}
