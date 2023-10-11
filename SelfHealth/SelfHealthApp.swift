//
//  SelfHealthApp.swift
//  SelfHealth
//
//  Created by Belinda Wong on 22/6/2023.
//

import SwiftUI
import HealthKit

class AppState: ObservableObject {
//    @Published var isActivated: Bool = false
    @Published var isActivated: Bool = true
//    @Published var condition: String = ""
//    @Published var condition: String = "gym"
//    @Published var condition: String = "pilates"
    @Published var condition: String = "walking"
}

@main
struct SelfHealthApp: App {
    @StateObject private var appState = AppState()
    private let healthStore: HKHealthStore
    private func requestHealthKitPermissions() {
        
        let sampleTypesToRead = Set([
            HKObjectType.quantityType(forIdentifier: .heartRate)!,
            HKObjectType.quantityType(forIdentifier: .stepCount)!,
            HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!,
        ])
        
        healthStore.requestAuthorization(toShare: nil, read: sampleTypesToRead) { (success, error) in
            print("Request Authorization -- Success: ", success, " Error: ", error ?? "nil")
        }
    }
    
    init() {
        guard HKHealthStore.isHealthDataAvailable() else {
            fatalError("SelfHealth requires a device with read permission for physical activity data")
        }
        healthStore = HKHealthStore()
        requestHealthKitPermissions()
    }
    
    var body: some Scene {
        
        WindowGroup {
//            ContentView()
            OnboardingContentView().environmentObject(healthStore).environmentObject(appState)
        }
    }
}

extension HKHealthStore: ObservableObject{}
