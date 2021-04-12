//
//  OrdinalScaleSurveyItem.swift
//  
//
//  Created by Victor Prüfer on 13.04.21.
//

import Foundation

/// This question type displays a numeric scale
public struct OrdinalScaleSurveyItem: SurveyItem, Codable {
    // General attributes
    public let type: SurveyItemType
    public let identifier: String
    public let question: String
    public let description: String
    public let isOptional: Bool
    public let scaleTitle: String?
    
    // Additional attributes for item type "OrdinalScale"
    /// Specify whether the scale is discrete or continous
    public let isScaleContinous: Bool
    /// Specify at least two steps to define the scale's range
    public let ordinalScaleSteps: [OrdinalScaleStep]
}

/// A single step on an ordinal scale
public struct OrdinalScaleStep: Codable {
    /// A unique numeric value to describe the step's position on the scale
    public let value: Double
    /// Human-readable description of the step
    public let label: String
    /// A color in hex-format
    public let color: String
}
