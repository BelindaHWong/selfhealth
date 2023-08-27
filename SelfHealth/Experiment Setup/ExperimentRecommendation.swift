//
//  ExperimentRecommendation.swift
//  SelfHealth
//
//  Created by Belinda Wong on 1/8/2023.
//

import SwiftUI
import Charts

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
    .init(name: "Complete Days", days: 11),
    .init(name: "Missing Days", days: 629)
]

let averageMins: [HealthData] = [
    .init(day: "Monday", type: "Standing Minutes", mins: 40)
    
]

struct StepsChart: View {
    var body: some View {
        Text("Steps")
            .font(.title2)
            .fontWeight(.semibold)
        
        Text("Your daily average of 9,212 steps across 18 months is less than the WHO guideline of 10,000 steps per day.")
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
            .lineStyle(StrokeStyle(lineWidth: 3)).foregroundStyle(.orange)
//            .annotation(position: .top, alignment: .trailing) {
//                Text("Recommended: \(recValue, format: .number)")
//                    .font(.headline)
//                    .foregroundStyle(.orange)
//            
//            }
        }
    
        .chartLegend(position: .bottom, alignment: .center, spacing: 7)
    }

    let seriesData = [
        (
            type: "Active Minutes", data: [
                (weekday: "Mon", sales: 8423),
                (weekday: "Tue", sales: 6843),
                (weekday: "Wed", sales: 12282),
                (weekday: "Thu", sales: 10221),
                (weekday: "Fri", sales: 16721),
                (weekday: "Sat", sales: 7877),
                (weekday: "Sun", sales: 6400)
            ]
        )
    ]
}

struct LocationsChart: View {
    var body: some View {
        Text("Active Minutes")
            .font(.title2)
            .fontWeight(.semibold)
        
        Text("Your daily average of 80 minutes across 18 months is more than the WHO guideline of 60 minutes per day.")
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
                .foregroundStyle(.blue.opacity(0.25))
                .foregroundStyle(by: .value("City", series.type))
                .symbol(by: .value("City", series.type))
                .interpolationMethod(.catmullRom)

            }
            RuleMark(
                y: .value("Recommend", recValue)
            )
            .lineStyle(StrokeStyle(lineWidth: 3)).foregroundStyle(.orange)
            .annotation(position: .top, alignment: .trailing) {
                Text("Recommended: \(recValue, format: .number)")
                    .font(.headline)
                    .foregroundStyle(.orange)
            
            }
        }
        .chartLegend(position: .bottom, alignment: .center, spacing: 7)
    }

    let seriesData = [
        (
            type: "Active Minutes", data: [
                (weekday: "Mon", sales: 54),
                (weekday: "Tue", sales: 42),
                (weekday: "Wed", sales: 88),
                (weekday: "Thu", sales: 79),
                (weekday: "Fri", sales: 92),
                (weekday: "Sat", sales: 65),
                (weekday: "Sun", sales: 67)
            ]
        )
    ]
}

func date(year: Int, month: Int, day: Int = 1) -> Date {
    Calendar.current.date(from: DateComponents(year: year, month: month, day: day)) ?? Date()
}
//['2023-03-31', '2023-04-03', '2023-05-08', '2023-05-18', '2023-06-12', '2023-06-19', '2023-07-01', '2023-07-02', '2023-07-03', '2023-07-04', '2023-07-31']

struct DataCompleteness: View {
    var body: some View {
        Text("Data Completeness")
            .font(.title2)
            .fontWeight(.semibold)
        
        Text("How many days of wearable data do you have?")
            .font(.footnote)
            .foregroundStyle(.gray)
        ZStack {
            Chart(adherenceDays, id: \.name) { element in
                SectorMark(
                    angle: .value("Days", element.days),
                    innerRadius: .ratio(0.618),
                    angularInset: 1.5
                )
                .cornerRadius(4)
                .foregroundStyle(by: .value("Name", element.name))
            }
            .frame(height: 300)
            .chartXAxis(.hidden)
            .chartLegend(position: .bottom, alignment: .center, spacing: 7)
            VStack {
                Text("98%")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("of days have data")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
        }
        .padding()
    }
}

struct ExperimentRecommendation: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Text("Select a preferred exercise")
                .font(.title2)
                .fontWeight(.semibold)
    
