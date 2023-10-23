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
                Text("77%")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("of days have data")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
            }
        }
    }
}

struct SalesSummary: Identifiable {
    let weekday: Date
    let sales: Int
    var id: Date { weekday }
}


struct Series: Identifiable {
    let city: String
    let sales: [SalesSummary]
    var id: String { city }
}

struct DataCompleteness: View {
    var body: some View {
        Text("Health Data Summary")
            .font(.title)
            .fontWeight(.semibold)
        Text("Data Completeness")
            .font(.title2)
            .fontWeight(.semibold)
        
        Text("Out of 636 days, there are 142 days of missing data in your long-term physical activity data.")
            .font(.subheadline)
      
        DataCompletenessChart()
        
        
        StepsChart()
//        LocationsChart()
    
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
