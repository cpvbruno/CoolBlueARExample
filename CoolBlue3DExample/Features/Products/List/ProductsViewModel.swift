//
//  ProductsViewModel.swift
//  CoolBlue3DExample
//
//  Created by Bruno Pantaleão N. Gonçalves on 02/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import Foundation
import UIKit

class ProductsViewModel: NSObject {
    
    var products = [Product]()
    var viewController: ProductsViewController!
    
    func getProducts() {
        viewController.showLoader()
        ProductsServices.getProducts(completion: { (result) in
            if result["failed"] == nil {
                var products = [Product]()
                if let items = result["items"] as? [AnyObject] {
                    for item in items {
                        var product = Product()
                        product.name = item["name"] as? String ?? ""
                        product.description = item["description"] as? String ?? ""
                        product.image = item["image"] as? String ?? ""
                        product.price = item["price"] as? String ?? ""
                        products.append(product)
                    }
                }
                self.viewController.products = products
                DispatchQueue.main.async {
                     self.viewController.tableView.reloadData()
                    self.viewController.hideLoader()
                }
            } else {
                self.viewController.showError()
            }
        })
    }
    
}
