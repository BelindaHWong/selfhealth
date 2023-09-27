//
//  ExperimentSummaryView.swift
//  SelfHealth
//
//  Created by Belinda Wong on 23/7/2023.
//

import SwiftUI
import Charts
struct Activity: Identifiable {
    let id = UUID()
    var condition: String
    var date: Date
    var hoursOfSunshine: Double

    init(condition: String, day: Int, month: Int, year: Int, hoursOfSunshine: Double) {
        let calendar = Calendar.autoupdatingCurrent
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        self.condition = condition
        self.date = calendar.date(from: components)!
        self.hoursOfSunshine = hoursOfSunshine
    }
}

var data: [Activity] = [
    Activity(condition: "Running", day: 1, month: 3, year: 2023, hoursOfSunshine: 10400),

    // ...
    Activity(condition: "Running", day: 4, month: 3, year: 2023, hoursOfSunshine: 14200),
    Activity(condition: "Not Running", day: 2, month: 3, year: 2023, hoursOfSunshine: 10200),
    Activity(condition: "Running", day: 5, month: 3, year: 2023, hoursOfSunshine: 12200),
    Activity(condition: "Not Running", day: 7, month: 3, year: 2023, hoursOfSunshine: 11200),
    Activity(condition: "Running", day: 8, month: 3, year: 2023, hoursOfSunshine: 16200),
    Activity(condition: "Not Running", day: 9, month: 3, year: 2023, hoursOfSunshine: 10200),
    Activity(condition: "Running", day: 10, month: 3, year: 2023, hoursOfSunshine: 16200),
    Activity(condition: "Not Running", day: 11, month: 3, year: 2023, hoursOfSunshine: 7200),
    Activity(condition: "Running", day: 12, month: 3, year: 2023, hoursOfSunshine: 12200),
    Activity(condition: "Not Running", day: 13, month: 3, year: 2023, hoursOfSunshine: 8200)
]

var pilatesData: [Activity] = [
    Activity(condition: "Pilates", day: 12, month: 6, year: 2023, hoursOfSunshine: 58),
    Activity(condition: "Not Pilates", day: 13, month: 6, year: 2023, hoursOfSunshine: 18),
    Activity(condition: "Not Pilates", day: 14, month: 6, year: 2023, hoursOfSunshine: 68),
    Activity(condition: "Pilates", day: 15, month: 6, year: 2023, hoursOfSunshine: 63),
    Activity(condition: "Pilates", day: 16, month: 6, year: 2023, hoursOfSunshine: 23),
    Activity(condition: "Pilates", day: 17, month: 6, year: 2023, hoursOfSunshine: 43),
    Activity(condition: "Not Pilates", day: 18, month: 6, year: 2023, hoursOfSunshine: 53)
]

var walkingData: [Activity] = [
    Activity(condition: "Walking", day: 16, month: 8, year: 2023, hoursOfSunshine: 128),
    Activity(condition: "Not Walking", day: 17, month: 8, year: 2023, hoursOfSunshine: 68),
    Activity(condition: "Not Walking", day: 18, month: 8, year: 2023, hoursOfSunshine: 98),
    Activity(condition: "Walking", day: 19, month: 8, year: 2023, hoursOfSunshine: 163),
    Activity(condition: "Walking", day: 20, month: 8, year: 2023, hoursOfSunshine: 123),
    Activity(condition: "Walking", day: 21, month: 8, year: 2023, hoursOfSunshine: 176),
    Activity(condition: "Not Walking", day: 22, month: 8, year: 2023, hoursOfSunshine: 82),
    Activity(condition: "Not Walking", day: 23, month: 8, year: 2023, hoursOfSunshine: 54),
    Activity(condition: "Walking", day: 24, month: 8, year: 2023, hoursOfSunshine: 103)
]

struct ChartView: View {
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
            "Running": Color(hue: 0.33, saturation: 0.81, brightness: 0.76),
            "Not Running": Color(hue:0, saturation: 0.81, brightness: 0.76)
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
            "Not Pilates": Color(hue:0, saturation: 0.81, brightness: 0.76)
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
            "Not Walking": Color(hue:0, saturation: 0.81, brightness: 0.76)
        ])
    }
}

