//
//  HomeView.swift
//  SelfHealth
//
//  Created by Belinda Wong on 23/7/2023.
//

import SwiftUI

struct HomeView: View {
    // Should be false to start. True for dev rn.
    @State var isExperimentActive = true
    @State private var isActivityCompleteSelected = false
    @State private var isActivityUncompleteSelected = false
    @State private var selectedCause = "Update Status"
    let causeOptions = ["Cannot Complete❓", "Completed ✅"]
    func toggleExperimentActive() {
        isExperimentActive.toggle()
    }
    
    struct Person: Identifiable {
        let givenName: String
        var familyName: String
        var emailAddress: String
        let id = UUID()


        var fullName: String { givenName + " " + familyName }
        
    }

    struct HeadingRow: View {
        var body: some View {
            HStack {
//                Text("  Date")
//                
//                Text("                     Gym")
//
//                Text("       Steps")
                Text("Date")
                    .padding(.horizontal, 30) // Add horizontal padding to "Date."
                Text("   Gym")
                    .padding(.horizontal, 30) // Add horizontal padding to "Gym."
                Text("Steps")
                    .padding(.horizontal, 20) // Add horizontal padding to "Steps."
            }
            .padding(10)
        }
    }
    
    @State private var people = [
        Person(givenName: "Mon 29/05/23", familyName: "  ✅", emailAddress: "   6,515"),
        Person(givenName: "Tue 30/05/23", familyName: "   ❌", emailAddress: "  ❓"),
        Person(givenName: "Wed 31/05/23", familyName: "  ❌", emailAddress: "   5,413"),
        Person(givenName: "Thu 01/06/23", familyName: "   ✅", emailAddress: "   5,303"),
        Person(givenName: "Fri 02/06/23", familyName: "     ❌", emailAddress: "  3,640"),
        Person(givenName: "Sat 03/06/23", familyName: "    ✅", emailAddress: "   9,781"),
        Person(givenName: "Sun 04/06/23", familyName: "  ✅", emailAddress: "   6,844"),
        Person(givenName: "Mon 05/06/23", familyName: "  ❌", emailAddress: "  6,449")
    ]
    
    struct PersonRow: View {
        let person: Person

        var body: some View {
            HStack(spacing: 40) {
                Text(person.givenName)
                    .font(.subheadline)
                    
                
                Text(person.familyName)
                    .font(.subheadline)
//                    .foregroundColor(.secondary)
//                    .padding()
                Text(person.emailAddress)
                    .font(.subheadline)
                    .padding(.horizontal, 16)
            }

        }
    }
    
    struct PeopleList: View {
        @Binding var people: [Person]

        var body: some View {
            HeadingRow() // Add a heading row with titles.
                 .font(.headline)
            
            List(people) { person in
                PersonRow(person: person)
                    .listRowSeparator(.visible) // Apply gray lines as row separators.
            }
            .listStyle(.plain) // Use plain list style for cleaner appearance.
        }
    }
    
    var body: some View {
        
//        isExperimentActive = ExperimentRecommendation.isShowing
//        ExperimentRecommendation(isShowingNextScreen: isExperimentActive)
            if(isExperimentActive) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Experiment Summary")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundColor(Color.white)
                            .shadow(color: Color.gray.opacity(0.3), radius: 8, x: 0, y: 4)
                        
                        VStack(alignment: .center, spacing: 4) {
                            Text("📌 Today's Action: Visit Gym")
                                .foregroundColor(.black)
                                .font(.headline)
                            Picker("Cause", selection: $selectedCause) {
                                ForEach(causeOptions, id: \.self) { option in
                                    Text(option)
                                        .tag(option)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .frame(maxWidth: .infinity, maxHeight: 20)
                            

                        }
                        .padding(10)
                    }.frame(height: 70)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundColor(Color.white)
                            .shadow(color: Color.gray.opacity(0.3), radius: 8, x: 0, y: 4)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("🌟 Current Goal")
                                .foregroundColor(.black)
                                .font(.headline)
                            
                            Text("If I change my gym routine, does that affect step count?")
                                .foregroundColor(.black)
                                .font(.subheadline)
                        }
                        .padding(16)
                
                        
                    }.frame(height: 95)

                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundColor(Color.white)
                            .shadow(color: Color.gray.opacity(0.3), radius: 8, x: 0, y: 4)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("📊 Analysis")
                                .foregroundColor(.black)
                                .font(.headline)
                            
                            Text("At this stage, your steps are 19% higher than your average of 5,977 steps when you visit the gym, and 14% lower when you do not visit.")
                                .foregroundColor(.black)
                                .font(.system(size: 15))
                                .font(.subheadline)
                            HStack(alignment: .center, spacing: 10) {
                                Text("75%")
                                    .font(.system(size: 36, weight: .bold)) // Large font for percentage
                                    .foregroundColor(.blue) // Change the color as desired
                                
                                Text("of gym days, your steps average is reached.")
                                    .font(.system(size: 14, weight: .semibold)) // Smaller font for the description
                        
                                    .foregroundColor(.black)
                                    .frame(width: 100)
                                Spacer()
                                
                                Text("7")
                                    .font(.system(size: 36, weight: .bold)) // Large font for percentage
                                    .foregroundColor(.green) // Change the color as desired
                                
                                Text("day(s) of complete data")
                                    .font(.system(size: 14, weight: .semibold)) // Smaller font for the description
                                    .foregroundColor(.black)
                                    .frame(width: 80)
                            }
//                            Spacer()
                            HStack(alignment: .center, spacing: 10) {
                                Text("33%")
                                    .font(.system(size: 36, weight: .bold)) // Large font for percentage
                                    .foregroundColor(.blue) // Change the color as desired
                                
                                Text("of non-gym days, your steps average is reached.")
                                    .font(.system(size: 14, weight: .semibold)) // Smaller font for the description
                        
                                    .foregroundColor(.black)
                                    .frame(width: 100)
                                Spacer()
                                
                                if(isActivityUncompleteSelected) {
                                    Text("2")
                                        .font(.system(size: 36, weight: .bold)) // Large font for percentage
                                        .foregroundColor(.red) // Change the color as desired
                                } else {
                                    Text("1")
                                        .font(.system(size: 36, weight: .bold)) // Large font for percentage
                                        .foregroundColor(.red) // Change the color as desired
                                }
                                Text("day(s) of missing data")
                                    .font(.system(size: 14, weight: .semibold)) // Smaller font for the description
                                    .foregroundColor(.black)
                                    .frame(width: 80)
                            }
                            
                        }
                        .padding()
                    }.frame(height:290)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundColor(Color.white)
                            .shadow(color: Color.gray.opacity(0.3), radius: 8, x: 0, y: 4)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("📝 Experiment Results")
                                .foregroundColor(.black)
                                .font(.headline)

                            PeopleList(people: $people)
                        }
                        .padding(16)
                    }.frame(height: 200)
                }.padding()
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
