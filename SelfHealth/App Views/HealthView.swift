//
//  HealthView.swift
//  SelfHealth
//
//  Created by Belinda Wong on 24/7/2023.
//

import SwiftUI
import Charts
struct DataCompleteness: View {
    var body: some View {
        Text("Health Data Summary")
            .font(.title)
            .fontWeight(.semibold)
        Text("Data Completeness")
            .font(.title2)
            .fontWeight(.semibold)
        
        Text("Out of 636 days, there are 11 days of missing data.")
            .font(.footnote)
            
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
        StepsChart()

    
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
