# LocationApplication

`LocationApplication` is a Swift Package Manager (SPM) project architected based on the [AppState](https://github.com/0xLeif/AppState) project. This package provides a simplified approach to handling location updates and region monitoring by providing base classes that manage `CLLocationManager`.

## Features
- Streamlines `CLLocationManager` management, providing a clean and efficient way to handle location updates.
- Leverages `AppState` for excellent code structure and testability.
- Includes a pre-configured location manager with a singleton design.
- Uses `CoreLocation` to handle and respond to dynamic location changes in your app.
- Provides a customizable `CLLocationManagerDelegate` function set.

## Getting Started
To add `LocationApplication` to your Swift project, use the Swift Package Manager. This involves adding a package dependency to your `Package.swift` file.

dependencies: [
    .package(url: "https://github.com/0xLeif/LocationApplication.git", from: "0.1.0")
]

For App projects, open your project in Xcode and navigate to File > Swift Packages > Add Package Dependency... and enter https://github.com/0xLeif/LocationApplication.git.

## Usage 
Ensure your files include the following import statements:

```swift
import AppState
import CoreLocation
import LocationApplication
```

### Creating a Location Manager
You can access the location manager through the `CLLocationManager` instance in your application class:

```swift
Application.dependency(\.locationManager)
```

This framework manages most of the dependency injection for you.

### Subclassing LocationApplication
Intensive use of location services will likely necessitate subclassing `LocationApplication` and overriding the necessary `CLLocationManagerDelegate` functions:

```swift
class MyLocationApplication: LocationApplication {
    // Start updating needed infomation from the manager

    // Override CLLocationManagerDelegate functions here
}
```

Subclassing provides a centralized way to manage all facets of location services in your code.

## Requirements

- Swift 5.7 or later
- iOS 15.0 or later
- watchOS 8.0 or later
- macOS 11.0 or later
- tvOS 15.0 or later
