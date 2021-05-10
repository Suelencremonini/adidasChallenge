//
//  ProductModel.swift
//  AdidasProducts
//
//  Created by suelen on 08/05/21.
//

import Foundation

struct Produt: Decodable {
    let currency: String
    let price: Double
    let name: String
    let description: String
    let id: String
    
    var formattedPrice: String {
        return price.asCurrency(symbol: currency)
    }
}
