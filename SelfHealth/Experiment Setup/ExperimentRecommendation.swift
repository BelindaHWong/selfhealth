//
//  ExperimentRecommendation.swift
//  SelfHealth
//
//  Created by Belinda Wong on 1/8/2023.
//

import SwiftUI
import Charts
import UIKit

struct DropdownLabel: View {

    var dropdownOptions = ["Option 1", "Option 2", "Option 3"]
    @State private var isDropdownVisible = false
    @State private var selectedOption = "Select an option"

    var body: some View {
        Text(selectedOption)
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
            .onTapGesture {
                self.isDropdownVisible.toggle()
            }
            .actionSheet(isPresented: $isDropdownVisible) {
                ActionSheet(title: Text("Select an option"), buttons: dropdownButtons())
            }
    }

    private func dropdownButtons() -> [ActionSheet.Button] {
        var buttons: [ActionSheet.Button] = []

        for option in dropdownOptions {
            let button = ActionSheet.Button.default(Text(option)) {
                self.selectedOption = option
            }
            buttons.append(button)
        }

        let cancelButton = ActionSheet.Button.cancel {
            self.isDropdownVisible.toggle()
        }
        buttons.append(cancelButton)

        return buttons
    }
}

struct Activities: Identifiable {
    let name: String
    let days: Int
    var id: String { name }
}

struct HealthData: Identifiable {
    let day: String
    let type: String
    let mins: Int
    var id: String { type }
}

let adherenceDays: [Activities] = [
    .init(name: "Missing Days", days: 11),
    .init(name: "Complete Days", days: 629)
]

let averageMins: [HealthData] = [
    .init(day: "Monday", type: "Standing Minutes", mins: 40)
    
]

struct StepsChart: View {
    var body: some View {
        Text("Steps Average Per Day")
            .font(.title2)
            .fontWeight(.semibold)
        
        Text("Your daily average of 5,977 steps across 18 months is less than the WHO guideline of 10,000 steps per day.")
            .font(.system(size: 14))
            .font(.footnote)
//            .foregroundStyle(.gray)
        let recValue = 10000
        Chart {
            ForEach(seriesData, id: \.type) { series in
                ForEach(series.data, id: \.weekday) {
                    LineMark(
                        x: .value("Weekday", $0.weekday),
                        y: .value("Sales", $0.sales)
                    )
                }
//                .foregroundStyle(.blue.opacity(0.25))
                .foregroundStyle(by: .value("City", series.type))
                .symbol(by: .value("City", series.type))
                .interpolationMethod(.catmullRom)

            }
            RuleMark(
                y: .value("Recommend", recValue)
            )
            .lineStyle(StrokeStyle(lineWidth: 3, dash: [5, 5], dashPhase: 0)).foregroundStyle(.orange)
//            .annotation(position: .top, alignment: .trailing) {
//                Text("Recommended: \(recValue, format: .number)")
//                    .font(.headline)
//                    .foregroundStyle(.orange)
//            
//            }
        }
        .chartYAxisLabel("Steps")
        .chartLegend(position: .bottom, alignment: .center, spacing: 7)
    }

    let seriesData = [
        (
            type: "Steps (Average)", data: [
                (weekday: "Mon", sales: 8423),
                (weekday: "Tue", sales: 6843),
                (weekday: "Wed", sales: 10221),
                (weekday: "Thu", sales: 7877),
                (weekday: "Fri", sales: 6400),
                (weekday: "Sat", sales: 16721),
                (weekday: "Sun", sales: 12282)
            ]
        )
    ]
}

struct LocationsChart: View {
    var body: some View {
        Text("Active Minutes Average Per Day")
            .font(.title2)
            .fontWeight(.semibold)
        
        Text("Your daily average of 80 minutes across 18 months is more than the WHO guideline of 60 minutes per day.")
            .font(.system(size: 14))
            .font(.footnote)
//            .foregroundStyle(.gray)
        let recValue = 60
        Chart {
            ForEach(seriesData, id: \.type) { series in
                ForEach(series.data, id: \.weekday) {
                    LineMark(
                        x: .value("Weekday", $0.weekday),
                        y: .value("Sales", $0.sales)
                    )
                }
                .foregroundStyle(.blue)
                .foregroundStyle(by: .value("City", series.type))
                .symbol(by: .value("City", series.type))
                .interpolationMethod(.catmullRom)

            }
            RuleMark(
                y: .value("Recommend", recValue)
            )
            .lineStyle(StrokeStyle(lineWidth: 3, dash: [5, 5], dashPhase: 0)).foregroundStyle(.orange)
//            .annotation(position: .top, alignment: .trailing) {
//                Text("Guideline: \(recValue, format: .number)")
//                    .font(.headline)
//                    .foregroundStyle(.orange)
//            
//            }
        }
        .chartYAxisLabel("Mins")
        
        .chartLegend(position: .bottom, alignment: .center, spacing: 7)
        
    }

