//
//  StarModel.swift
//  Insider_Case_Framework
//
//  Created by Ozgun Dogus on 16.03.2024.
//

import Foundation

public struct Star: Codable {
    public var size: String
    public var color: String
    public var brightness: String

    public init(size: String, color: String, brightness: String) {
        self.size = size
        self.color = color
        self.brightness = brightness
    }
}
