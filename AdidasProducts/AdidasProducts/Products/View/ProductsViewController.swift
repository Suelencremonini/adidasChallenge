//
//  ProductsViewController.swift
//  AdidasProducts
//
//  Created by suelen on 08/05/21.
//

import UIKit

class ProductsViewController: UIViewController {
    private var viewModel: ProductsViewModel!
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private let cellIdentifier = "ProductsTableViewCell"
    
    init(viewModel: ProductsViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        viewModel.viewDelegate = self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Products"
        getProducts()
    }
}

private extension ProductsViewController {
    func getProducts() {
        showLoading(true)
        viewModel.getProducts()
    }
    
    func showLoading(_ show: Bool) {
        if show {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
    
    func configTableView() {
        let nib = UINib(nibName: cellIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ProductsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.products?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ProductsTableViewCell,
              let product = viewModel.products?[indexPath.row] else {
            return UITableViewCell()
        }
        
        cell.config(product: product)
        
        return cell
    }
}

extension ProductsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let product = viewModel.products?[indexPath.row] else { return }
        viewModel.goToDetails(product)
    }
}

extension ProductsViewController: ProductsViewModelViewDelegate {
    func productsViewModelGetProductsSuccess(_ viewModel: ProductsViewModel) {
        showLoading(false)
        stackView.isHidden = false
        configTableView()
        tableView.reloadData()
    }
    
    func productsViewModelGetProductsFailure(_ viewModel: ProductsViewModel, error: ResponseError) {
        showLoading(false)
        showError(error: error) { _ in
            self.getProducts()
        }
    }
}
