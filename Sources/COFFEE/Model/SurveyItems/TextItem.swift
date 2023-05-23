//
//  TextInputSurveyItem.swift
//  
//
//  Created by Victor Prüfer on 13.04.21.
//

import Foundation

/// This item lets the respondent enter a text
public final class TextItem: ObservableObject, SurveyItem, Codable {
    
    // MARK: - Public Properties
    
    // MARK: General item attributes required by the 'SurveyItem' protocol
    
    public let type: SurveyItemType
    public let identifier: String
    public let question: String
    public let description: String?
    public var isMandatory: Bool
    
    /// Whether the current response is valid
    @Published public var isResponseValid: Bool = false
    public var isResponseValidPublished: Published<Bool> { _isResponseValid }
    public var isResponseValidPublisher: Published<Bool>.Publisher { $isResponseValid }
    
    // MARK: Item-specific properties
    
    /// The minimum number of characters required to consider the input valid
    public var minNumberOfCharacters: Int
    /// Whether the text input is supposed to be numerical
    public var isInputNumerical: Bool
    
    /// The coding keys for a text item
    enum CodingKeys: String, CodingKey {
        case type
        case identifier
        case question
        case description
        case isMandatory
        case minNumberOfCharacters
        case isInputNumerical
    }

    // MARK: - Internal Properties
    
    /// The current response on this item
    @Published var currentResponse: String {
        didSet {
            // Validate the value and update the 'isResponseValid' flag accordingly
            self.isResponseValid = currentResponse.count >= minNumberOfCharacters
        }
    }
    
    // MARK: - Initialization
    
    /// Default initializer for `TextItem`
    /// - Parameters:
    ///   - identifier: An identifier to be able to associate the responses to the question. By default set to a random uuid
    ///   - question: The question that the respondent is supposed to answer with the text field
    ///   - description: A more detailed description with additional instructions on how to answer the question
    public init(identifier: String = UUID().uuidString, question: String, description: String? = nil) {
        self.type = .text
        self.identifier = identifier
        self.question = question
        self.description = description
        self.isMandatory = true
        self.minNumberOfCharacters = 5
        self.isInputNumerical = false
        // Setup initial response value
        self.currentResponse = ""
    }
    
    /// Creates a new instance of text item from a decoder
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.type = .text
        
        // Decode all required values
        self.identifier = try container.decode(String.self, forKey: .identifier)
        self.question = try container.decode(String.self, forKey: .question)
        self.description = try? container.decode(String.self, forKey: .description)
        
        // Decode option values / set default values
        if let isMandatory = try? container.decode(Bool.self, forKey: .isMandatory) {
            self.isMandatory = isMandatory
        } else {
            self.isMandatory = true
        }
        if let minNumberOfCharacters = try? container.decode(Int.self, forKey: .minNumberOfCharacters) {
            self.minNumberOfCharacters = minNumberOfCharacters
        } else {
            self.minNumberOfCharacters = 5
        }
        if let isInputNumerical = try? container.decode(Bool.self, forKey: .isInputNumerical) {
            self.isInputNumerical = isInputNumerical
        } else {
            self.isInputNumerical = false
        }
        // Setup initial response value
        self.currentResponse = ""
    }
    
    /// Transforms the current value into a permanent response object
    /// - Returns: An encodable response object if the current value is valid, nil otherwise
    public func generateResponseObject() -> ItemResponse? {
        if isResponseValid {
            return TextResponse(itemIdentifier: identifier, value: currentResponse)
        }
        return nil
    }
}