            HStack(alignment: .center, spacing: 5) {
                Button(action: {
                    // Button action code here
                    print("View Recommendation Button Tapped")
                }) {
                    HStack(spacing: 10) {
                        Image(systemName: "dumbbell.fill")
                            .resizable()
                            .frame(width: 15, height: 15) // Set the size of the health icon
                            .foregroundColor(.white) // Set the color of the health icon
                        
                        Text("Gym")
                            .foregroundColor(.white) // Set the text color to white
                            .font(.headline) // Set the font style for the label
                    }.frame(width:70,height:10)
                
                    .padding()
                    .background(Color.blue) // Set the background color of the button
                    .cornerRadius(16) // Set the corner radius of the button
                }
                Button(action: {
                    // Button action code here
//                    print("View Recommendation Button Tapped")
                    
                }) {
                    HStack() {
                        Image(systemName: "figure.pilates")
                            .resizable()
                            .frame(width: 20, height: 15) // Set the size of the health icon
                            .foregroundColor(.white) // Set the color of the health icon
                        
                        Text("Pilates")
                            .foregroundColor(.white) // Set the text color to white
                            .font(.headline) // Set the font style for the label
                    }.frame(width:90,height:10)
                
                    .padding()
                    .background(Color.blue) // Set the background color of the button
                    .cornerRadius(16) // Set the corner radius of the button
                }
                Button(action: {
                    // Button action code here
                    print("View Recommendation Button Tapped")
                }) {
                    HStack() {
                        Image(systemName: "figure.run")
                            .resizable()
                            .frame(width: 15, height: 15) // Set the size of the health icon
                            .foregroundColor(.white) // Set the color of the health icon
                        
                        Text("Running")
                            .foregroundColor(.white) // Set the text color to white
                            .font(.headline) // Set the font style for the label
                    }.frame(width:90,height:10)
                
                    .padding()
                    .background(Color.blue) // Set the background color of the button
                    .cornerRadius(16) // Set the corner radius of the button
                }
            }
//            Text("Your experiment recommendation")
//                .font(.title2)
//                .fontWeight(.semibold)
//            
            let header = Text("Based on your historical data and preferences, we recommend changing your ") + Text("gym (cause)").foregroundColor(Color.black).bold() + Text(" to observe impacts on your ") + Text("step count (effect)").foregroundColor(Color.black).bold() + Text(".")
//            header.font(.subheadline)
//                .multilineTextAlignment(.center)
            VStack(alignment: .center, spacing: 10) {
                Text("Your experiment recommendation 🔬")
                    .font(.headline)
                    .foregroundColor(.black)
                header.font(.subheadline).foregroundColor(.black).multilineTextAlignment(.center)
//                Button(action: {
//                    // Proceed action here
//                }) {
//                    Text("Proceed >")

//                }
//                HStack {
//                    Spacer()
//                    Button(action: {
//                        // Proceed action here
//                    }) {
//                        Text("Proceed >")
//                            .font(.footnote)
//                            .foregroundColor(.black)
//                            .underline() // Add underline to the text
//                    }
//                }
            }
            .padding()
            .background(Color.orange.opacity(0.5))
            .cornerRadius(12)
            .frame(width:350, height:150)
            

          
//            Text("Missing Data Streaks")
//                .font(.title2)
//                .fontWeight(.semibold)
//            
//            Text("Patterns of no data collected")
//                .font(.footnote)
//                .foregroundStyle(.gray)
            StepsChart()
            LocationsChart()
            
            

        }.padding()
    }
}

struct ExperimentRecommendation_Previews: PreviewProvider {
    static var previews: some View {
        ExperimentRecommendation()
    }
}
