//
//  HomeView.swift
//  SelfHealth
//
//  Created by Belinda Wong on 23/7/2023.
//

import SwiftUI
import Charts

struct HomeView: View {
    // isDayOne default is true. False for second part of user study.
    @State var isDayOne = true
//    @State var isDayOne = false
    @State private var isActivityCompleteSelected = false
    @State private var isActivityUncompleteSelected = false
    @State private var selectedCause = ""
    @State private var isChartSelected = false
    @State private var isListSelected = true
    var isExperimentActive: Bool = false
    var condition: String = ""
    static let shared = HomeView()
    
    var causeOptions = ["Cannot Complete❓", "Completed ✅"]
    
    mutating func toggleActive() {
        isExperimentActive = true
    }
    
    struct Person: Identifiable {
        let givenName: String
        var familyName: String
        var emailAddress: String
        let id = UUID()


        var fullName: String { givenName + " " + familyName }
        
    }

    struct DayOneGymChartView: View {
        var data: [Activity]
        var body: some View {
            Chart(data) {
            PointMark(
                    x: .value("Month", $0.date, unit: .weekdayOrdinal),
                    y: .value("Hours of Sunshine", $0.hoursOfSunshine)
                )
                .foregroundStyle(by: .value("condition", $0.condition))
                .symbol(by: .value("condition", $0.condition))
            }
            .chartLegend(position: .bottom, alignment: .center, spacing: 7)
                .frame(width: 350, height: 130)
            .chartForegroundStyleScale([
                "Gym": Color(hue: 0.33, saturation: 0.81, brightness: 0.76)
            ])
            
           
        }
    }
    
    struct DayOnePilatesChartView: View {
        var data: [Activity]
        var body: some View {
            // Replace this with your chart view implementation
            Chart(data) {
            PointMark(
                    x: .value("Month", $0.date, unit: .weekdayOrdinal),
                    y: .value("Hours of Sunshine", $0.hoursOfSunshine)
                )
                .foregroundStyle(by: .value("condition", $0.condition))
                .symbol(by: .value("condition", $0.condition))
            }
            .chartLegend(position: .bottom, alignment: .center, spacing: 7)
                .frame(width: 350, height: 130)
            .chartForegroundStyleScale([
                "Pilates": Color(hue: 0.33, saturation: 0.81, brightness: 0.76)
            ])
        }
    }
    
    struct DayOneWalkingChartView: View {
        var data: [Activity]
        var body: some View {
            // Replace this with your chart view implementation
            Chart(data) {
            PointMark(
                    x: .value("Month", $0.date, unit: .weekdayOrdinal),
                    y: .value("Hours of Sunshine", $0.hoursOfSunshine)
                )
                .foregroundStyle(by: .value("condition", $0.condition))
                .symbol(by: .value("condition", $0.condition))
            }
            .chartLegend(position: .bottom, alignment: .center, spacing: 7)
                .frame(width: 350, height: 130)
            .chartForegroundStyleScale([
                "Walking": Color(hue: 0.33, saturation: 0.81, brightness: 0.76)
            ])
        }
    }
    
    struct GymChartView: View {
        var data: [Activity]
        var body: some View {
            // Replace this with your chart view implementation
            Chart(data) {
            PointMark(
                    x: .value("Month", $0.date, unit: .weekdayOrdinal),
                    y: .value("Hours of Sunshine", $0.hoursOfSunshine)
                )
                .foregroundStyle(by: .value("condition", $0.condition))
                .symbol(by: .value("condition", $0.condition))
            }
            .chartLegend(position: .bottom, alignment: .center, spacing: 7)
                .frame(width: 350, height: 130)
            .chartForegroundStyleScale([
                "Gym": Color(hue: 0.33, saturation: 0.81, brightness: 0.76),
                "No Gym": Color(hue:0, saturation: 0.81, brightness: 0.76),
                "Missing": Color(hue: 0.0833, saturation: 0.86, brightness: 1.0)
            ])
        }
    }
    
    struct PilatesChartView: View {
        var data: [Activity]
        var body: some View {
            // Replace this with your chart view implementation
            Chart(data) {
            PointMark(
                    x: .value("Month", $0.date, unit: .weekdayOrdinal),
                    y: .value("Hours of Sunshine", $0.hoursOfSunshine)
                )
                .foregroundStyle(by: .value("condition", $0.condition))
                .symbol(by: .value("condition", $0.condition))
            }
            .chartLegend(position: .bottom, alignment: .center, spacing: 7)
                .frame(width: 350, height: 130)
            .chartForegroundStyleScale([
                "Pilates": Color(hue: 0.33, saturation: 0.81, brightness: 0.76),
                "No Pilates": Color(hue:0, saturation: 0.81, brightness: 0.76),
                "Missing": Color(hue: 0.0833, saturation: 0.86, brightness: 1.0)
            ])
        }
    }
    
