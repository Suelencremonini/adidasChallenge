//
//  AppCoordinator.swift
//  AdidasProducts
//
//  Created by suelen on 09/05/21.
//

import UIKit

class AppCoordinator {
    var productsCoordinator: InitilCoordinator!
    
    init(window: UIWindow) {
        productsCoordinator = ProductsCoordinator()
        
        window.rootViewController = productsCoordinator.navigationController
        window.makeKeyAndVisible()
    }
}
