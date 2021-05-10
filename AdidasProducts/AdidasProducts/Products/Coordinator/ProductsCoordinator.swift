//
//  ProductsCoordinator.swift
//  AdidasProducts
//
//  Created by suelen on 08/05/21.
//

import UIKit

class ProductsCoordinator: InitilCoordinator {
    var viewController: UIViewController!
    var navigationController: UINavigationController!
    
    init() {
        let viewModel = ProductsViewModel(service: AdidasService())
        let viewController = ProductsViewController(viewModel: viewModel)
        navigationController = UINavigationController(rootViewController: viewController)
        
        self.viewController = viewController
        viewModel.coordinatorDelegate = self
    }
}

extension ProductsCoordinator: ProductsViewModelCoordinatorDelegate {
    func productsViewModelGoToDetails(_ viewModel: ProductsViewModel, product: Produt) {
        let detailsCoordinator = DetailsCoordinator(product: product)
        detailsCoordinator.start(usingPresention: .push, at: navigationController)
    }
}