    struct WalkingChartView: View {
        var data: [Activity]
        var body: some View {
            // Replace this with your chart view implementation
            Chart(data) {
            PointMark(
                    x: .value("Month", $0.date, unit: .weekdayOrdinal),
                    y: .value("Hours of Sunshine", $0.hoursOfSunshine)
                )
                .foregroundStyle(by: .value("condition", $0.condition))
                .symbol(by: .value("condition", $0.condition))
            }
            .chartLegend(position: .bottom, alignment: .center, spacing: 7)
                .frame(width: 350, height: 130)
            .chartForegroundStyleScale([
                "Walking": Color(hue: 0.33, saturation: 0.81, brightness: 0.76),
                "No Walking": Color(hue:0, saturation: 0.81, brightness: 0.76),
                "Missing": Color(hue: 0.0833, saturation: 0.86, brightness: 1.0)
            ])
        }
    }
    
    struct HeadingRow: View {
        var body: some View {
            HStack {
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
    
    struct WalkingHeadingRow: View {
        var body: some View {
            HStack {
                Text("Date")
                    .padding(.horizontal, 30) // Add horizontal padding to "Date."
                Text(" Walking")
                    .padding(.horizontal, 20) // Add horizontal padding to "Gym."
                Text("Steps")
                    .padding(.horizontal, 20) // Add horizontal padding to "Steps."
            }
            .padding(10)
        }
    }
    
    struct PilatesHeadingRow: View {
        var body: some View {
            HStack {
                Text("Date")
                    .padding(.horizontal, 30) // Add horizontal padding to "Date."
                Text("   Pilates")
                    .padding(.horizontal, 20) // Add horizontal padding to "Gym."
                Text("Steps")
                    .padding(.horizontal, 20) // Add horizontal padding to "Steps."
            }
            .padding(10)
        }
    }
    
    var dayOneGymData: [Activity] = [
        Activity(condition: "Gym", day: 29, month: 5, year: 2023, hoursOfSunshine: 6515)
    ]
    
    var dayOnePilatesData: [Activity] = [
        Activity(condition: "Pilates", day: 29, month: 5, year: 2023, hoursOfSunshine: 6515)
    ]
    
    var dayOneWalkingData: [Activity] = [
        Activity(condition: "Walking", day: 29, month: 5, year: 2023, hoursOfSunshine: 6515)
    ]
    
    var gymData: [Activity] = [
        Activity(condition: "Gym", day: 29, month: 5, year: 2023, hoursOfSunshine: 6515),
        Activity(condition: "No Gym", day: 31, month: 5, year: 2023, hoursOfSunshine: 5413),
        Activity(condition: "Missing", day: 30, month: 5, year: 2023, hoursOfSunshine: 5391),
        Activity(condition: "Gym", day: 1, month: 6, year: 2023, hoursOfSunshine: 5303),
        Activity(condition: "No Gym", day: 2, month: 6, year: 2023, hoursOfSunshine: 3640),
        Activity(condition: "Gym", day: 3, month: 6, year: 2023, hoursOfSunshine: 9781),
        Activity(condition: "No Gym", day: 4, month: 6, year: 2023, hoursOfSunshine: 6449),
        Activity(condition: "Gym", day: 5, month: 6, year: 2023, hoursOfSunshine: 6844)
    ]
    
    var pilatesData: [Activity] = [
        Activity(condition: "Pilates", day: 29, month: 5, year: 2023, hoursOfSunshine: 6515),
        Activity(condition: "No Pilates", day: 31, month: 5, year: 2023, hoursOfSunshine: 5413),
        Activity(condition: "Missing", day: 30, month: 5, year: 2023, hoursOfSunshine: 5391),
        Activity(condition: "Pilates", day: 1, month: 6, year: 2023, hoursOfSunshine: 5303),
        Activity(condition: "No Pilates", day: 2, month: 6, year: 2023, hoursOfSunshine: 3640),
        Activity(condition: "Pilates", day: 3, month: 6, year: 2023, hoursOfSunshine: 9781),
        Activity(condition: "No Pilates", day: 4, month: 6, year: 2023, hoursOfSunshine: 6449),
        Activity(condition: "Pilates", day: 5, month: 6, year: 2023, hoursOfSunshine: 6844)
    ]
    
    var walkingData: [Activity] = [
        Activity(condition: "Walking", day: 29, month: 5, year: 2023, hoursOfSunshine: 6515),
        Activity(condition: "No Walking", day: 31, month: 5, year: 2023, hoursOfSunshine: 5413),
        Activity(condition: "Missing", day: 30, month: 5, year: 2023, hoursOfSunshine: 5391),
        Activity(condition: "Walking", day: 1, month: 6, year: 2023, hoursOfSunshine: 5303),
        Activity(condition: "No Walking", day: 2, month: 6, year: 2023, hoursOfSunshine: 3640),
        Activity(condition: "Walking", day: 3, month: 6, year: 2023, hoursOfSunshine: 9781),
        Activity(condition: "No Walking", day: 4, month: 6, year: 2023, hoursOfSunshine: 6449),
        Activity(condition: "Walking", day: 5, month: 6, year: 2023, hoursOfSunshine: 6844)
    ]

    
    @State private var dayOnePeople = [
        Person(givenName: "Mon 29/05/23", familyName: "  ✅", emailAddress: "   6,515")
    ]
    
    @State private var dayOneMissing = [
        Person(givenName: "Mon 29/05/23", familyName: "  ❓", emailAddress: "   6,515")
    ]
    
    @State private var people = [
        Person(givenName: "Mon 29/05/23", familyName: "  ✅", emailAddress: "   6,515"),
        Person(givenName: "Tue 30/05/23", familyName: "   ❓", emailAddress: "   5,391"),
        Person(givenName: "Wed 31/05/23", familyName: "  ❌", emailAddress: "   5,413"),
        Person(givenName: "Thu 01/06/23", familyName: "   ✅", emailAddress: "   5,303"),
        Person(givenName: "Fri 02/06/23", familyName: "     ❌", emailAddress: "  3,640"),
        Person(givenName: "Sat 03/06/23", familyName: "    ✅", emailAddress: "   9,781"),
        Person(givenName: "Sun 04/06/23    ", familyName: "  ❌", emailAddress: "   6,449"),
        Person(givenName: "Mon 05/06/23", familyName: "  ✅", emailAddress: "  6,844")
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
    
    struct PilatesList: View {
        @Binding var people: [Person]

        var body: some View {
            PilatesHeadingRow() // Add a heading row with titles.
                 .font(.headline)
            
            List(people) { person in
                PersonRow(person: person)
                    .listRowSeparator(.visible) // Apply gray lines as row separators.
            }
            .listStyle(.plain) // Use plain list style for cleaner appearance.
        }
    }
    
    struct WalkingList: View {
        @Binding var people: [Person]

        var body: some View {
            WalkingHeadingRow() // Add a heading row with titles.
                 .font(.headline)
            
            List(people) { person in
                PersonRow(person: person)
                    .listRowSeparator(.visible) // Apply gray lines as row separators.
            }
            .listStyle(.plain) // Use plain list style for cleaner appearance.
        }
    }
    
    struct InactiveVstack: View {
        var body: some View {
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
    
   
    
    var body: some View {
        //        toggleActive()

        //        isExperimentActive = ExperimentRecommendation.isShowing
        //        ExperimentRecommendation(isShowingNextScreen: isExperimentActive)
        if(isExperimentActive) {
            VStack(alignment: .leading, spacing: 5) {
                if(isDayOne) {
                    Text("Experiment Summary: 29 May 2023")
                        .font(.system(size: 20))
                        .font(.title2)
                        .fontWeight(.semibold)
                } else {
                    Text("Experiment Summary: 5 June 2023")
                        .font(.system(size: 20))
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(Color.white)
                        .shadow(color: Color.gray.opacity(0.3), radius: 8, x: 0, y: 4)
                    
                    VStack(alignment: .center, spacing: 4) {
                        if selectedCause == "" {
                            
                        }
                        if(condition == "gym") {
                            Text("📌 Today's Action: Do Gym")
                                .foregroundColor(.black)
                                .font(.headline)
                        } else if(condition == "pilates") {
                            Text("📌 Today's Action: Do Pilates")
                                .foregroundColor(.black)
                                .font(.headline)
                        } else if(condition == "walking") {
                            Text("📌 Today's Action: Do Walking")
                                .foregroundColor(.black)
                                .font(.headline)
                        }
                        
                        Picker("Cause", selection: $selectedCause) {
                            ForEach(causeOptions, id: \.self) { option in
                                Text(option)
                                    .tag(option)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .frame(maxWidth: .infinity, maxHeight: 20)
                        .font(.system(size: 9))
                        
                        
                        
                    }
                    .padding(10)
                }.frame(height: 70)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(Color.white)
                        .shadow(color: Color.gray.opacity(0.3), radius: 8, x: 0, y: 4)
                    
                    VStack(spacing: 4) {
                        if(condition == "gym") {
                            Text("🌟 Current Goal: If I do gym, does that affect my step count?")
                                .foregroundColor(.black)
                                .font(.headline)
                                .multilineTextAlignment(.center)
                        } else if(condition == "pilates") {
                            Text("🌟 Current Goal: If I do pilates, does that affect my step count?")
                                .foregroundColor(.black)
                                .font(.headline)
                                .multilineTextAlignment(.center)
                        } else if(condition == "walking") {
                            Text("🌟 Current Goal: If I do walking, does that affect my step count?")
                                .foregroundColor(.black)
                                .font(.headline)
                                .multilineTextAlignment(.center)
                        }
                    }
                    .padding(16)
                    
                    
                }.frame(height: 80)
                
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(Color.white)
                        .shadow(color: Color.gray.opacity(0.3), radius: 8, x: 0, y: 4)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        if(isDayOne) {
                            Text("📊 Analysis: Day 1 (Started today)")
                                .foregroundColor(.black)
                                .font(.headline)
                        } else {
                            Text("📊 Analysis: Day 8 (Started 29 May)")
                                .foregroundColor(.black)
                                .font(.headline)
                        }
                        
                        if(isDayOne) {
                            if(condition == "gym") {
                                Text("Log days with both conditions of doing gym and not doing gym to receive experiment analysis.")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15))
                                    .font(.subheadline)
                            } else if(condition == "pilates") {
                                Text("Log days with both conditions of doing pilates and not doing pilates to receive experiment analysis.")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15))
                                    .font(.subheadline)
                            } else if(condition == "walking") {
                                Text("Log days with both conditions of doing walking and not doing walking to receive experiment analysis.")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15))
                                    .font(.subheadline)
                            }
                        } else {
                            if(condition == "gym") {
                                Text("At this stage, your steps are higher when you do gym. Your steps average 7,111 steps on gym days and 5,167 steps on non-gym days.")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14))
                                    .font(.subheadline)
                            } else if(condition == "pilates") {
                                Text("At this stage, your steps are higher when you do pilates. Your steps average 7,111 steps on pilates days and 5,167 steps on non-pilates days.")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14))
                                    .font(.subheadline)
                            } else if(condition == "walking") {
                                Text("At this stage, your steps are higher when you do walking. Your steps average 7,111 steps on walking days and 5,167 steps on non-walking days.")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14))
                                    .font(.subheadline)
                            }
                            
                            HStack(alignment: .center, spacing: 10) {
                                Text("75%")
                                    .font(.system(size: 28, weight: .bold)) // Large font for percentage
                                    .foregroundColor(.blue) // Change the color as desired
                                if(condition == "gym") {
                                    Text("of gym days, you reached your long-term steps average of 5,977.")
                                        .font(.system(size: 14, weight: .semibold))
                                        .foregroundColor(.black)
                                        .frame(width: 120)
                                } else if(condition == "pilates") {
                                    Text("of pilates days, you reached your long-term steps average of 5,977.")
                                        .font(.system(size: 14, weight: .semibold))
                                        .foregroundColor(.black)
                                        .frame(width: 120)
                                } else if(condition == "walking") {
                                    Text("of walking days, you reached your long-term steps average of 5,977.")
                                        .font(.system(size: 14, weight: .semibold))
                                        .foregroundColor(.black)
                                        .frame(width: 120)
                                }
                                
                                Spacer()
                                
                                if(selectedCause == "Cannot Complete❓") {
                                    Text("6")
                                        .font(.system(size: 28, weight: .bold)) // Large font for percentage
                                        .foregroundColor(.green) // Change the color as desired
                                } else {
                                    Text("7")
                                        .font(.system(size: 28, weight: .bold)) // Large font for percentage
                                        .foregroundColor(.green) // Change the color as desired
                                }
                                
                                
                                Text("day(s) of complete data")
                                    .font(.system(size: 14, weight: .semibold)) // Smaller font for the description
                                    .foregroundColor(.black)
                                    .frame(width: 80)
                            }
                            //                            Spacer()
                            HStack(alignment: .center, spacing: 10) {
                                Text("33%")
                                    .font(.system(size: 28, weight: .bold)) // Large font for percentage
                                    .foregroundColor(.blue) // Change the color as desired
                                
                                Text("of non-gym days, you reached your steps average.")
                                    .font(.system(size: 14, weight: .semibold)) // Smaller font for the description
                                
                                    .foregroundColor(.black)
                                    .frame(width: 120)
                                Spacer()
                                
                                if(selectedCause == "Cannot Complete❓") {
                                    Text("2")
                                        .font(.system(size: 28, weight: .bold)) // Large font for percentage
                                        .foregroundColor(.red) // Change the color as desired
                                } else {
                                    Text("1")
                                        .font(.system(size: 28, weight: .bold)) // Large font for percentage
                                        .foregroundColor(.red) // Change the color as desired
                                }
                                Text("day(s) of missing data")
                                    .font(.system(size: 14, weight: .semibold)) // Smaller font for the description
                                    .foregroundColor(.black)
                                    .frame(width: 80)
                            }
                        }
                        
                        
                        
                    }
                    .padding()
                }
                .frame(height:250)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(Color.white)
                        .shadow(color: Color.gray.opacity(0.3), radius: 8, x: 0, y: 4)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text("📝 Experiment Results")
                                .foregroundColor(.black)
                                .font(.headline)
                            Spacer()
                            Button(action: {
                                isChartSelected.toggle()
                                isListSelected = false
                            }) {
                                VStack {
                                    Image(systemName: "chart.bar.fill")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(isChartSelected ? .blue : .gray)
                                    
                                    Text("Chart")
                                        .foregroundColor(isChartSelected ? .blue : .gray)
                                        .font(.caption)
                                }
                            }
                            
                            Button(action: {
                                isListSelected.toggle()
                                isChartSelected = false
                            }) {
                                VStack {
                                    Image(systemName: "list.bullet")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(isListSelected ? .blue : .gray)
                                    
                                    Text("Table")
                                        .foregroundColor(isListSelected ? .blue : .gray)
                                        .font(.caption)
                                }
                            }
                        }.padding(.bottom, 5)
                        
                        if(isChartSelected) {
                            if(isDayOne) {
                                if(condition == "gym") {
                                    DayOneGymChartView(data: dayOneGymData)
                                        .frame(width: 330, height: 160)
                                } else if(condition == "pilates") {
                                    DayOnePilatesChartView(data: dayOnePilatesData)
                                        .frame(width: 330, height: 160)
                                } else if(condition == "walking") {
                                    DayOneWalkingChartView(data: dayOneWalkingData)
                                        .frame(width: 330, height: 160)
                                }
                                
                            } else {
                                if(condition == "gym") {
                                    GymChartView(data: gymData)
                                        .frame(width: 330, height: 160)
                                } else if(condition == "pilates") {
                                    PilatesChartView(data: pilatesData)
                                        .frame(width: 330, height: 160)
                                } else if(condition == "walking") {
                                    WalkingChartView(data: walkingData)
                                        .frame(width: 330, height: 160)
                                }
                                
                            }
                            
                        } else if(isListSelected) {
                            if(isDayOne && selectedCause == "Cannot Complete❓") {
                                if(condition == "gym") {
                                    PeopleList(people: $dayOneMissing)
                                } else if(condition == "pilates") {
                                    PilatesList(people: $dayOneMissing)
                                } else if(condition == "walking") {
                                    WalkingList(people: $dayOneMissing)
                                }
                            }
                            else if(isDayOne && selectedCause == "Completed ✅") {
                                if(condition == "gym") {
                                    PeopleList(people: $dayOnePeople)
                                } else if(condition == "pilates") {
                                    PilatesList(people: $dayOnePeople)
                                } else if(condition == "walking") {
                                    WalkingList(people: $dayOnePeople)
                                }
                            } else if(!isDayOne) {
                                if(condition == "gym") {
                                    PeopleList(people: $people)
                                } else if(condition == "pilates") {
                                    PilatesList(people: $people)
                                } else if(condition == "walking") {
                                    WalkingList(people: $people)
                                }
                            }
                            
                        } else {
                            Text("Please select Chart or Table icon to view experiment results.")
                                .font(.system(size: 16))
                        }
                        
                    }
                    .padding(16)
                }.frame(height: 238)
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
