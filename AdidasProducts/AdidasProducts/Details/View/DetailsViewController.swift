//
//  DetailsViewController.swift
//  AdidasProducts
//
//  Created by suelen on 09/05/21.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var customerReviewsLabel: UILabel!
    @IBOutlet weak var productView: DetailsProductView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var addReviewButton: UIButton!
    
    private var viewModel: DetailsViewModel!

    private let cellIdentifier = "DetailsReviewTableViewCell"
    
    init(viewModel: DetailsViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        viewModel.viewDelegate = self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Product details"
        getReviews()
        setupView()
    }
    
    @IBAction func addReviewTapped(_ sender: Any) {
        viewModel.addReview()
    }
}

private extension DetailsViewController {
    func getReviews() {
        showLoading(true)
        viewModel.getReviews()
    }
    
    func setupTableView() {
        let cellNib = UINib(nibName: cellIdentifier, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: cellIdentifier)
        
        tableView.dataSource = self
    }
    
    func setupView() {
        productView.config(product: viewModel.product)
    }
    
    func setupReviews() {
        setupTableView()
    }
    
    func showLoading(_ show: Bool) {
        if show {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
}

extension DetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.reviews?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? DetailsReviewTableViewCell,
              let review = viewModel.reviews?[indexPath.row] else {
            return UITableViewCell()
        }
        
        cell.config(review)
        return cell
    }
}

extension DetailsViewController: DetailsViewModelViewDelegate {
    func detailsViewModelGetReviewsSuccess(_ viewModel: DetailsViewModel) {
        showLoading(false)
        setupReviews()
        tableView.reloadData()
    }
    
    func detailsViewModelGetReviewsFailure(_ viewModel: DetailsViewModel, error: ResponseError) {
        showLoading(false)
    }
}
