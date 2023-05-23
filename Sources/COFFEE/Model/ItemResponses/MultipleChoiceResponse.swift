//
//  MultipleChoiceResponse.swift
//
//
//  Created by Victor Prüfer on 04.05.21.
//

import Foundation

public struct MultipleChoiceResponse: ItemResponse, Codable {
    
    /// Specifies the type of the item this response is referring to
    public let type: SurveyItemType
    /// The unique identifier of the item this response is referring to
    public let itemIdentifier: String
    /// The value of the response. The value type is an array of the selected options' identifiers
    public let value: [Int]

    /// A description of the value
    public var valueDescription: String {
        return String(describing: value)
    }
    
    /// The coding keys for a multiple choice response
    enum CodingKeys: String, CodingKey {
        case type
        case itemIdentifier
        case value
    }
    
    public init(itemIdentifier: String, value: [Int]) {
        self.type = .multipleChoice
        self.itemIdentifier = itemIdentifier
        self.value = value
    }
    
    // Encodes an instance of multiple choice response
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        // Encode all required values
        try container.encode(type, forKey: .type)
        try container.encode(itemIdentifier, forKey: .itemIdentifier)
        try container.encode(value, forKey: .value)
    }
}
