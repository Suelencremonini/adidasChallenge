//
//  DetailsViewModel.swift
//  AdidasProducts
//
//  Created by suelen on 09/05/21.
//

import Foundation

protocol DetailsViewModelViewDelegate: AnyObject {
    func detailsViewModelGetReviewsSuccess(_ viewModel: DetailsViewModel)
    func detailsViewModelGetReviewsFailure(_ viewModel: DetailsViewModel, error: ResponseError)
}

class DetailsViewModel {
    private var service: AdidasService
    private(set) var product: Produt
    private(set) var reviews: [Review]?
    
    weak var viewDelegate: DetailsViewModelViewDelegate?
    
    init(service: AdidasService, product: Produt) {
        self.service = service
        self.product = product
    }
    
    func getReviews() {
        service.getReviews(id: product.id) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let reviews):
                    self.reviews = [Review(productId: self.product.id, locale: "", rating: 1, text: "ok"),
                                    Review(productId: self.product.id, locale: "", rating: 2, text: "good"),
                                    Review(productId: self.product.id, locale: "", rating: 3, text: "good"),
                                    Review(productId: self.product.id, locale: "", rating: 4, text: "good"),
                                   ]
//                    self.reviews = reviews
                    self.viewDelegate?.detailsViewModelGetReviewsSuccess(self)
                case .failure(let error):
                    self.viewDelegate?.detailsViewModelGetReviewsFailure(self, error: error)
                }
            }
        }
    }
    
    func addReview() {
        
    }
}
