//
//  ProductTableViewCell.swift
//  CoolBlue3DExample
//
//  Created by Bruno Pantaleão N. Gonçalves on 02/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    func setup(product: Product) {
        productName.text = product.name
        productDescription.text = product.description
        productPrice.text = product.price
        if let url = URL(string: product.image) {
            productImage.downloadedFrom(url: url)
        }
    }
}
