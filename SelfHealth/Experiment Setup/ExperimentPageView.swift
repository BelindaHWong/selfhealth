//
//  ExperimentPageView.swift
//  SelfHealth
//
//  Created by Belinda Wong on 18/7/2023.
//

import SwiftUI

struct ExperimentPageView: View {
    @State var isExpanded = false
    @State var selectedOption: String?
    let options = ["Step count", "Moderately active minutes", "Sedentary minutes"]

    var optionsMenu: some View {
        VStack(spacing: 0) {
            ForEach(options, id: \.self) { option in
                Button(action: {
                    selectedOption = option
                    isExpanded.toggle()
                }) {
                    Text(option)
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.vertical, 10)
                }
                .background(Color.white)
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
            }
        }
        .padding(.horizontal)
        .background(Color.white)
        .cornerRadius(10)
        .opacity(isExpanded ? 1 : 0) // Hide the options when not expanded
        .alignmentGuide(.bottom) { d in
            // Use alignment guide to align the options to the bottom of the button
            d[.top] + 5
        }
    }
    
    var body: some View {
        VStack {
            let page = Page.experimentPage
            

            VStack(alignment: .center, spacing: 20) {
                    Text(page.name)
                        .font(.title.bold())
                        .multilineTextAlignment(.center)
//                    Text("Find out if there is a causal relationship between two variables in your daily life, e.g. Does increased step count lead to better quality sleep?")
//                        .font(.callout)
//                        .frame(width: 300)
//                        .multilineTextAlignment(.center)
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
                    Text(page.description)
                        .font(.title3)
                        .frame(width: 300)
                        .multilineTextAlignment(.center)
                
                    
                List {
                                Button(action: {
                                    isExpanded.toggle()
                                }) {
                                    HStack {
                                        Text(selectedOption ?? "Select a cause")
                                            .foregroundColor(.white)
                                            .font(.headline)
                                        Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                                            .foregroundColor(.white)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(10)
                                }
                                .listRowInsets(EdgeInsets()) // Remove default list row insets
                                .listStyle(.automatic)
                                if isExpanded {
                                    ForEach(options, id: \.self) { option in
                                        Button(action: {
                                            selectedOption = option
                                            isExpanded.toggle()
                                        }) {
                                            HStack {
                                                Text(option)
                                                    .font(.headline)
                                                    .foregroundColor(.black)
                                                Spacer() // Align options to the right
                                            }
                                            .padding(.vertical, 10)
                                        }
                                        .background(Color.white)
                                        .cornerRadius(10)
                                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                                        .listRowInsets(EdgeInsets()) // Remove default list row insets
                                    }
                                }
                            }
//                            .overlay(optionsMenu, alignment: .bottom)
                                if !isExpanded {
                                       Button("Done", action: {
                                           HomeScreen()
                                       })
                                       .padding()
                                       .background(Color.green)
                                       .foregroundColor(.white)
                                       .cornerRadius(10)
           
                                   }
//                            .padding(.bottom, 10)
                        }
//                    Button(action: {
//                        isExpanded.toggle()
//                    }) {
//                        HStack {
//                            Text(selectedOption ?? "Change variable")
//                                .foregroundColor(.white)
//                                .font(.headline)
//                            Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
//                                .foregroundColor(.white)
//                        }
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(Color.blue)
//                        .cornerRadius(10)
//                    }.padding(.bottom, 10)
//                    .overlay(optionsMenu, alignment: .bottom)
//
//                    if !isExpanded {
//                        Button("Next", action: {
//
//                        })
//                        .padding()
//                        .background(Color.green)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                    }
//
//
//
//
//                }
//                .padding()
        }
        .navigationBarTitle("Next View")
        .navigationBarHidden(true)
    }
}

struct ExperimentPageView_Previews: PreviewProvider {
    static var previews: some View {
        ExperimentPageView()
    }
}
