//
//  ReviewModel.swift
//  AdidasProducts
//
//  Created by suelen on 08/05/21.
//

import Foundation

struct Review: Codable {
    var productId: String
    var locale: String
    var rating: Double
    var text: String
}
