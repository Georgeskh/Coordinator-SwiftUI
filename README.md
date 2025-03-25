# SwiftUI Coordinator Package

## Overview
This SwiftUI Coordinator Pattern simplifies and centralizes navigation management, making it easier to handle push navigation, sheet presentations, and full-screen covers.

## Features
- 📌 Centralized navigation logic
- 📍 Push, pop, and pop-to-root navigation
- 📄 Sheet and full-screen modal presentation
- 🔄 Compatible with SwiftUI’s `NavigationStack`

## Installation via Swift Package Manager (SPM)
To integrate this package into your Xcode project:

1. Open Xcode and navigate to **File > Add Packages**.
2. Enter the repository URL: `https://github.com/Georgeskh/Coordinator-SwiftUI`.
3. Select **Add Package** and integrate it into your target.

Or, add the following dependency to your `Package.swift` file:

```swift
// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "SwiftUICoordinator",
    platforms: [.iOS(.13)],
    products: [
        .library(
            name: "SwiftUICoordinator",
            targets: ["SwiftUICoordinator"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SwiftUICoordinator",
            dependencies: []
        ),
        .testTarget(
            name: "SwiftUICoordinatorTests",
            dependencies: ["SwiftUICoordinator"]
        ),
    ]
)
```

## Usage
### 1. Import the Package
```swift
import SwiftUICoordinator
```

### 2. Define a Coordinator
```swift
let coordinator = AppCoordinator()
```

### 3. Wrap Main View in `CoordinatorView`
```swift
CoordinatorView(coordinator: coordinator) { nav in
    ContentView()
}
```

### 4. Navigate Between Screens
#### Push a New Screen
```swift
coordinator.push(IdentifiableAnyView(view: DetailView()))
```

#### Present a Sheet
```swift
coordinator.presentSheet(IdentifiableAnyView(view: ModalView()))
```

#### Present a Full-Screen Cover
```swift
coordinator.presentFullScreenCover(IdentifiableAnyView(view: FullScreenView()))
```

#### Pop or Dismiss
```swift
coordinator.pop() // Go back one screen
coordinator.popToRoot() // Go back to the root
coordinator.dismissSheet() // Dismiss sheet
coordinator.dismissFullScreenOver() // Dismiss full-screen modal
```

## Components
### `AppCoordinator`
Manages navigation state and handles push/pop actions.

### `CoordinatorView`
Wraps SwiftUI views and integrates navigation logic.

### `IdentifiableAnyView`
Wraps SwiftUI views for use in `NavigationStack`.

## Medium article explaining the code

`https://medium.com/learn-by-writing/implementing-the-swiftui-coordinator-pattern-4d061e9506d5`

## License
MIT License – Feel free to use and modify.

## Contributions
Pull requests and issues are welcome! 🚀

