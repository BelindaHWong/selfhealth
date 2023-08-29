//
//  ExperimentSummaryView.swift
//  SelfHealth
//
//  Created by Belinda Wong on 23/7/2023.
//

import SwiftUI

struct ExperimentSummaryView: View {
    @State var isActive = true
    var body: some View {
        if(!isActive) {
            ZStack {
                Color.orange
                Image(systemName: "list.clipboard.fill")
                    .foregroundColor(Color.white)
                    .font(.system(size: 100.0))
            }
        }
        Text("hi")

    }
}

struct ExperimentSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        ExperimentSummaryView()
    }
}
