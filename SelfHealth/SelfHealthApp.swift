//
//  SelfHealthApp.swift
//  SelfHealth
//
//  Created by Belinda Wong on 22/6/2023.
//

import SwiftUI
import HealthKit

@main
struct SelfHealthApp: App {
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
            OnboardingContentView().environmentObject(healthStore)
        }
    }
}

extension HKHealthStore: ObservableObject{}
