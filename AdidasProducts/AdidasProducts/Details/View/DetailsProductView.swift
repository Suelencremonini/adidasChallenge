//
//  DetailsProductView.swift
//  AdidasProducts
//
//  Created by suelen on 09/05/21.
//

import UIKit

class DetailsProductView: UIView {
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        Bundle.main.loadNibNamed("DetailsProductView", owner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    func config(product: Produt) {
        productLabel.text = product.name
        descriptionLabel.text = product.description
        priceLabel.text = product.formattedPrice
    }
}
