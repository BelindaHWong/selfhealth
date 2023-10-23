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
    .init(name: "Missing Days", days: 142),
    .init(name: "Complete Days", days: 629)
]

let averageMins: [HealthData] = [
    .init(day: "Monday", type: "Standing Minutes", mins: 40)
    
]

struct StepsChart: View {
    var body: some View {
        Text("Steps - Daily Average")
            .font(.title3)
            .fontWeight(.semibold)
        
        Text("Your daily average of 9,395 steps across 1.5 years is less than the recommendation of 10,000 steps per day.")
            .font(.system(size: 14))
            .font(.footnote)

        let recValue = 10000
        Chart {
            RuleMark(
                y: .value("Recommend", recValue)
            )
            .lineStyle(StrokeStyle(lineWidth: 2, dash: [5, 5], dashPhase: 0)).foregroundStyle(.orange)
        
            ForEach(seriesData, id: \.type) { series in
                ForEach(series.data, id: \.weekday) {
                    LineMark(
                        x: .value("Weekday", $0.weekday),
                        y: .value("Sales", $0.sales)
                    )
                }
                .foregroundStyle(by: .value("City", series.type))
                .symbol(by: .value("City", series.type))
                .interpolationMethod(.catmullRom)

            }
        }
        .chartYAxisLabel("Steps")
        .chartLegend(position: .bottom, alignment: .center, spacing: 7) {
            HStack {
                Image(systemName: "circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 8, height: 8)
                            .foregroundColor(.blue)
                Text("Steps (Average)").font(.caption2).foregroundColor(.secondary)
                    
                Image(systemName: "line.diagonal")
                    .rotationEffect(Angle(degrees: 45))
                    .foregroundColor(.orange)
                Text("WHO Guideline").font(.caption2).foregroundColor(.secondary)
            }
        }
    }

    let seriesData = [
        (
            type: "Steps (Average)", data: [
                (weekday: "Mon", sales: 8423),
                (weekday: "Tue", sales: 6843),
                (weekday: "Wed", sales: 10221),
                (weekday: "Thu", sales: 7877),
                (weekday: "Fri", sales: 6400),
                (weekday: "Sat", sales: 13721),
                (weekday: "Sun", sales: 12282)
            ]
        )
    ]
}

struct LocationsChart: View {
    var body: some View {
        Text("Active Minutes - Daily Average")
            .font(.title3)
            .fontWeight(.semibold)
        
        Text("Your daily average of 80 minutes across 1.5 years exceeds the recommendation of 60 minutes per day.")
            .font(.system(size: 14))
            .font(.footnote)
//            .foregroundStyle(.gray)
        let recValue = 60
        Chart {
            RuleMark(
                y: .value("Recommend", recValue)
            )
            .lineStyle(StrokeStyle(lineWidth: 2, dash: [5, 5], dashPhase: 0)).foregroundStyle(.orange)
            
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
            
//            .annotation(position: .top, alignment: .trailing) {
//                Text("Guideline: \(recValue, format: .number)")
//                    .font(.headline)
//                    .foregroundStyle(.orange)
//
//            }
        }
        .chartYAxisLabel("Mins")
        .chartLegend(position: .bottom, alignment: .center, spacing: 7) {
            HStack {
                Image(systemName: "circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 8, height: 8)
                            .foregroundColor(.blue)
                Text("Active Minutes (Average) ").font(.caption2).foregroundColor(.secondary)
                    
                Image(systemName: "line.diagonal")
                    .rotationEffect(Angle(degrees: 45))
                    .foregroundColor(.orange)
                Text("WHO Guideline").font(.caption2).foregroundColor(.secondary)
            }
        }
        
    }

    let seriesData = [
        (
            type: "Active Minutes (Average)", data: [
                (weekday: "Mon", sales: 64),
                (weekday: "Tue", sales: 45),
                (weekday: "Wed", sales: 105),
                (weekday: "Thu", sales: 77),
                (weekday: "Fri", sales: 55),
                (weekday: "Sat", sales: 122),
                (weekday: "Sun", sales: 89)
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
    @State private var isPilatesSelected = false
    @State private var isGymSelected = false
    @State private var isShowingNextScreen = false
    @State private var selectedExercise = ""
    @EnvironmentObject private var appState: AppState
    
    @State private var isDropdownVisible = false
    @State private var selectedOption = "Select exercise option"
    var dropdownOptions = ["🏋🏾 Gym", "🧘🏼‍♀️ Pilates", "🚶🏻‍♀️ Walking"]
    
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
                } else if(selectedOption == "🧘🏼‍♀️ Pilates") {
                    isPilatesSelected = true
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

                let selectedExercise = isWalkingSelected ? "walking" : isPilatesSelected ? "pilates" : isGymSelected ? "gym" : ""
                

                let header = Text("Based on your data: I want to change my ")
                let choice = HStack {
                    Text(selectedOption)
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
                    ActionSheet(title: Text("Select exercise option for your self-experiment").bold(), buttons: dropdownButtons())
                }
                .font(.system(size: 14))
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0))
                .foregroundColor(.blue)
                .background(Color.white)
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                let headerEnding = Text("").foregroundColor(Color.black).bold() + Text(" to observe impacts on my ") + Text("step count").foregroundColor(Color.blue).bold() + Text(".")

            
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
                                Text("Start Experiment!")
                                    .font(.footnote)
                                    .foregroundColor(.blue)

                            }
                        }
                        
                    }
                }
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                .background(Color.green.opacity(0.25))
                .cornerRadius(12)
                .frame(width:360, height:170)
                
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
