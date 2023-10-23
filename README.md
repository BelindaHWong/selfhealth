# SelfHealth
Welcome to SelfHealth! This is an iOS application designed to help guide you through self-experiments so you may gain personalised insights into your physical activity data and wellbeing.

## Features
- Graph visualisations: See your data in charts and tabular forms to see relationships and trends.
- Scaffolding: Guidance for first-time users to help select an experiment goal and get started.
- Insights: Data analysis and insightful trends at a glance so you can make the best use of your experiment data.
- Uncertainty included: Helps you make sense of uncertainty in the self-experiment data to better understand experiment outcomes and personal data trends.

## Getting Started
### Prerequisites
- Xcode Beta: Ensure you have Xcode Beta installed on your Mac. 
- iOS 17 Device or Simulator: SelfHealth only works for iOS devices running iOS 17.0 and above since it requires Swift Charts and other new iOS features. It is best run on the iPhone family.

### Installation Steps
1. Clone the repository
2. Open the repository in Xcode Beta
3. Choose your target device to build and install the SelfHealth application (simulator or iOS device connected by lightning cable to iOS device)
4. Click "Play" in Xcode to build and run the app locally.

### Prototype Instructions
To view the complete self-experiment:
1. Comment out ExperimentScaffold() and include ExperimentSummaryView() in HomeScreen class
2. Set isDayOne = false in HomeView class
3. In SelfHealthApp, set isActivated = true
4. Set condition = "pilates" or "gym" or "walking"

## Acknowledgements
ChatGPT 3.5 was used for code debugging and searching Swift documentation to create this application. I would like to thank my Professor Judy Kay and the Honours Group at University of Sydney for their thoughtful insights and contributions for the application design.

Good luck experimenting! 🧪📊✨

