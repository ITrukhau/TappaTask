//
//  WAModel.swift
//  TappaTask1
//
//  Created by Ilya Trukhau on 11/16/23.
//

import Foundation

// MARK: - Welcome
struct WAListResponse: Codable {
    var features: [WeatherAlert]
    var title: String
    var updated: String
}

// MARK: - Feature
struct WeatherAlert: Codable {
    var id: String
    var properties: WAProperties
}

// MARK: - Properties
struct WAProperties: Codable {
    var id: String
    var event: String
    var effective: String?
    var ends: String?
    var senderName: String
}