    let seriesData = [
        (
            type: "Active Minutes (Average)", data: [
                (weekday: "Mon", sales: 54),
                (weekday: "Tue", sales: 42),
                (weekday: "Wed", sales: 88),
                (weekday: "Thu", sales: 67),
                (weekday: "Fri", sales: 65),
                (weekday: "Sat", sales: 92),
                (weekday: "Sun", sales: 79)
            ]
        )
    ]
}

func date(year: Int, month: Int, day: Int = 1) -> Date {
    Calendar.current.date(from: DateComponents(year: year, month: month, day: day)) ?? Date()
}
//['2023-03-31', '2023-04-03', '2023-05-08', '2023-05-18', '2023-06-12', '2023-06-19', '2023-07-01', '2023-07-02', '2023-07-03', '2023-07-04', '2023-07-31']



struct ExperimentRecommendation: View {
    @State private var isWalkingSelected = false
    @State private var isYogaSelected = false
    @State private var isGymSelected = false
    @State private var isShowingNextScreen = false
    @State private var selectedExercise = ""
    @EnvironmentObject private var appState: AppState
    
    @State private var isDropdownVisible = false
    @State private var selectedOption = "Select exercise option"
    var dropdownOptions = ["🏋🏾 Gym", "🧘🏼‍♀️ Yoga", "🚶🏻‍♀️ Walking"]
    
    func getScreenValue() -> Bool {
        print("Value from Page: ", isShowingNextScreen)
        return isShowingNextScreen
    }
    
    private func dropdownButtons() -> [ActionSheet.Button] {
        var buttons: [ActionSheet.Button] = []

        for option in dropdownOptions {
            let button = ActionSheet.Button.default(Text(option)) {
                self.selectedOption = option
                if(selectedOption == "🏋🏾 Gym") {
                    isGymSelected = true
                } else if(selectedOption == "🧘🏼‍♀️ Yoga") {
                    isYogaSelected = true
                } else if(selectedOption == "🚶🏻‍♀️ Walking") {
                    isWalkingSelected = true
                }
            }
            buttons.append(button)
        }

        let cancelButton = ActionSheet.Button.cancel {
            self.isDropdownVisible.toggle()
        }
        buttons.append(cancelButton)

        return buttons
    }
    
