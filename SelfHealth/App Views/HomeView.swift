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
    @State private var isActivityCompleteSelected = false
    @State private var isActivityUncompleteSelected = false
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
                Text("Gym")
                    .padding(.horizontal, 30) // Add horizontal padding to "Gym."
                Text("Steps")
                    .padding(.horizontal, 20) // Add horizontal padding to "Steps."
            }
            .padding(10)
        }
    }
    
    @State private var people = [
        Person(givenName: "Fri 18/08/23", familyName: "   ✅", emailAddress: "  12,493"),
        Person(givenName: "Sat 19/08/23", familyName: "  ❌", emailAddress: "  N/A"),
        Person(givenName: "Sun 20/08/23", familyName: " ❌", emailAddress: "  7,998"),
        Person(givenName: "Mon 21/08/23", familyName: " ✅", emailAddress: "  8,640"),
//        Person(givenName: "Tue 22/08/23", familyName: "  ❌", emailAddress: "  10,393"),
//        if(isActivityCompleteSelected) {
//            Person(givenName: "Tue 22/08/23", familyName: "  ✅", emailAddress: "  11,640")
//        } else {
//            Person(givenName: "Tue 22/08/23", familyName: "  N/A", emailAddress: "  11,640")
//        }
        Person(givenName: "Tue 22/08/23", familyName: "  ✅", emailAddress: "  11,640")
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
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("📌 Today's Action: Visit Gym")
                                .foregroundColor(.black)
                                .font(.headline)
                            HStack(alignment: .center, spacing: 5) {
                                Button(action: {
                                    isActivityCompleteSelected = false
                                    isActivityUncompleteSelected = false
                                    if var lastPerson = people.last {
                                        lastPerson.familyName = "  ✅"
                                        people[people.count - 1] = lastPerson // Update the last entry in the array
                                    }
                                    isActivityCompleteSelected.toggle()
                                }) {
                                    HStack(spacing: 10) {
                        
                                        Text("Completed ✅")
                                            .foregroundColor(isActivityCompleteSelected ? .white : .green) // Set the text color to white
                                            .font(.system(size: 15))
                                            .font(.headline) // Set the font style for the label
                                    }.frame(width:110,height:2)
                                    
                                        .padding()
                                        .background(
                                            RoundedRectangle(cornerRadius: 16)
                                                .stroke(isActivityCompleteSelected ? Color.white : Color.green, lineWidth: 2)
                                                .background(isActivityCompleteSelected ? Color.green : Color.white)
                                        ) // Set the background color of the button
                                        .cornerRadius(16) // Set the corner radius of the button
                                    
                                }
                                Button(action: {
                                    // Button action code here
                                    //                    print("View Recommendation Button Tapped")
                                   
                                    isActivityCompleteSelected = false
                                    isActivityUncompleteSelected = false
                                    if var lastPerson = people.last {
                                        lastPerson.familyName = " N/A"
                                        people[people.count - 1] = lastPerson // Update the last entry in the array
                                    }
                                    isActivityUncompleteSelected.toggle()
                                }) {
                                    HStack() {
        
                                        
                                        Text("Cannot Complete (N/A)")
                                            .foregroundColor(isActivityUncompleteSelected ? .white : .red) // Set the text color to white
                                            .font(.system(size: 15))
                                            .font(.headline) // Set the font style for the label
                                    }.frame(width:160,height:2)
                                    
                                        .padding()
                                        .background(
                                            RoundedRectangle(cornerRadius: 16)
                                                .stroke(isActivityUncompleteSelected ? Color.white : Color.red, lineWidth: 2)
                                                .background(isActivityUncompleteSelected ? Color.red : Color.white)
                                        )
                                        .cornerRadius(16) // Set the corner radius of the button
                                }
                            }
                        }
                        .padding(10)
                    }.frame(height: 80)
                    
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
                
                        
                    }.frame(height: 100)

                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundColor(Color.white)
                            .shadow(color: Color.gray.opacity(0.3), radius: 8, x: 0, y: 4)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text("📊 Analysis")
                                .foregroundColor(.black)
                                .font(.headline)
                            
                            Text("At this stage, your steps appear 51% higher on average when you do go to the gym.")
                                .foregroundColor(.black)
                                .font(.subheadline)
                            HStack(alignment: .center, spacing: 5) {
                                Text("67%")
                                    .font(.system(size: 36, weight: .bold)) // Large font for percentage
                                    .foregroundColor(.blue) // Change the color as desired
                                
                                Text("likelihood of achieving step goal on gym day")
                                    .font(.system(size: 14, weight: .semibold)) // Smaller font for the description
                        
                                    .foregroundColor(.black)
                                    .frame(width: 120)
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
                    }.frame(height:170)
                    
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
                    }
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
