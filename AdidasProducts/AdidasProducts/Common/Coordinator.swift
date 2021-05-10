//
//  Coordinator.swift
//  AdidasProducts
//
//  Created by suelen on 09/05/21.
//

import UIKit

enum PresentationType {
    case push
    case present
}

protocol CoordinatorInterface: AnyObject {
    var viewController: UIViewController! { get }

    func start(usingPresention presentation: PresentationType, at navigation: UINavigationController)
}

protocol InitilCoordinator: CoordinatorInterface {
    var navigationController: UINavigationController! { get }
}

extension CoordinatorInterface {
    func start(usingPresention presentation: PresentationType, at navigation: UINavigationController) {
        switch presentation {
        case .present:
            navigation.present(viewController, animated: true, completion: nil)
        case .push:
            navigation.pushViewController(viewController, animated: true)
        }
    }
}