    var body: some View {
          
        if(isShowingNextScreen) {
//                            HomeView.init(isExperimentActive: true)
            ExperimentSummaryView(isActive: true)
            
        
//            HomeView.toggleExperimentActive(self: HomeView)
//            HomeView(isExperimentActive: true)
//            HomeView(isExperimentActive: isShowingNextScreen)
           
        } else {
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Experiment Recommendation")
                    .font(.title2)
                    .fontWeight(.semibold)
                
//
//                HStack(alignment: .center, spacing: 5) {
//                    Button(action: {
//                        isWalkingSelected = false
//                        isYogaSelected = false
//                        isGymSelected.toggle()
//                    }) {
//                        HStack(spacing: 10) {
//                            Image(systemName: "dumbbell.fill")
//                                .resizable()
//                                .frame(width: 15, height: 15) // Set the size of the health icon
//                                .foregroundColor(isGymSelected ? .white : .blue) // Set the color of the health icon
//                            
//                            Text("Gym")
//                                .foregroundColor(isGymSelected ? .white : .blue) // Set the text color to white
//                                .font(.headline) // Set the font style for the label
//                        }.frame(width:70,height:10)
//                        
//                            .padding()
//                            .background(
//                                RoundedRectangle(cornerRadius: 16)
//                                    .stroke(isGymSelected ? Color.white : Color.blue, lineWidth: 2)
//                                    .background(isGymSelected ? Color.blue : Color.white)
//                            ) // Set the background color of the button
//                            .cornerRadius(16) // Set the corner radius of the button
//                        
//                    }
//                    Button(action: {
//                        // Button action code here
//                        //                    print("View Recommendation Button Tapped")
//                        isYogaSelected.toggle()
//                        isGymSelected = false
//                        isWalkingSelected = false
//                    }) {
//                        HStack() {
//                            Image(systemName: "figure.pilates")
//                                .resizable()
//                                .frame(width: 20, height: 15) // Set the size of the health icon
//                                .foregroundColor(isYogaSelected ? .white : .blue) // Set the color of the health icon
//                            
//                            Text("yoga")
//                                .foregroundColor(isYogaSelected ? .white : .blue) // Set the text color to white
//                                .font(.headline) // Set the font style for the label
//                        }.frame(width:90,height:10)
//                        
//                            .padding()
//                            .background(
//                                RoundedRectangle(cornerRadius: 16)
//                                    .stroke(isYogaSelected ? Color.white : Color.blue, lineWidth: 2)
//                                    .background(isYogaSelected ? Color.blue : Color.white)
//                            )
//                            .cornerRadius(16) // Set the corner radius of the button
//                    }
//                    Button(action: {
//                        // Button action code here
//                        print("View Recommendation Button Tapped")
//                        isWalkingSelected.toggle()
//                        isYogaSelected = false
//                        isGymSelected = false
//                    }) {
//                        HStack() {
//                            Image(systemName: "figure.run")
//                                .resizable()
//                                .frame(width: 15, height: 15) // Set the size of the health icon
//                                .foregroundColor(isWalkingSelected ? .white : .blue) // Set the color of the health icon
//                            
//                            Text("walking")
//                                .foregroundColor(isWalkingSelected ? .white : .blue) // Set the text color to white
//                                .font(.headline) // Set the font style for the label
//                        }.frame(width:90,height:10)
//                        
//                            .padding()
//                            .background(
//                                RoundedRectangle(cornerRadius: 16)
//                                    .stroke(isWalkingSelected ? Color.white : Color.blue, lineWidth: 2)
//                                    .background(isWalkingSelected ? Color.blue : Color.white)
//                            ) // Set the background color of the button
//                            .cornerRadius(16) // Set the corner radius of the button
//                    }
//                }
               
                let selectedExercise = isWalkingSelected ? "walking" : isYogaSelected ? "yoga" : isGymSelected ? "gym" : ""
                
                
//                let header = Text("Based on your historical data and preferences: I want to change my ") + Text(selectedExercise).bold() + Text(" (independent variable)").foregroundColor(Color.black).bold() + Text(" to observe impacts on my ") + Text("step count (dependent variable)").foregroundColor(Color.black).bold() + Text(".")
                let header = Text("Based on your data: I want to change my ")
                let choice = HStack {
                    Text(selectedOption)
                        .onTapGesture {
                            self.isDropdownVisible.toggle()
                        }
                    
                    Image(systemName: "chevron.down")
                        .padding(.horizontal, 5)
                        .onTapGesture {
                            self.isDropdownVisible.toggle()
                        }
                }
                .actionSheet(isPresented: $isDropdownVisible) {
                    ActionSheet(title: Text("Select exercise option for your self-experiment").bold(), buttons: dropdownButtons())
                }
                .font(.system(size: 14))
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 0))
                .foregroundColor(.blue)
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                let headerEnding = Text("").foregroundColor(Color.black).bold() + Text(" to observe impacts on my ") + Text("step count").foregroundColor(Color.black).bold() + Text(".")

            
                VStack(alignment: .center, spacing: 10) {
                    HStack {
                        Text("Your experiment goal")
                            .font(.headline)
                            .foregroundColor(.black)
                        Image(systemName: "lightbulb.max")
                            .resizable()
                            .frame(width: 22, height: 23) // Set the size of the health icon
                            .foregroundColor(.blue)
                    }
                    
                    header.font(.subheadline).foregroundColor(.black).multilineTextAlignment(.center)
                    choice
                    headerEnding.font(.subheadline).foregroundColor(.black).multilineTextAlignment(.center)
                    
                    HStack() {
                        Spacer()
                        if(selectedExercise != "") {
                            Button(action: {
                                isShowingNextScreen = true
                                appState.isActivated = true
                                var homeView = HomeView.shared
                                homeView.isExperimentActive = true
                                appState.condition = selectedExercise
                            }) {
                                Text("Start Experiment")
                                    .font(.footnote)
                                    .foregroundColor(.white)
                                    .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                                    .background(Color.blue)
                                    .cornerRadius(8)
                            }
                        }
                        
                    }
                }
                .padding()
                .background(Color.green.opacity(0.25))
                .cornerRadius(12)
                .frame(width:350, height:200)
                
                
                
                //            Text("Missing Data Streaks")
                //                .font(.title2)
                //                .fontWeight(.semibold)
                //
                //            Text("Patterns of no data collected")
                //                .font(.footnote)
                //                .foregroundStyle(.gray)
                //            DataCompleteness()
                StepsChart()
                LocationsChart()
            }.padding()
            
        }
        
    }

}

struct ExperimentRecommendation_Previews: PreviewProvider {
    static var previews: some View {
        ExperimentRecommendation()
    }
}
