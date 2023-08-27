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

struct LocationsChart: View {
    var body: some View {
        Chart {
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
        }.chartLegend(position: .bottom, alignment: .center, spacing: 7)
    }

    let seriesData = [
        (
            type: "Standing", data: [
                (weekday: "Mon", sales: 54),
                (weekday: "Tue", sales: 42),
                (weekday: "Wed", sales: 88),
                (weekday: "Thu", sales: 49),
                (weekday: "Fri", sales: 42),
                (weekday: "Sat", sales: 125),
                (weekday: "Sun", sales: 67)
            ]
        ),
        (
            type: "Active", data: [
                (weekday: "Mon", sales: 81),
                (weekday: "Tue", sales: 90),
                (weekday: "Wed", sales: 52),
                (weekday: "Thu", sales: 72),
                (weekday: "Fri", sales: 84),
                (weekday: "Sat", sales: 84),
                (weekday: "Sun", sales: 137)
            ]
        )
    ]
}

func date(year: Int, month: Int, day: Int = 1) -> Date {
    Calendar.current.date(from: DateComponents(year: year, month: month, day: day)) ?? Date()
}
//['2023-03-31', '2023-04-03', '2023-05-08', '2023-05-18', '2023-06-12', '2023-06-19', '2023-07-01', '2023-07-02', '2023-07-03', '2023-07-04', '2023-07-31']

struct ExperimentRecommendation: View {
    var body: some View {
        VStack(alignment: .leading) {
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
//            Text("Missing Data Streaks")
//                .font(.title2)
//                .fontWeight(.semibold)
//            
//            Text("Patterns of no data collected")
//                .font(.footnote)
//                .foregroundStyle(.gray)
//            Text("Daily Averages of Standing & Active Minutes")
//                .font(.title2)
//                .fontWeight(.semibold)
//            
//            Text("Daily average across 18 months")
//                .font(.footnote)
//                .foregroundStyle(.gray)
//            LocationsChart()
            
            
//            Chart {
//                ForEach(averageMins) { series in
//                    ForEach(series.mins, id: \.day) { element in
//                        LineMark(
//                            x: .value("Day", element.day, unit: .day),
//                            y: .value("Sales", element.mins)
//                        )
//                    }
//                    .foregroundStyle(by: .value("Type", series.type))
//                    .symbol(by: .value("Type", series.type))
//                    .interpolationMethod(.catmullRom)
//                }
//            }
            //            HStack(spacing: 20) {
            //                VStack {
            //                    Text("Total Days of Data")
            //                        .font(.title3)
            //                        .foregroundColor(.blue)
            //                    Text("629")
            //                        .font(.headline)
            //                }
            //
            //                VStack {
            //                    Text("Missing Days")
            //                        .font(.title3)
            //                        .foregroundColor(.blue)
            //                    Text("11")
            //                        .font(.headline)
            //                }
            //
            //            }
            
            
            //            GeometryReader { geometry in
            //                Chart(adherenceDays) { element in
            //                    BarMark(
            //                        x: .value("Name", element.name),
            //                        y: .value("Missing Days", element.days)
            //                    )
            //                }
            //                .frame(width: geometry.size.width, height: 250) // Set the chart height here
            //            }.padding()
            //        }
        }.padding()
    }
}

struct ExperimentRecommendation_Previews: PreviewProvider {
    static var previews: some View {
        ExperimentRecommendation()
    }
}
