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
    Activity(condition: "Not Running", day: 3, month: 3, year: 2023, hoursOfSunshine: 8200),
    Activity(condition: "Running", day: 4, month: 3, year: 2023, hoursOfSunshine: 14200),
    Activity(condition: "Not Running", day: 2, month: 3, year: 2023, hoursOfSunshine: 10200),
    Activity(condition: "Running", day: 5, month: 3, year: 2023, hoursOfSunshine: 12200),
    Activity(condition: "Incomplete", day: 6, month: 3, year: 2023, hoursOfSunshine: 7200),
    Activity(condition: "Not Running", day: 7, month: 3, year: 2023, hoursOfSunshine: 11200),
    Activity(condition: "Running", day: 8, month: 3, year: 2023, hoursOfSunshine: 16200),
    Activity(condition: "Not Running", day: 9, month: 3, year: 2023, hoursOfSunshine: 10200),
    Activity(condition: "Running", day: 10, month: 3, year: 2023, hoursOfSunshine: 16200)
 /*   Activity(condition: "Not Running", day:*/ /*11, month: 3, year: 2023, hoursOfSunshine: 7200)*/
]

var YogaData: [Activity] = [
    Activity(condition: "Yoga", day: 12, month: 4, year: 2023, hoursOfSunshine: 58),
    Activity(condition: "Not Yoga", day: 13, month: 4, year: 2023, hoursOfSunshine: 18),
    Activity(condition: "Not Yoga", day: 14, month: 4, year: 2023, hoursOfSunshine: 68),
    Activity(condition: "Yoga", day: 15, month: 4, year: 2023, hoursOfSunshine: 63),
    Activity(condition: "Yoga", day: 16, month: 4, year: 2023, hoursOfSunshine: 23),
    Activity(condition: "Incomplete", day: 17, month: 4, year: 2023, hoursOfSunshine: 63),
    Activity(condition: "Yoga", day: 18, month: 4, year: 2023, hoursOfSunshine: 43),
    Activity(condition: "Not Yoga", day: 19, month: 4, year: 2023, hoursOfSunshine: 53)
]

var walkingData: [Activity] = [
    Activity(condition: "Walking", day: 16, month: 5, year: 2023, hoursOfSunshine: 128),
    Activity(condition: "Not Walking", day: 17, month: 5, year: 2023, hoursOfSunshine: 68),
    Activity(condition: "Not Walking", day: 18, month: 5, year: 2023, hoursOfSunshine: 78),
    Activity(condition: "Walking", day: 19, month: 5, year: 2023, hoursOfSunshine: 163),
    Activity(condition: "Walking", day: 20, month: 5, year: 2023, hoursOfSunshine: 133),
    Activity(condition: "Walking", day: 21, month: 5, year: 2023, hoursOfSunshine: 176),
    Activity(condition: "Not Walking", day: 22, month: 5, year: 2023, hoursOfSunshine: 82),
    Activity(condition: "Not Walking", day: 23, month: 5, year: 2023, hoursOfSunshine: 54)
]

struct ChartView: View {
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
            .frame(width: 350, height: 140)
        .chartForegroundStyleScale([
            "Running": Color(hue: 0.33, saturation: 0.81, brightness: 0.76),
            "Not Running": Color(hue:0, saturation: 0.81, brightness: 0.76),
            "Incomplete": Color(hue: 0.0833, saturation: 0.86, brightness: 1.0)
        ])
        .chartYAxisLabel("Steps")
        .chartXAxis {
            AxisMarks(values: .automatic(desiredCount: 4))
        }
    }
}

struct YogaChartView: View {
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
            .frame(width: 350, height: 140)
        .chartForegroundStyleScale([
            "Yoga": Color(hue: 0.33, saturation: 0.81, brightness: 0.76),
            "Not Yoga": Color(hue:0, saturation: 0.81, brightness: 0.76),
            "Incomplete": Color(hue: 0.0833, saturation: 0.86, brightness: 1.0)
        ])
        .chartYAxisLabel("Mins")
    }
}

struct WalkingChartView: View {
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
            .frame(width: 350, height: 140)
        .chartForegroundStyleScale([
            "Walking": Color(hue: 0.33, saturation: 0.81, brightness: 0.76),
            "Not Walking": Color(hue:0, saturation: 0.81, brightness: 0.76)
        ])
        .chartYAxisLabel("Mins")
    }
}

struct TableView: View {
    var body: some View {
        Text("Table View")
    }
}
                                           
struct ExperimentSummaryView: View {
    @State var isActive = true
    @State private var showMoreText1 = true
    @State private var showMoreText2 = true
    @State private var showMoreText3 = true
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
                    Text("March 1 - March 10, 2023 (10 days)")
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
                        Text("If you run, your step count is moderately higher.").font(.subheadline)
                    }.padding(.bottom, 5)

                        ChartView(data: data)

                } else {
                    Text("If you run, your step count is moderately higher.").font(.subheadline).padding(.bottom, 5)
                    
                }
                
                HStack {
                    Text("April 12 - April 19, 2023 (8 days)")
                        .font(.title3).bold().foregroundColor(.blue)
                        Spacer()
                        Button(action: {
                            showMoreText2.toggle()
                        }) {
                            Image(systemName: showMoreText2 ? "chevron.up.circle" : "chevron.down.circle")
                                .font(.system(size: 24))
                        }
                }
                    
                Text("If you do yoga, this does not affect active minutes.").font(.subheadline)
                    
                if showMoreText2 {
                    YogaChartView(data: YogaData)
                }
                
                HStack {
                    Text("May 16 - May 23, 2023 (8 days)")
                            .font(.title3).bold().foregroundColor(.blue)
                        Spacer()
                        Button(action: {
                            showMoreText3.toggle()
                        }) {
                            Image(systemName: showMoreText3 ? "chevron.up.circle" : "chevron.down.circle")
                                .font(.system(size: 24))
                        }
                }
                    
                Text("If you do walks, standing minutes are much higher.").font(.subheadline)

                
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
