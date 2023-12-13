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

```swift
dependencies: [
    .package(url: "https://github.com/0xLeif/LocationApplication.git", from: "0.1.0")
]
```

For App projects, open your project in Xcode and navigate to File > Swift Packages > Add Package Dependency... and enter `https://github.com/0xLeif/LocationApplication.git`.

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

## Using `Application.promote`

For your subclassed `LocationApplication` to effectively manage the location updates, it must be promoted to be the active AppState. This can be achieved using the `promote` function as follows:

```swift
Application.promote(to: MyLocationApplication.self)
```

The `promote` function supports dynamic injection and replacement of dependencies. It sets your subclass (`MyLocationApplication`) as the active application state, and all subsequent requests to the `Application` singleton will result in using the promoted `MyLocationApplication`.

With this, your custom location manager delegate methods will be used for handling location updates.

> Note: Make sure to call `Application.promote(to: MyLocationApplication.self)` at a suitable time in your application's lifecycle, such as in the `didFinishLaunchingWithOptions` method in AppDelegate (in UIKit) or the `onAppear` modifier of the initial view (in SwiftUI).

Remember, when testing, overriding is a useful feature of AppState's Application. Overriding, coupled with dependency injection, provides a powerful tool for isolating units of code for testing. As seen in the `LocationApplicationTests`, you can override the standard locationManager with a mock location manager for testing, and later cancel the override.

## Requirements

- Swift 5.7 or later
- iOS 15.0 or later
- watchOS 8.0 or later
- macOS 11.0 or later
- tvOS 15.0 or later
