//
//  OnboardingPageView.swift
//  SelfHealth
//
//  Created by Belinda Wong on 17/7/2023.
//

import SwiftUI

struct OnboardingPageView: View {
    var page: Page
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Image("\(page.imageUrl)")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding()
                .cornerRadius(30)
                .cornerRadius(10)
                .padding()
            
            Text(page.name)
                .font(.title.bold())

            
            Text(page.description)
                .font(.title2)
                .frame(width: 300)
                .multilineTextAlignment(.center)
        }
    }
}

struct OnboardingPageView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPageView(page: Page.samplePage)
    }
}
