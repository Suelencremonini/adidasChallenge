//
//  AdidasEndpoints.swift
//  AdidasProducts
//
//  Created by suelen on 08/05/21.
//

import Foundation

enum AdidasEndpoints {
    case getProducts
    case getReviews(_ id: String)
    case addReview(_ review: Review)
}

extension AdidasEndpoints: Request {
    var path: String {
        switch self {
        case .getProducts:
            return "product"
        case .getReviews(let id):
            return "reviews/\(id)"
        case  .addReview(let review):
            return "reviews/\(review.productId)"
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
        case .getProducts:
            port = "3001"
        default:
            port = "3002"        }
        
        return "http://localhost:\(port)/"
    }
}
