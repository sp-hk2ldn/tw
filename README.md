# Test Project for CS

## Overview

### Dependencies:

`CocoaPods` is used to manage dependencies. 

Local: 

`MockAccountResponse`
`Models` - Conforming to  `Decodable`

Third Party:

`SwiftLint`  for code linting [Readme](https://github.com/realm/SwiftLint). 
`Quick` for spec/bdd testing [Readme](https://github.com/Quick/Quick). 
`Nimble` for matching [Readme](https://github.com/Quick/Nimble). 

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

### Folder Structure

Application - Contains main files for app lifecycle and setup.  
Resources - Contains config, assets and other loaded on demand items. Mock JSON could be stored here, for instance.  
Service - Contains classes and protocols that are to be consumed by other layers of the application.  
Model - Contains the decodable data types to be used within the application. Where possible, property names map to the API schema provided.  
Extensions - Contains small extensions of functionality intended to be reused in multiple places throughout the application. Follows convention of `{ClassName}+{Type}`.  
Navigation - Contains the `Coordinator` protocol, the `MainCoordinator` and the protocol for convenience init `storyboard`, and other files for navigation (ie handling Deep Links). 
UITools - UI Subclasses, intended to be reusable where needed. 
Flows - The part of the application that the user interacts with. The flows contain the `ViewController`, the `ViewModel` and their associated `Coordinator`.  

### Networking

Use protocols to define services, allowing them to be swapped out for Mock implementations for testing purposes.   
Uses `APIError` definitions for error handling. 

### Git strategy

Due to a lack of time the git strategy was a bit messy. Ideally I would use a git flow methodology, creating feature branches and merging them back to develop as the acceptance criteria has been met.   

### Localization & Accessibility

Unfortunately not enough time to think about an ongoing strategy for this.  

### Testing

Decided to try Quick/Nimble for the first time, focusing on some BDD aspects. Did not have enough time to do pure UITests, but the approach would be to make use of accessibility tags for selecting elements and test according to some acceptance criteria I drew up before I started the application:

        Scenario Outline:

        User wants to view the dashboard screen

        Given I am on the welcome screen
        Then I should press a button to navigate to the dashboard page
        Then I should be directed to the dashboard page
        Then there should be a tab bar

        Scenario Outline:

        User wants to see the donut chart

        Given we are on the dashboard screen
        Then I should see a title “Dashboard”
        And a chart
        There should be a <credit score>
        And a <maximum credit score>

        Scenario Outline

        Users should be able to navigate to the report screen from login

        Given I am on the welcome screen
        Then I should press a button to navigate to the dashboard page
        Then I should be directed to the dashboard page
        Then there should be a tab bar 
        And a <TabBarOption>
        When I select the tab bar <TabBarOption>
        I should be on the Report screen

        Scenario Outline

        Users want to see their credit report

        Given I am on the welcome screen
        Then I should press a button to navigate to the dashboard page
        Then I should be directed to the dashboard page
        Then there should be a tab bar 
        And a <TabBarOption>
        When I select the tab bar <TabBarOption>
        I should be on the Report screen
        And there should be a <Title> 
        And a <CreditScore>
        And a <Message>
         
        Scenario Outline

        Users should be able to tell which tab is active

        Given I am on the welcome screen
        Then I should press a button to navigate to the dashboard page
        Then I should be directed to the dashboard page
        Then there should be a tab bar
        And <TabBarOption1> should be highlighted
        When I select the tab bar <TabBarOption2>
        I should be on the Report screen
        And <TabBarOption2> should be highlighted

## Next Steps

- Would spend some time figuring out some nice looking easing animations for the donut chart
- Would create some specific scenarios for testing different mocked accounts
- UI Testing, use accessibility tags
- Use Combine 
