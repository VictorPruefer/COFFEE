//
//  NominalScaleSurveyItem.swift
//  
//
//  Created by Victor Prüfer on 13.04.21.
//

import Foundation

/// This question type displays a set of options and lets the respondent choose one
public struct NominalScaleSurveyItem: SurveyItem, Codable {
    // General attributes
    public let type: SurveyItemType
    public let identifier: String
    public let question: String
    public let description: String
    public let isOptional: Bool
    public let scaleTitle: String?
    
    // Additional attributes for item type "NominalScale"
    /// Specify a set of available options
    public let nominalScaleSteps: [NominalScaleStep]
}

/// One step on a nominal scale
public struct NominalScaleStep: Codable {
    /// A unique numeric value for identification purposes
    public let value: Int
    /// Human-readable description of the step
    public let label: String
}
