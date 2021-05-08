//
//  ProductsTableViewCell.swift
//  AdidasProducts
//
//  Created by suelen on 08/05/21.
//

import UIKit

class ProductsTableViewCell: UITableViewCell {
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func config(product: Produt) {
        productLabel.text = product.name
        descriptionLabel.text = product.description
        priceLabel.text = product.formattedPrice
    }
}
