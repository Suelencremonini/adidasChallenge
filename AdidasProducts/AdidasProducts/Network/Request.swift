//
//  Request.swift
//  AdidasProducts
//
//  Created by suelen on 08/05/21.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol Request {
    var path: String { get }
    var method: HTTPMethod { get }
    var baseUrl: String { get }
}
