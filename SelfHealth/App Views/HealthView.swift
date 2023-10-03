//
//  HealthView.swift
//  SelfHealth
//
//  Created by Belinda Wong on 24/7/2023.
//

import SwiftUI
import Charts

struct DataValidityChart: View {
    var body: some View {
        ZStack(alignment: .center) {
            Chart(adherenceDays, id: \.name) { element in
                SectorMark(
                    angle: .value("Days", element.days),
                    innerRadius: .ratio(0.618),
                    angularInset: 1.5
                )
                .cornerRadius(4)
                .foregroundStyle(by: .value("Name", element.name))
            }
            .frame(height: 260)
            .chartXAxis(.hidden)
            .chartLegend(position: .bottom, alignment: .center, spacing: 7).chartForegroundStyleScale([
                "Complete Days": Color(hue: 0.33, saturation: 0.81, brightness: 0.76),
                "Missing Days": Color(hue: 0.0833, saturation: 0.86, brightness: 1.0)
            ])
            VStack {
                Text("98%")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("of days have data")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
        }
    }
}

struct DataCompletenessChart: View {
    var body: some View {
        ZStack(alignment: .center) {
            Chart(adherenceDays, id: \.name) { element in
                SectorMark(
                    angle: .value("Days", element.days),
                    innerRadius: .ratio(0.618),
                    angularInset: 1.5
                )
                .cornerRadius(4)
                .foregroundStyle(by: .value("Name", element.name))
            }
            .frame(height: 260)
            .chartXAxis(.hidden)
            .chartLegend(position: .bottom, alignment: .center, spacing: 7).chartForegroundStyleScale([
                "Complete Days": Color(hue: 0.33, saturation: 0.81, brightness: 0.76),
                "Missing Days": Color(hue: 0.0833, saturation: 0.86, brightness: 1.0)
            ])
            VStack {
                Text("98%")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("of days have data")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
        }
    }
}

//class PeriodSelectorView: UIView {
//
//    private let dayButton = UIButton(type: .system)
//    private let monthButton = UIButton(type: .system)
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        // Customize the day button
//        dayButton.setTitle("D", for: .normal)
//        dayButton.setTitleColor(.white, for: .normal)
//        dayButton.backgroundColor = .gray // Set the unselected button color
//        dayButton.layer.cornerRadius = 10 // Adjust corner radius as needed
//        dayButton.addTarget(self, action: #selector(dayButtonTapped), for: .touchUpInside)
//
//        // Customize the month button
//        monthButton.setTitle("M", for: .normal)
//        monthButton.setTitleColor(.white, for: .normal)
//        monthButton.backgroundColor = .gray // Set the unselected button color
//        monthButton.layer.cornerRadius = 10 // Adjust corner radius as needed
//        monthButton.addTarget(self, action: #selector(monthButtonTapped), for: .touchUpInside)
//
//        // Stack view to hold the buttons
//        let stackView = UIStackView(arrangedSubviews: [dayButton, monthButton])
//        stackView.axis = .horizontal
//        stackView.spacing = 16 // Adjust spacing as needed
//        stackView.distribution = .fillEqually
//        stackView.frame = bounds
//        addSubview(stackView)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    @objc func dayButtonTapped() {
//        // Handle the day button tap here
//        // Change button appearance based on selection
//        dayButton.backgroundColor = .white
//        monthButton.backgroundColor = .gray
//    }
//
//    @objc func monthButtonTapped() {
//        // Handle the month button tap here
//        // Change button appearance based on selection
//        dayButton.backgroundColor = .gray
//        monthButton.backgroundColor = .white
//    }
//}

struct SalesSummary: Identifiable {
    let weekday: Date
    let sales: Int
    
    var id: Date { weekday }
}

// Need this to get the date from the data
//func date(_ year: Int, _ month: Int, _ day: Int = 1) -> Date {
//    let day = Calendar.current.date(from: DateComponents(year: year, month: month, day: day)) ?? Date()
//    return Calendar.current.component(.weekday, from: day)
//    
//}

//let cupertinoData: [SalesSummary] = [
//    // Monday
//    .init(weekday: date (2022, 5, 2), sales: 54),
//    // Tuesday
//    .init(weekday: date (2022, 5, 3), sales: 42),
//    // Wednesday
//    .init(weekday: date (2022, 5, 4), sales: 88),
//    // Thursday
//    .init(weekday: date (2022, 5, 5), sales: 49),
//    // Friday
//    .init(weekday: date (2022, 5, 6), sales: 42),
//    // Saturday
//    .init(weekday: date (2022, 5, 7), sales: 125),
//    // Sunday
//    .init(weekday: date (2022, 5, 8), sales: 67)
//]
//
//let sfData: [SalesSummary] = [
//    .init (weekday: date (2022, 5, 2), sales: 81),
//    .init(weekday: date (2022, 5, 3), sales: 90),
//    .init (weekday: date (2022, 5, 4), sales: 52),
//    .init (weekday: date (2022, 5, 5), sales: 72),
//    .init (weekday: date (2022, 5, 6), sales: 84),
//    .init (weekday: date (2022, 5, 7), sales: 84),
//    .init (weekday: date (2022, 5, 8), sales: 137)
//]

struct Series: Identifiable {
    let city: String
    let sales: [SalesSummary]
    var id: String { city }
}

//let SFdata: [Series] = [
//    .init (city: "Cupertino", sales: cupertinoData),
//    .init(city: "San Francisco", sales: sfData),
//]

//struct LocationDetailsChart: View {
//  @Binding var rawSelectedDate: Date?
//    var selectedDate: Date? {
//        guard let rawSelectedDate else { return nil }
//        return SFdata.first?.sales.first(where: {
//          let endOfDay = endOfDay(for: $0.weekday)
//          return ($0.day ... endOfDay).contains(rawSelectedDate)
//        })?.day
//      }
//
//  var body: some View {
//    Chart {
//        ForEach(seriesData, id: \.type) { series in
//            ForEach(series.data, id: \.weekday) {
//                LineMark(
//                    x: .value("Weekday", $0.weekday),
//                    y: .value("Sales", $0.sales)
//                )
//            }
//            .foregroundStyle(by: .value("City", series.type))
//            .symbol(by: .value("City", series.type))
//            .interpolationMethod(.catmullRom)
//
//        }
//
//    }
//    .chartXSelection(value: $rawSelectedDate)
//  }
//    
//    
//    let seriesData = [
//        (
//            type: "Active Minutes", data: [
//                (weekday: "Mon", sales: 54),
//                (weekday: "Tue", sales: 42),
//                (weekday: "Wed", sales: 88),
//                (weekday: "Thu", sales: 79),
//                (weekday: "Fri", sales: 92),
//                (weekday: "Sat", sales: 65),
//                (weekday: "Sun", sales: 67)
//            ]
//        )
//    ]
//}

struct DataCompleteness: View {
    var body: some View {
        Text("Health Data Summary")
            .font(.title)
            .fontWeight(.semibold)
        Text("Data Completeness")
            .font(.title2)
            .fontWeight(.semibold)
        
        Text("Out of 636 days, there are 11 days of missing data in your long-term physical activity data.")
            .font(.subheadline)
      
        DataCompletenessChart()
        
        
        StepsChart()
//        LocationDetailsChart()
    
    }
}

struct HealthView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            DataCompleteness()
        }.padding()
    }
}

struct HealthView_Previews: PreviewProvider {
    static var previews: some View {
        HealthView()
    }
}
