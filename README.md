# LBGTest iOS App

This is an iOS application built with *SwiftUI* and *MVVM architecture*. It serves as a base structure for scalable app development in iOS using modern development techniques.

---

## 🏗 Project Architecture

The project follows the *MVVM (Model-View-ViewModel)* architecture pattern:

### 1. *Model*
Responsible for representing the data structure and business logic.

> Note: Currently, models are minimal. Can be extended to parse and represent data from network/database.

### 2. *View*
SwiftUI views that define the UI of the app.
- ContentView.swift: Main view loaded when the app starts.

### 3. *ViewModel*
Handles business logic and provides data to views.
> Add your ViewModels in a dedicated ViewModel folder and bind them using @ObservedObject or @StateObject.

---

## 🚀 Getting Started

### Requirements:
- Xcode 14 or above
- iOS 15.0+
- Swift 5.5+

### Installation:
1. Clone the repository or unzip the project.
2. Open LBGTest.xcodeproj in Xcode.
3. Run the project on a simulator or device.

---