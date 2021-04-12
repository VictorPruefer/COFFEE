//
//  SurveyItem.swift
//  COFFEE
//
//  Created by Victor Prüfer on 21.02.21.
//

import Foundation

/// All survey item types need to implement this protocol
public protocol SurveyItem {
    // General attributes
    var type: SurveyItemType { get }
    var identifier: String { get }
    var question: String { get }
    var description: String { get }
    var isOptional: Bool { get }
    var scaleTitle: String? { get }
}

/// Enum to specify the type of a survey item
public enum SurveyItemType: String, Codable {
    case ordinalScale
    case nominalScale
    case multipleChoice
    case locationPicker
    case textInput
}
