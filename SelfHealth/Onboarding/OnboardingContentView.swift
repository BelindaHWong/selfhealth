//
//  OnboardingContentView.swift
//  SelfHealth
//
//  Created by Belinda Wong on 17/7/2023.
//

import SwiftUI

struct OnboardingContentView: View {
    @State private var pageIndex = 0
    @State private var isShowingAnotherView = false
    private let pages: [Page] = Page.samplePages
    private let dotAppearance = UIPageControl.appearance()
    
    
    var body: some View {
        if isShowingAnotherView {
            HomeScreen()
        } else {
            TabView(selection: $pageIndex) {
                
                ForEach(pages) { page in
                    VStack {
                        Spacer()
                        OnboardingPageView(page: page)
                        Spacer()
                        if page == pages.last {
                            // Where button has start after onboarding.
                            Button("Start", action: {
                                isShowingAnotherView = true
                            })
                            .buttonStyle(.borderedProminent)
                        
                        } else {
                            Button("Next", action: incrementPage)
                        }
                        Spacer()
                        Spacer()
                    }
                    .tag(page.tag)
                }
            }
            .animation(.easeInOut, value: pageIndex)
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .interactive))
            .onAppear {
                dotAppearance.currentPageIndicatorTintColor = .black
                dotAppearance.pageIndicatorTintColor = .gray
                dotAppearance.size(forNumberOfPages: 3)
            }
        }
        }

    
    func incrementPage() {
        pageIndex += 1
    }
    
    func goToZero() {
        pageIndex = 0
    }
    
}

@available(iOS 15.0, *)
struct OnboardingContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingContentView()
    }
}

