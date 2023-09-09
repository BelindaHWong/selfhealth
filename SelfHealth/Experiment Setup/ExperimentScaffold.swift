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
                    let header = Text("Find out if there is a relationship between two variables in your daily life by identifying a ") + Text("cause").foregroundColor(Color.red).bold() + Text(" and an ") + Text("effect").foregroundColor(green).bold()
                    header.font(.title3)
                        .frame(width: 300)
                        .multilineTextAlignment(.center)

                    HStack(spacing: 20) {
                        Image("run") // Replace "image1" with the name of your first image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100) // Set the size of your first image
                        Image("right-arrow") // Replace "image2" with the name of your second image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100) // Set the size of your second image
                        Image("sleeping") // Replace "image2" with the name of your second image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100) // Set the size of your second image
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
                                .frame(width: 24, height: 24) // Set the size of the health icon
                                .foregroundColor(.white) // Set the color of the health icon
                            
                            Text("Experiment Recommendation")
                                .foregroundColor(.white) // Set the text color to white
                                .font(.headline) // Set the font style for the label
                        }
                        .padding()
                        .background(Color.blue) // Set the background color of the button
                        .cornerRadius(16) // Set the corner radius of the button
                    }

    //                Text("OR").bold()
    //                HStack {
    //                            VStack {
    //                                Text("Cause").foregroundColor(Color.red).bold()
    //                                Picker("Cause", selection: $selectedCause) {
    //                                    ForEach(causeOptions, id: \.self) { option in
    //                                        Text(option).tag(option)
    //                                    }
    //                                }
    //                                .pickerStyle(MenuPickerStyle())
    //                                .frame(maxWidth: .infinity) // Ensure the Picker takes full width
    //
    //                            }
    //
    //                            VStack {
    //                                Text("Effect").foregroundColor(green).bold()
    //                                Picker("Effect", selection: $selectedEffect) {
    //                                    ForEach(effectOptions, id: \.self) { option in
    //                                        Text(option).tag(option)
    //                                    }
    //                                }
    //                                .pickerStyle(MenuPickerStyle())
    //                                .frame(maxWidth: .infinity) // Ensure the Picker takes full width
    //                            }
    //                }
                    .padding()
                    
                }
                .navigationBarTitle("Next View")
                .navigationBarHidden(true)
            }
            }
            
    }
    
    struct ExperimentScaffold_Previews: PreviewProvider {
        static var previews: some View {
            ExperimentScaffold()
        }
    }
}
