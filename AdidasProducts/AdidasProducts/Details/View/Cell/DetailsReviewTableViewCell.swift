//
//  DetailsReviewTableViewCell.swift
//  AdidasProducts
//
//  Created by suelen on 09/05/21.
//

import UIKit

class DetailsReviewTableViewCell: UITableViewCell {
    @IBOutlet weak var ratingStackView: UIStackView!
    @IBOutlet weak var ratingLabel: UILabel!
    
    func config(_ review: Review) {
        ratingLabel.text = review.text
        createRatingView(review.rating)
    }
    
    private func createRatingView(_ amount: Int) {
        ratingStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for _ in 1...amount {
            let starImage = UIImage(systemName: "star.fill")
            let imageView = UIImageView(image: starImage)
            imageView.tintColor = .systemYellow
            imageView.frame.size = CGSize(width: 10, height: 10)

            ratingStackView.addArrangedSubview(imageView)
        }
    }
}
