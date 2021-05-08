//
//  Response.swift
//  AdidasProducts
//
//  Created by suelen on 08/05/21.
//

import Foundation

enum ResponseError: Error, Equatable {
    case api(APIError)
    case invalidURL
    case internetCnnection
    case other
    
    var message: String {
        switch self {
        case .api(let apiError):
            return apiError.error
        case .other, .invalidURL:
            return "An error has ocurred, try again"
        case .internetCnnection:
            return "There is no internet connection"
        }
    }
    
    var code: Int {
        switch self {
        case .api(let apiError):
            return apiError.statusCode
        case .other, .invalidURL, .internetCnnection:
            return -1
        }
    }
    
    static func == (lhs: ResponseError, rhs: ResponseError) -> Bool {
        return lhs.code == rhs.code && lhs.message == rhs.message
    }
}

struct APIError: Decodable {
    var statusCode: Int
    var error: String
    var message: String
}
