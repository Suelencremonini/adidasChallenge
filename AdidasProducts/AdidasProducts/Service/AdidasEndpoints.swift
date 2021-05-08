//
//  AdidasEndpoints.swift
//  AdidasProducts
//
//  Created by suelen on 08/05/21.
//

import Foundation

enum AdidasEndpoints {
    case getProducts
    case getDetails(_ id: String)
    case getReviews(_ id: String)
    case addReview(_ id: String)
}

extension AdidasEndpoints: Request {
    var path: String {
        switch self {
        case .getProducts:
            return "product"
        case .getDetails(let id):
            return "product/\(id)"
        case .getReviews(let id), .addReview(let id):
            return "reviews/\(id)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .addReview:
            return .post
        default:
            return .get
        }
    }
    
    var baseUrl: String {
        var port: String
        switch self {
        case .getReviews, .addReview:
            port = "3002"
        default:
            port = "3001"
        }
        
        return "http://localhost:\(port)/"
    }
}
