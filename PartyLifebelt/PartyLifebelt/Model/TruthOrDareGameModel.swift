//
//  TruthOrDareGameModel.swift
//  PartyLifebelt
//
//  Created by Sonja on 27/01/2023.
//

import Foundation

struct TruthOrDareModel: Codable {
    let titleTruth: String
    let questions: [String]
    let titleDare: String
    let dares: [String]
}
