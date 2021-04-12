//
//  LocationPickerSurveyItem.swift
//  
//
//  Created by Victor Prüfer on 13.04.21.
//

import Foundation

/// This item asks the respondent to share their current location
public struct LocationPickerSurveyItem: SurveyItem, Codable {
    // General attributes
    public let type: SurveyItemType
    public let identifier: String
    public let question: String
    public let description: String
    public let isOptional: Bool
    public let scaleTitle: String?
}
