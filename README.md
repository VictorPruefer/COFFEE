# COFFEE
COFFEE - Customizable Occupant-Friendly FEEdback applications. COFFEE is a lightweight, flexible and extensible SwiftUI framework to build customizable feedback applications for thermal comfort and IEQ research.

## How to use

Add this swift package to your Xcode project.
```
https://github.com/VictorPruefer/COFFEE
```

Import package, provide survey to display and completion handler to handle the submission after respondent completes survey.

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

COFFEE comes with a variety of different item types. An item type describes the input type and the UI component of a question. The following taxonomy shows the currently available item types.

<center>
<img src="Sources/COFFEE/Resources/ItemTaxonomy.jpg"/>
</center>

<table>
  <tr>
    <th>Item Type</th><th>JSON Type Identifier</th><th>Description</th>
  </tr>
  <tr>
    <td>OrdinalScaleSurveyItem</td><td>ordinalScale</td><td>This item is supposed to be used for all questions that require a numeric scale such as the ASHRAE 7-point thermal sensation scale. Use `OrdinalScaleStep` to define the scale's steps.</td>
  </tr>
  <tr>
    <td>NominalScaleSurveyItem</td><td>nominalScale</td><td>This item can be used whenever you have a set of options and you want to let the respondent choose one.</td>
  </tr>
  <tr>
    <td>MultipleChoiceSurveyItem</td><td>multipleChoice</td><td>This item can be used to let the respondent pick multiple items from a set of options.</td>
  </tr>
  <tr>
    <td>LocationPickerSurveyItem</td><td>locationPicker</td><td>This item requests the respondent's location. Note that if you wish to use this item, you need to add the `NSLocationWhenInUseUsageDescription` key to your projects `Info.plist` file.</td>
  </tr>
  <tr>
    <td>TextInputSurveyItem</td><td>textInput</td><td>This item lets the respondent enter any text.</td>
  </tr>
</table>

## JSON En- and Decoding

You can either specify your survey by instanciating it in the code or by decoding it from a JSON file. Also, you can encode the resulting submission to JSON in order to e.g. upload it to a server. All model entities conform to the `Codable` protocol.

### Decode Survey from JSON

Prepare a JSON file that contains the survey that you wish to present. Example `MockSurvey.json`:
```json
{
    "title": "...",
    "description": "...",
    "researcher": {
        "name": "...",
        "mail": "...",
    },
    "allowsMultipleSubmissions": true,
    "startDate": "2021-04-08T15:00:00Z",
    "endDate": "2021-04-25T20:00:00Z",
    "color": "...",
    "items": [
        {
            "type": "ordinalScale",
            "identifier": "...",
            "question": "...",
            "description": "...",
            "isOptional": false,
            "scaleTitle": "...",
            "isScaleContinous": false,
            "ordinalScaleSteps": [
                {
                    "value": 3,
                    "label": "Very hot",
                    "color": "c7520e"
                },
                ...
            ]
        }
    ],
    "reminders": []
}

```

Decode the JSON survey.
```swift
func decodeJSONSurvey() -> Survey? {
    guard let url = Bundle.main.url(forResource: "MockSurvey", withExtension: "json"),
          let data = try? Data(contentsOf: url) else {
        return nil
    }
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601;
    do {
        let decodedSurvey = try decoder.decode(Survey.self, from: data)
        return decodedSurvey
    } catch let error {
        print(error)
    }
    return nil
}
```

### Encode Submission to JSON

```swift
let jsonEncoder = JSONEncoder()
jsonEncoder.dateEncodingStrategy = .iso8601
jsonEncoder.outputFormatting = .prettyPrinted
let jsonResultData = try? jsonEncoder.encode(submission)
// Resulting json encoded submission
if let jsonResultData = jsonResultData {
    print(String(data: jsonResultData, encoding: .utf8) ?? "Invalid encodation")
}
```