struct TableView: View {
    var body: some View {
        // Replace this with your table view implementation
        Text("Table View")
    }
}




                                                    
struct ExperimentSummaryView: View {
    @State var isActive = true
    @State private var showMoreText1 = false
    @State private var showMoreText2 = false
    @State private var showMoreText3 = false
    @State private var isChartSelected = true
    @State private var isListSelected = false

    var body: some View {
        if(!isActive) {
            ZStack {
                Color.orange
                Image(systemName: "list.clipboard.fill")
                    .foregroundColor(Color.white)
                    .font(.system(size: 100.0))
            }
        } else {
            VStack(alignment: .leading, spacing: 10) {
                
                
                Text("Past Experiments")
                    .font(.title)
                    .fontWeight(.semibold)
                HStack {
                    Text("Mar 1, 2023 - Mar 13, 2023")
                        .font(.title3).bold().foregroundColor(.blue)
 
                        Spacer()
                        Button(action: {
                            showMoreText1.toggle()
                        }) {
                            Image(systemName: showMoreText1 ? "chevron.up.circle" : "chevron.down.circle")
                                .font(.system(size: 24))
                        }
                }

                    
                
                
                if showMoreText1 {
                    HStack {
                        Text("Running & step count: moderate casual relationship.").font(.subheadline).padding(.bottom, 5)
//                        Button(action: {
//                            isChartSelected.toggle()
//                            isListSelected = false
//                        }) {
//                            VStack {
//                                Image(systemName: "chart.bar.fill")
//                                    .resizable()
//                                    .frame(width: 15, height: 15)
//                                    .foregroundColor(isChartSelected ? .blue : .gray)
//
//                                Text("Chart")
//                                    .foregroundColor(isChartSelected ? .blue : .gray)
//                                    .font(.caption)
//                            }
//                        }
                        
//                        Button(action: {
//                            isListSelected.toggle()
//                            isChartSelected = false
//                        }) {
//                            VStack {
//                               Image(systemName: "list.bullet")
//                                   .resizable()
//                                   .frame(width: 15, height: 15)
//                                   .foregroundColor(isListSelected ? .blue : .gray)
//
//                               Text("Table")
//                                   .foregroundColor(isListSelected ? .blue : .gray)
//                                   .font(.caption)
//                           }
//                        }
                        
                    }.padding(.bottom, 5)
//                    if(isChartSelected) {
                        ChartView(data: data)
//                    }
                } else {
                    Text("Running & step count: moderate casual relationship.").font(.subheadline).padding(.bottom, 5)
                    
                }
                
                HStack {
                    Text("Jun 12, 2022 - Jun 19, 2023")
                        .font(.title3).bold().foregroundColor(.blue)
                        Spacer()
                        Button(action: {
                            showMoreText2.toggle()
                        }) {
                            Image(systemName: showMoreText2 ? "chevron.up.circle" : "chevron.down.circle")
                                .font(.system(size: 24))
                        }
                }
                    
                Text("Pilates & active mins: no causal relationship.").padding(.bottom, 5).font(.subheadline)
                    
                if showMoreText2 {
                    PilatesChartView(data: pilatesData)
                }
                
                HStack {
                    Text("Aug 16, 2023 - Aug 24, 2023")
                            .font(.title3).bold().foregroundColor(.blue)
                        Spacer()
                        Button(action: {
                            showMoreText3.toggle()
                        }) {
                            Image(systemName: showMoreText3 ? "chevron.up.circle" : "chevron.down.circle")
                                .font(.system(size: 24))
                        }
                }
                    
                Text("Walking & standing mins: strong causal relationship.").font(.subheadline)

                
                if showMoreText3 {
                    WalkingChartView(data: walkingData)
                }
               
                Spacer()
            }.padding()
        }


    }
}

struct ExperimentSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        ExperimentSummaryView()
    }
}
