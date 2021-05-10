//
//  DetailsCoordinator.swift
//  AdidasProducts
//
//  Created by suelen on 09/05/21.
//

import UIKit

class DetailsCoordinator: CoordinatorInterface {
    var viewController: UIViewController!

    init(product: Produt) {
        let viewModel = DetailsViewModel(service: AdidasService(), product: product)
        let viewController = DetailsViewController(viewModel: viewModel)
        
        self.viewController = viewController
    }
}
