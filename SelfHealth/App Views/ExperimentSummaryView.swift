//
//  ExperimentSummaryView.swift
//  SelfHealth
//
//  Created by Belinda Wong on 23/7/2023.
//

import SwiftUI
import Charts
struct MonthlyHoursOfSunshine: Identifiable {
    let id = UUID()
    var city: String
    var date: Date
    var hoursOfSunshine: Double

    init(city: String, day: Int, month: Int, year: Int, hoursOfSunshine: Double) {
        let calendar = Calendar.autoupdatingCurrent
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        self.city = city
        self.date = calendar.date(from: components)!
        self.hoursOfSunshine = hoursOfSunshine
    }
}

var data: [MonthlyHoursOfSunshine] = [
    MonthlyHoursOfSunshine(city: "Running", day: 1, month: 3, year: 2023, hoursOfSunshine: 10400),

    // ...
    MonthlyHoursOfSunshine(city: "Running", day: 4, month: 3, year: 2023, hoursOfSunshine: 14200),
    MonthlyHoursOfSunshine(city: "Not Running", day: 2, month: 3, year: 2023, hoursOfSunshine: 10200),
    MonthlyHoursOfSunshine(city: "Running", day: 5, month: 3, year: 2023, hoursOfSunshine: 12200),
    MonthlyHoursOfSunshine(city: "Not Running", day: 7, month: 3, year: 2023, hoursOfSunshine: 11200),
    MonthlyHoursOfSunshine(city: "Running", day: 8, month: 3, year: 2023, hoursOfSunshine: 16200),
    MonthlyHoursOfSunshine(city: "Not Running", day: 9, month: 3, year: 2023, hoursOfSunshine: 10200),
    MonthlyHoursOfSunshine(city: "Running", day: 10, month: 3, year: 2023, hoursOfSunshine: 16200),
    MonthlyHoursOfSunshine(city: "Not Running", day: 11, month: 3, year: 2023, hoursOfSunshine: 7200),
    MonthlyHoursOfSunshine(city: "Running", day: 12, month: 3, year: 2023, hoursOfSunshine: 12200),
    MonthlyHoursOfSunshine(city: "Not Running", day: 13, month: 3, year: 2023, hoursOfSunshine: 8200)
]


//var body: some View {
//    Chart(data) {
//        LineMark(
//            x: .value("Month", $0.date),
//            y: .value("Hours of Sunshine", $0.hoursOfSunshine)
//        )
//        .foregroundStyle(by: .value("City", $0.city))
//    }
//}

struct ExperimentSummaryView: View {
    @State var isActive = true
    @State private var showMoreText1 = false
    @State private var showMoreText2 = false
    @State private var showMoreText3 = false
    
    
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
                            .font(.title2)
                        Spacer()
                        Button(action: {
                            showMoreText1.toggle()
                        }) {
                            Image(systemName: showMoreText1 ? "chevron.up.circle" : "chevron.down.circle")
                                .font(.system(size: 24))
                        }
                }
                    
                Text("Pilates (cause) & step count (effect)")
                    
                if showMoreText1 {
                    Text("Additional information about your health data.")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    Chart(data) {
                        LineMark(
                            x: .value("Month", $0.date),
                            y: .value("Hours of Sunshine", $0.hoursOfSunshine)
                        )
                        .foregroundStyle(by: .value("City", $0.city))
                    }.chartLegend(position: .bottom, alignment: .center, spacing: 7)
                        .frame(width: 300, height: 200)
                }
                
                HStack {
                    Text("Dec 12, 2022 - Dec 19, 2022")
                            .font(.title2)
                        Spacer()
                        Button(action: {
                            showMoreText2.toggle()
                        }) {
                            Image(systemName: showMoreText2 ? "chevron.up.circle" : "chevron.down.circle")
                                .font(.system(size: 24))
                        }
                }
                    
                Text("Gym (cause) & active mins (effect)")
                    
                if showMoreText2 {
                    Text("Additional information about your health data.")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    Chart(data) {
                        LineMark(
                            x: .value("Month", $0.date),
                            y: .value("Hours of Sunshine", $0.hoursOfSunshine)
                        )
                        .foregroundStyle(by: .value("City", $0.city))
                    }.chartLegend(position: .bottom, alignment: .center, spacing: 7)
                        .frame(width: 300, height: 200)
                }
                
                HStack {
                    Text("Dec 12, 2022 - Dec 19, 2022")
                            .font(.title2)
                        Spacer()
                        Button(action: {
                            showMoreText3.toggle()
                        }) {
                            Image(systemName: showMoreText3 ? "chevron.up.circle" : "chevron.down.circle")
                                .font(.system(size: 24))
                        }
                }
                    
                Text("Running (cause) & standing mins (effect)")
                    
                if showMoreText3 {
                    Text("Additional information about your health data.")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    Chart(data) {
                        LineMark(
                            x: .value("Month", $0.date),
                            y: .value("Hours of Sunshine", $0.hoursOfSunshine)
                        )
                        .foregroundStyle(by: .value("City", $0.city))
                    }.chartLegend(position: .bottom, alignment: .center, spacing: 7)
                        .frame(width: 300, height: 200)
                }
            }.padding()
        }


    }
}

struct ExperimentSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        ExperimentSummaryView()
    }
}
