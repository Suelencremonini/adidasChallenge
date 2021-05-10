//
//  AdidasService.swift
//  AdidasProducts
//
//  Created by suelen on 08/05/21.
//

import Foundation

class AdidasService: Service {
    func getProducts(completion: @escaping (Result<[Produt], ResponseError>) -> Void) {
        super.fetch(request: AdidasEndpoints.getProducts, completion: completion)
    }
    
    func getReviews(id: String, completion: @escaping (Result<[Review], ResponseError>) -> Void) {
        super.fetch(request: AdidasEndpoints.getReviews(id), completion: completion)
    }
    
    func addReview(request: Review, completion: @escaping (Result<Data, ResponseError>) -> Void) {
        super.fetch(request: AdidasEndpoints.addReview(request), completion: completion)
    }
}
