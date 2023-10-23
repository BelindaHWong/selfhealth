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
//    @State var isDayOne = true
    @State var isDayOne = false
    @State private var selectedCause = "Select completion status"
//    @State private var selectedCause = "Completed ✅"
    @State private var isChartSelected = true
    @State private var isListSelected = false
    var isExperimentActive: Bool = true
    var condition: String = ""
    static let shared = HomeView()
    
    @State private var isDropdownVisible = false
    

    var causeOptions = ["Completed ✅", "Incomplete ⚠️"]
    
    private func dropdownButtons() -> [ActionSheet.Button] {
        var buttons: [ActionSheet.Button] = []

        for option in causeOptions {
            let button = ActionSheet.Button.default(Text(option)) {
                self.selectedCause = option
                
            }
            buttons.append(button)
        }

        let cancelButton = ActionSheet.Button.cancel {
            self.isDropdownVisible.toggle()
        }
        buttons.append(cancelButton)

        return buttons
    }
    
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

    struct MissingDayOneGymChartView: View {
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
                "Incomplete": Color(hue: 0.0833, saturation: 0.86, brightness: 1.0)
            ])
            
           
        }
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
    
    struct AnalysisChartView: View {
        var data: [Activity]
        
        var body: some View {
            Chart {
                ForEach(data) { data in
                    
                    BarMark(
                        x: .value("Month", data.date, unit: .weekdayOrdinal),
                        y: .value("Hours of Sunshine", data.hoursOfSunshine)
                    )
                    .foregroundStyle(by: .value("condition", data.condition))
                    .cornerRadius(2)
                    
                }
            }
            .chartForegroundStyleScale([
                "Gym": Color(hue: 0.33, saturation: 0.81, brightness: 0.76),
                "No Gym": Color(hue:0, saturation: 0.81, brightness: 0.76),
                "Incomplete": Color(hue: 0.0833, saturation: 0.86, brightness: 1.0)
            ])
            .chartYAxisLabel("Steps")
            .chartLegend(position: .bottom, alignment: .center, spacing: 7)
            .frame(width: 330, height: 145)
        }
    }
    
    struct PilatesAnalysisChartView: View {
        var data: [Activity]
        
        var body: some View {
            Chart {
                ForEach(data) { data in
                    
                    BarMark(
                        x: .value("Month", data.date, unit: .weekdayOrdinal),
                        y: .value("Hours of Sunshine", data.hoursOfSunshine)
                    )
                    .foregroundStyle(by: .value("condition", data.condition))
                    .cornerRadius(2)
                    
                }
            }
            .chartYAxisLabel("Steps")
            .chartForegroundStyleScale([
                "Pilates": Color(hue: 0.33, saturation: 0.81, brightness: 0.76),
                "No Pilates": Color(hue:0, saturation: 0.81, brightness: 0.76),
                "Incomplete": Color(hue: 0.0833, saturation: 0.86, brightness: 1.0)
            ])
            .chartLegend(position: .bottom, alignment: .center, spacing: 7)
        }
    }
    
    struct WalkingAnalysisChartView: View {
        var data: [Activity]
        
        var body: some View {
            Chart {
                ForEach(data) { data in
                    
                    BarMark(
                        x: .value("Month", data.date, unit: .weekdayOrdinal),
                        y: .value("Hours of Sunshine", data.hoursOfSunshine)
                    )
                    .foregroundStyle(by: .value("condition", data.condition))
                    .cornerRadius(2)
                    
                }
            }
            .chartYAxisLabel("Steps")
            .chartForegroundStyleScale([
                "Walking": Color(hue: 0.33, saturation: 0.81, brightness: 0.76),
                "No Walking": Color(hue:0, saturation: 0.81, brightness: 0.76),
                "Incomplete": Color(hue: 0.0833, saturation: 0.86, brightness: 1.0)
            ])
            .chartLegend(position: .bottom, alignment: .center, spacing: 7)
        }
    }
    
    struct GymChartView: View {
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
            .chartYAxisLabel("Steps")
            .chartLegend(position: .bottom, alignment: .center, spacing: 7)
                .frame(width: 350, height: 170)
            .chartForegroundStyleScale([
                "Gym": Color(hue: 0.33, saturation: 0.81, brightness: 0.76),
                "No Gym": Color(hue:0, saturation: 0.81, brightness: 0.76),
                "Incomplete": Color(hue: 0.0833, saturation: 0.86, brightness: 1.0)
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
            .chartYAxisLabel("Steps")
            .chartLegend(position: .bottom, alignment: .center, spacing: 7)
                .frame(width: 350, height: 130)
            .chartForegroundStyleScale([
                "Pilates": Color(hue: 0.33, saturation: 0.81, brightness: 0.76),
                "No Pilates": Color(hue:0, saturation: 0.81, brightness: 0.76),
                "Incomplete": Color(hue: 0.0833, saturation: 0.86, brightness: 1.0)
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
            .chartYAxisLabel("Steps")
            .chartLegend(position: .bottom, alignment: .center, spacing: 7)
                .frame(width: 350, height: 130)
            .chartForegroundStyleScale([
                "Walking": Color(hue: 0.33, saturation: 0.81, brightness: 0.76),
                "No Walking": Color(hue:0, saturation: 0.81, brightness: 0.76),
                "Incomplete": Color(hue: 0.0833, saturation: 0.86, brightness: 1.0)
            ])
        }
    }
    
    struct HeadingRow: View {
        var body: some View {
            HStack {
                Text("Date   ")
                    .padding(.horizontal, 30) // Add horizontal padding to "Date."
                Text("Gym")
                    .padding(.horizontal, 27) // Add horizontal padding to "Gym."
                Text("Steps")
                    .padding(.horizontal, 20) // Add horizontal padding to "Steps."
            }
            .padding(10)
        }
    }
    
    struct WalkingHeadingRow: View {
        var body: some View {
            HStack {
                Text("Date ")
                    .padding(.horizontal, 27) // Add horizontal padding to "Date."
                Text("Walking")
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
                Text("Date   ")
                    .padding(.horizontal, 30) // Add horizontal padding to "Date."
                Text("Pilates")
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
    
    var dayOneMissingData: [Activity] = [
        Activity(condition: "Incomplete", day: 29, month: 5, year: 2023, hoursOfSunshine: 10515)
    ]
    
    var gymData: [Activity] = [
        Activity(condition: "Gym", day: 29, month: 5, year: 2023, hoursOfSunshine: 10515),
        Activity(condition: "No Gym", day: 31, month: 5, year: 2023, hoursOfSunshine: 3413),
        Activity(condition: "Incomplete", day: 30, month: 5, year: 2023, hoursOfSunshine: 7644),
        Activity(condition: "Gym", day: 1, month: 6, year: 2023, hoursOfSunshine: 11303),
        Activity(condition: "No Gym", day: 2, month: 6, year: 2023, hoursOfSunshine: 7640),
        Activity(condition: "Gym", day: 3, month: 6, year: 2023, hoursOfSunshine: 12844),
        Activity(condition: "No Gym", day: 4, month: 6, year: 2023, hoursOfSunshine: 5449),
        Activity(condition: "Gym", day: 5, month: 6, year: 2023, hoursOfSunshine: 9391)
    ]
    
    var gymDataIncomplete: [Activity] = [
        Activity(condition: "Gym", day: 29, month: 5, year: 2023, hoursOfSunshine: 10515),
        Activity(condition: "No Gym", day: 31, month: 5, year: 2023, hoursOfSunshine: 3413),
        Activity(condition: "Incomplete", day: 30, month: 5, year: 2023, hoursOfSunshine: 7644),
        Activity(condition: "Gym", day: 1, month: 6, year: 2023, hoursOfSunshine: 11303),
        Activity(condition: "No Gym", day: 2, month: 6, year: 2023, hoursOfSunshine: 7640),
        Activity(condition: "Gym", day: 3, month: 6, year: 2023, hoursOfSunshine: 12844),
        Activity(condition: "No Gym", day: 4, month: 6, year: 2023, hoursOfSunshine: 5449),
        Activity(condition: "Incomplete", day: 5, month: 6, year: 2023, hoursOfSunshine: 9391)
    ]
    
    var pilatesData: [Activity] = [
        Activity(condition: "Pilates", day: 29, month: 5, year: 2023, hoursOfSunshine: 10515),
        Activity(condition: "No Pilates", day: 31, month: 5, year: 2023, hoursOfSunshine: 3413),
        Activity(condition: "Incomplete", day: 30, month: 5, year: 2023, hoursOfSunshine: 7644),
        Activity(condition: "Pilates", day: 1, month: 6, year: 2023, hoursOfSunshine: 11303),
        Activity(condition: "No Pilates", day: 2, month: 6, year: 2023, hoursOfSunshine: 7640),
        Activity(condition: "Pilates", day: 3, month: 6, year: 2023, hoursOfSunshine: 12844),
        Activity(condition: "No Pilates", day: 4, month: 6, year: 2023, hoursOfSunshine: 5449),
        Activity(condition: "Pilates", day: 5, month: 6, year: 2023, hoursOfSunshine: 9391)
    ]
    
    var pilatesDataIncomplete: [Activity] = [
        Activity(condition: "Pilates", day: 29, month: 5, year: 2023, hoursOfSunshine: 10515),
        Activity(condition: "No Pilates", day: 31, month: 5, year: 2023, hoursOfSunshine: 3413),
        Activity(condition: "Incomplete", day: 30, month: 5, year: 2023, hoursOfSunshine: 7644),
        Activity(condition: "Pilates", day: 1, month: 6, year: 2023, hoursOfSunshine: 11303),
        Activity(condition: "No Pilates", day: 2, month: 6, year: 2023, hoursOfSunshine: 7640),
        Activity(condition: "Pilates", day: 3, month: 6, year: 2023, hoursOfSunshine: 12844),
        Activity(condition: "No Pilates", day: 4, month: 6, year: 2023, hoursOfSunshine: 5449),
        Activity(condition: "Incomplete", day: 5, month: 6, year: 2023, hoursOfSunshine: 9391)
    ]

    var walkingData: [Activity] = [
        Activity(condition: "Walking", day: 29, month: 5, year: 2023, hoursOfSunshine: 10515),
        Activity(condition: "No Walking", day: 31, month: 5, year: 2023, hoursOfSunshine: 3413),
        Activity(condition: "Incomplete", day: 30, month: 5, year: 2023, hoursOfSunshine: 7644),
        Activity(condition: "Walking", day: 1, month: 6, year: 2023, hoursOfSunshine: 11303),
        Activity(condition: "No Walking", day: 2, month: 6, year: 2023, hoursOfSunshine: 7640),
        Activity(condition: "Walking", day: 3, month: 6, year: 2023, hoursOfSunshine: 12844),
        Activity(condition: "No Walking", day: 4, month: 6, year: 2023, hoursOfSunshine: 5449),
        Activity(condition: "Walking", day: 5, month: 6, year: 2023, hoursOfSunshine: 9391)
    ]
    
    var walkingDataIncomplete: [Activity] = [
        Activity(condition: "Walking", day: 29, month: 5, year: 2023, hoursOfSunshine: 10515),
        Activity(condition: "No Walking", day: 31, month: 5, year: 2023, hoursOfSunshine: 3413),
        Activity(condition: "Incomplete", day: 30, month: 5, year: 2023, hoursOfSunshine: 7644),
        Activity(condition: "Walking", day: 1, month: 6, year: 2023, hoursOfSunshine: 11303),
        Activity(condition: "No Walking", day: 2, month: 6, year: 2023, hoursOfSunshine: 7640),
        Activity(condition: "Walking", day: 3, month: 6, year: 2023, hoursOfSunshine: 12844),
        Activity(condition: "No Walking", day: 4, month: 6, year: 2023, hoursOfSunshine: 5449),
        Activity(condition: "Incomplete", day: 5, month: 6, year: 2023, hoursOfSunshine: 9391)
    ]
    
    @State private var dayOnePeople = [
        Person(givenName: "Mon 29/05/23", familyName: " ✅", emailAddress: "  10,515")
    ]
    
    @State private var dayOneMissing = [
        Person(givenName: "Mon 29/05/23", familyName: " ⚠️", emailAddress: "  10,515")
    ]
    
    @State private var people = [
        Person(givenName: "Mon 29/05/23", familyName: "  ✅", emailAddress: " 10,515"),
        Person(givenName: "Tue 30/05/23", familyName: "   ⚠️", emailAddress: "   3,413"),
        Person(givenName: "Wed 31/05/23", familyName: "  ❌", emailAddress: "   7,644"),
        Person(givenName: "Thu 01/06/23", familyName: "   ✅", emailAddress: " 11,303"),
        Person(givenName: "Fri 02/06/23", familyName: "     ❌", emailAddress: "  7,640"),
        Person(givenName: "Sat 03/06/23", familyName: "   ✅", emailAddress: " 12,844"),
        Person(givenName: "Sun 04/06/23", familyName: "  ❌", emailAddress: "  5,449"),
        Person(givenName: "Mon 05/06/23", familyName: " ✅", emailAddress: "   9,391")
    ]
    
    @State private var peopleMissing = [
        Person(givenName: "Mon 29/05/23", familyName: "  ✅", emailAddress: " 10,515"),
        Person(givenName: "Tue 30/05/23", familyName: "   ⚠️", emailAddress: "   3,413"),
        Person(givenName: "Wed 31/05/23", familyName: "  ❌", emailAddress: "   7,644"),
        Person(givenName: "Thu 01/06/23", familyName: "   ✅", emailAddress: " 11,303"),
        Person(givenName: "Fri 02/06/23", familyName: "     ❌", emailAddress: "  7,640"),
        Person(givenName: "Sat 03/06/23", familyName: "   ✅", emailAddress: " 12,844"),
        Person(givenName: "Sun 04/06/23", familyName: "  ❌", emailAddress: "  5,449"),
        Person(givenName: "Mon 05/06/23", familyName: " ⚠️", emailAddress: "   9,391")
    ]

    struct PersonRow: View {
        let person: Person

        var body: some View {
            HStack(spacing: 40) {
                Text(person.givenName)
                    .font(.subheadline)
                    
                
                Text(person.familyName)
                    .font(.subheadline)

                Text(person.emailAddress)
                    .font(.subheadline)
                    .padding(.horizontal, 16)
            }

        }
    }
    
    struct PeopleList: View {
        @Binding var people: [Person]

        var body: some View {
            HeadingRow()
                 .font(.headline)
            
            List(people) { person in
                PersonRow(person: person)
                    .listRowSeparator(.visible)
            }
            .listStyle(.plain)
        }
    }
    
    struct PilatesList: View {
        @Binding var people: [Person]

        var body: some View {
            PilatesHeadingRow()
                 .font(.headline)
            
            List(people) { person in
                PersonRow(person: person)
                    .listRowSeparator(.visible)
            }
            .listStyle(.plain)
        }
    }
    
    struct WalkingList: View {
        @Binding var people: [Person]

        var body: some View {
            WalkingHeadingRow()
                 .font(.headline)
            
            List(people) { person in
                PersonRow(person: person)
                    .listRowSeparator(.visible)
            }
            .listStyle(.plain)
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
        if(isExperimentActive) {
            VStack(alignment: .leading, spacing: 11) {
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
                    
                    
                }.frame(height: 75)
                
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

                        HStack {
                            Text(selectedCause)
                                .onTapGesture {
                                    self.isDropdownVisible.toggle()
                                }.bold()
                            
                            Image(systemName: "chevron.down")
                                .padding(.horizontal, 5)
                                .onTapGesture {
                                    self.isDropdownVisible.toggle()
                                }
                        }
                        .actionSheet(isPresented: $isDropdownVisible) {
                            ActionSheet(title: Text("Select whether you have completed today's action").bold(), buttons: dropdownButtons())
                        }
                        .font(.system(size: 14))
                        .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 0))
                        .foregroundColor(.blue)
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                        
                        
                    }
                    .padding(10)
                }.frame(height: 70)
                
                
                
                
                let analysis = ZStack {
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
                                Text("Log days with both conditions of doing gym gym and not doing gym to receive experiment analysis.")
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
                                let header = Text("Your steps are clasified ") + Text("physically active").foregroundColor(Color(hue: 0.33, saturation: 0.81, brightness: 0.76)).bold() + Text(" on gym days and ") + Text("physically inactive").foregroundColor(Color(hue:0, saturation: 0.81, brightness: 0.76)).bold() + Text(" on non-gym days.")
                              
                                header
                                    .foregroundColor(.black)
                                    .font(.system(size: 13.5))
                                    .font(.subheadline)
                                
                                if(selectedCause == "Completed ✅") {
                                    AnalysisChartView(data: gymData)
                                } else {
                                    AnalysisChartView(data: gymDataIncomplete)
                                }
                                
                            } else if(condition == "pilates") {
                                let header = Text("Your steps are classified ") + Text("physically active").foregroundColor(Color(hue: 0.33, saturation: 0.81, brightness: 0.76)).bold() + Text(" on pilates days and ") + Text("physically inactive").foregroundColor(Color(hue:0, saturation: 0.81, brightness: 0.76)).bold() + Text(" on non-pilates days.")
                                
                                header
                                    .foregroundColor(.black)
                                    .font(.system(size: 13))
                                    .font(.subheadline)
                                if(selectedCause == "Completed ✅") {
                                    PilatesAnalysisChartView(data: pilatesData)
                                } else {
                                    PilatesAnalysisChartView(data: pilatesDataIncomplete)
                                }
                                
                            } else if(condition == "walking") {
                                let header = Text("Your steps are classified ") + Text("physically active").foregroundColor(Color(hue: 0.33, saturation: 0.81, brightness: 0.76)).bold() + Text(" on walking days and ") + Text("physically inactive").foregroundColor(Color(hue:0, saturation: 0.81, brightness: 0.76)).bold() + Text(" on non-walking days.")
                              
                                header
                                    .foregroundColor(.black)
                                    .font(.system(size: 13.5))
                                    .font(.subheadline)
                                if(selectedCause == "Completed ✅") {
                                    WalkingAnalysisChartView(data: walkingData)
                                } else {
                                    WalkingAnalysisChartView(data: walkingDataIncomplete)
                                }
                                
                            }
                        
                        }
                        
                        
                        
                    }
                    .padding()
                }
                
                if(!isDayOne) {
                    analysis.frame(height:250)
                    
                } else {
                    analysis.frame(height: 130)
                }
                
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
                            if(isDayOne && selectedCause == "Completed ✅") {
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
                                
                            } else if(isDayOne && selectedCause == "Incomplete ⚠️") {
                                if(condition == "gym") {
                                    MissingDayOneGymChartView(data: dayOneMissingData)
                                        .frame(width: 330, height: 160)
                                } else if(condition == "pilates") {
                                    MissingDayOneGymChartView(data: dayOneMissingData)
                                        .frame(width: 330, height: 160)
                                } else if(condition == "walking") {
                                    MissingDayOneGymChartView(data: dayOneMissingData)
                                        .frame(width: 330, height: 160)
                                }
                            }
                            
                            else if(!isDayOne && selectedCause == "Completed ✅") {
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
                                
                            } else if(!isDayOne && selectedCause == "Incomplete ⚠️") {
                                if(condition == "gym") {
                                    GymChartView(data: gymDataIncomplete)
                                        .frame(width: 330, height: 160)
                                } else if(condition == "pilates") {
                                    PilatesChartView(data: pilatesDataIncomplete)
                                        .frame(width: 330, height: 160)
                                } else if(condition == "walking") {
                                    WalkingChartView(data: walkingDataIncomplete)
                                        .frame(width: 330, height: 160)
                                }
                                
                            }
                            else {
                                Text("Please select completion status of Today's Action to view experiment results.")
                                    .font(.system(size: 16))
                            }
                            
                        } else if(isListSelected) {
                            if(isDayOne && selectedCause == "Incomplete ⚠️") {
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
                            } else if(!isDayOne && selectedCause == "Completed ✅") {
                                if(condition == "gym") {
                                    PeopleList(people: $people)
                                } else if(condition == "pilates") {
                                    PilatesList(people: $people)
                                } else if(condition == "walking") {
                                    WalkingList(people: $people)
                                }
                            } else if(!isDayOne && selectedCause == "Incomplete ⚠️") {
                                if(condition == "gym") {
                                    PeopleList(people: $peopleMissing)
                                } else if(condition == "pilates") {
                                    PilatesList(people: $peopleMissing)
                                } else if(condition == "walking") {
                                    WalkingList(people: $peopleMissing)
                                }
                            }
                                else {
                                Text("Please select completion status of Today's Action to view experiment results.")
                                    .font(.system(size: 16))
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
