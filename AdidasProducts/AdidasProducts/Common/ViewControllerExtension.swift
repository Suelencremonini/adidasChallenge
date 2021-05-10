//
//  ViewControllerExtension.swift
//  AdidasProducts
//
//  Created by suelen on 09/05/21.
//

import UIKit

extension UIViewController {
    func showError(error: ResponseError, buttonAction: @escaping ((UIAlertAction) -> Void)) {
        let errorMessage = "\(error.code) - " + error.message
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Error", style: .default, handler: buttonAction))
        present(alert, animated: true, completion: nil)
    }
}
