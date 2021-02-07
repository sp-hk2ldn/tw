# Test Project for TW

## Overview

### Dependencies:

`CocoaPods` is used to manage dependencies. 

Local: 

`MockUserResponse`  
`Models` - Conforming to  `Decodable`

Third Party:

`SwiftLint`  for code linting [Readme](https://github.com/realm/SwiftLint). 
`Quick` for spec/bdd testing [Readme](https://github.com/Quick/Quick). 
`Nimble` for matching [Readme](https://github.com/Quick/Nimble). 
`Realm` for persistence layer [Readme](https://docs.mongodb.com/realm-sdks/swift/latest/)

### Architecture

The architecture follows the MVVM + Coordinator pattern:

`Model` - Data representation of an entity. 
`View` - Containing the UI definition, and its `ViewController` to manage it's lifecycle   
`ViewModel` - Provides the view layer with access to business logic and services. Should not import `UIKit` here.  
`Coordinator` - Handles navigation throughout the application, provides dependency injection into `ViewModel`.  

### UI Layer

`UIStoryboard` for creating most of the UI. One ViewController per storyboard to avoid merge conflict complications when multiple team members need to work on the same flow.  
`ViewController` created in `Storyboard` conform to `Storyboarded` protocol for convenience initialisation - caveat is that `ViewController` within storyboards must contain `Storyboard Identifier`.  
Where `UIView` is created programatically, `NSLayoutConstraint` are used and provided to ensure consistency with existing Interface Builder constraints.  
`Combine` is used to bind data in the `ViewModel` to elements in the UI. 
`TabBarController` has second tab as example of how we could expand the functionality of the application (second tab not implemented, placeholder only)

### Folder Structure

Application - Contains main files for app lifecycle and setup.  
Resources - Contains constants, config, assets and other loaded on demand items. Mock JSON could be stored here, for instance.  
Service - Contains classes and protocols that are to be consumed by other layers of the application.  
Model - Contains the decodable data types to be used within the application. Where possible, property names map to the API schema provided.  
Extensions - Contains small extensions of functionality intended to be reused in multiple places throughout the application. Follows convention of `{ClassName}+{Type}`.  
Navigation - Contains the `Coordinator` protocol, the `MainCoordinator` and the protocol for convenience init `storyboard`, and other files for navigation (ie handling Deep Links). 
Flows - The part of the application that the user interacts with. The flows contain the `ViewController`, the `ViewModel` and their associated `Coordinator`.  

### Networking

Use protocols to define services, allowing them to be swapped out for Mock implementations for testing purposes.   
Uses `APIError` definitions for error handling. 

### Persistence

Realm was chosen for speed of implementation and its user-friendly API over CoreData. 

The technical assignment specification was that `NSUserDefaults` be _not_ used for persisting data, and all the models persisted through the application were persisted via Realm. I _did_ use `NSUserDefaults` for retaining the user's login name since creating a real authentication system was not a requirement. This usage fits the `NSUserDefaults` use case of persisting simple user settings as described in the Apple documentation.

Offline v Online strategy as follows:

* `If username exists in the database, load it`.

* `Attempt to update via network if possible `. 
* `If username doesnt exist then get data via network if possible`. 
*    `Update database and display latest information`. 
* `Bind value of latest available data emission to the UI`. 
* `If unable to update from network show the user an indicative error`. 


### Git strategy

Used git flow, branching from `develop` to `feature/feature_name`, completing the feature, then raising a pull request back to `develop` and eventually `main` when assignment was considered completed.

### Localization & Accessibility

Unfortunately not enough time to think about an ongoing strategy for this.  

### Testing

Using Quick / Nimble for testing behaviour on screens
