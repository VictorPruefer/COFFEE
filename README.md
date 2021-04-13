# COFFEE
COFFEE - Customizable Occupant-Friendly FEEdback applications. COFFEE is a lightweight, flexible and extensible SwiftUI framework to build customizable feedback applications for thermal comfort and IEQ research.

## How to use

Add this swift package to your Xcode project
```
https://github.com/VictorPruefer/COFFEE
```

Import package, provide survey to display and completion handler to handle the submission after respondent completes survey

```swift
import SwiftUI
import COFFEE

struct ContentView: View {
   
   // Specify the survey that you want to present
   let survey: Survey = {
       // Specify survey items, one item for each question
       let question1 = ...SurveyItem(...)
       
       // Create survey and add all items
       let survey = Survey(...)
       
       // Return survey
       return survey
    }()
   
    // Handle submission after the respondent completes survey
    func didCompleteSurvey(submission: Submission) {
       // Process submission
    }
    
    var body: some View {
        NavigationView {
            SurveyOverviewScreen(survey: survey, completionHandler: didCompleteSurvey(submission:))
        }
    }
}
```

## Item Types

COFFEE comes with a variety of different item types. An item type describes the input type and the UI component of a question.

<center>
<img src="COFFEE/Resources/ItemTaxonomy.jpg"/>
</center>
