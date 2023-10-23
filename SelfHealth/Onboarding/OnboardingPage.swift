//
//  OnboardingPage.swift
//  SelfHealth
//
//  Created by Belinda Wong on 17/7/2023.
//

import Foundation

struct Page: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var description: String
    var imageUrl: String
    var tag: Int
    
    static var samplePage = Page(name: "Title Example", description: "This is a sample description for the purpose of debugging", imageUrl: "beach", tag: 0)
    
    static var samplePages: [Page] = [
    Page(name: "Welcome to SelfHealth!", description: "SelfHealth is designed to help guide you through self-experiments so you may gain personalised insights into your physical activity data and wellbeing.", imageUrl: "experience", tag: 0),
    Page(name: "Experiments made easy", description: "Choose an experiment goal relating to two health variables and SelfHealth will help you discover if there is a causal relationship.", imageUrl: "experiment", tag: 1),
    Page(name: "Understand uncertainty", description: "SelfHealth aims to visualise uncertainty in the data you have chosen to provide and your experiment outcomes, so you can better understand and control your personal data.", imageUrl: "insight", tag: 2),
    ]
    
    static var experimentPages: [Page] = [
    Page(name: "Let's get started with the experiment!", description: "Find out if there is a causal relationship between two variables in your daily life. This will be done by randomly being assigned a condition for the independent variable to change each day to observe the effect on another variable.", imageUrl: "", tag: 0),
    Page(name: "Define your experiment", description: "SelfHealth currently supports three experiment goals relating to better sleep outcomes. Please choose what you would like to change as your independent variable.", imageUrl: "experiment", tag: 1),
    Page(name: "Understand uncertainty", description: "SelfHealth aims to visualise uncertainty in the data you have chosen to provide and your experiment outcomes, so you can better understand and control your personal data.", imageUrl: "insight", tag: 2),
    ]
    
    static var experimentPage = Page(name: "Let's get started!", description: "What will you choose as the cause to see if it affects your sleep quality?", imageUrl: "jogging", tag: 0) 
}
