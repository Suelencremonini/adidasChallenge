//
//  ProductsViewModel.swift
//  AdidasProducts
//
//  Created by suelen on 08/05/21.
//

import Foundation

protocol ProductsViewModelViewDelegate: AnyObject {
    func productsViewModelGetProductsSuccess(_ viewModel: ProductsViewModel)
    func productsViewModelGetProductsFailure(_ viewModel: ProductsViewModel, error: ResponseError)
}

protocol ProductsViewModelCoordinatorDelegate: AnyObject {
    func productsViewModelGoToDetails(_ viewModel: ProductsViewModel, product: Produt)
}

class ProductsViewModel {
    private var service: AdidasService
    private(set) var products: [Produt]?
    
    weak var viewDelegate: ProductsViewModelViewDelegate?
    weak var coordinatorDelegate: ProductsViewModelCoordinatorDelegate?
    
    init(service: AdidasService) {
        self.service = service
    }
    
    func goToDetails(_ product: Produt) {
        coordinatorDelegate?.productsViewModelGoToDetails(self, product: product)
    }
    
    func getProducts() {
        service.getProducts { (result) in
            DispatchQueue.main.async {
                switch result{
                case .success(let products):
                    self.products = products
                    self.viewDelegate?.productsViewModelGetProductsSuccess(self)
                case .failure(let error):
                    self.viewDelegate?.productsViewModelGetProductsFailure(self, error: error)
                }
            }
        }
    }
}
