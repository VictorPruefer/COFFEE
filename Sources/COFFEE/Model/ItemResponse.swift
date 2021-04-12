//
//  ItemResponse.swift
//  COFFEE
//
//  Created by Victor Prüfer on 22.02.21.
//

import Foundation

/// Reflects the response to one survey question. Note that this is a temporary implementation that will be transformed into an object-oriented approach in the future
public class ItemResponse: Codable, ObservableObject {
    // General attributes
    public let type: SurveyItemType
    public let surveyItemID: String
    
    // Ordinal Scale
    public var responseOrdinalScale: Double?
    
    // Nominal Scale
    public var responseNominalScale: Int?
    
    // Multiple Choice
    public var responseMultipleChoice: [Int]?
    
    // Location Picker
    public var responseLocationPickerLongitude: Double?
    public var responseLocationPickerLatitude: Double?
    
    // Text Picker
    public var responseTextInput: String?
    
    public init(type: SurveyItemType, surveyItemID: String) {
        self.type = type
        self.surveyItemID = surveyItemID
    }
    
    public var isValidInput: Bool {
        switch type {
            case .ordinalScale:
                return responseOrdinalScale != nil
            case .nominalScale:
                return responseNominalScale != nil
            case .multipleChoice:
                return !(responseMultipleChoice?.isEmpty ?? true)
            case .textInput:
                return true
            case .locationPicker:
                return true
        }
    }
}
