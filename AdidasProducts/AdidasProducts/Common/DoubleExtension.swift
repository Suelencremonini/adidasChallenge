//
//  DoubleExtension.swift
//  AdidasProducts
//
//  Created by suelen on 09/05/21.
//

import Foundation

extension Double {
    func asCurrency(symbol: String) -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.init(identifier: "en")
        formatter.numberStyle = .currency
        formatter.currencySymbol = symbol
        return formatter.string(from: self as NSNumber) ?? ""
    }
}
