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
        let productServices = ProductsServices(networkServices: NetworkServices())
        productServices.getProducts(completion: { (success, products) in
            if success, let products = products {
                self.viewController.products = products
                self.reloadList()
            } else {
                self.viewController.hideLoader()
                self.viewController.showError()
            }
        })
    }
    
    func reloadList() {
        DispatchQueue.main.async {
            self.viewController.tableView.reloadData()
            self.viewController.hideLoader()
        }
    }
}
