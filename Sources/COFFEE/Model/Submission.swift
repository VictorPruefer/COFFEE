//
//  Submission.swift
//  COFFEE
//
//  Created by Victor Prüfer on 05.04.21.
//

import Foundation

/// A submission groups multiple item responses
public struct Submission: Codable {
    public let submissionDate: Date
    public let responses: [ItemResponse]
}
