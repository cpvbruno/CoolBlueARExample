//
//  ProductsServices.swift
//  CoolBlue3DExample
//
//  Created by Bruno Pantaleão N. Gonçalves on 02/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import Foundation

class ProductsServices {
    
    static func getProducts(completion: @escaping (_ success: Bool, [Product]?) -> Void) {
        fetchProductsFromServer { (result) in
            if result["failed"] == nil,
                let items = result["items"] as? [AnyObject] {
                let products = items.map({ (item) -> Product in
                    var product = Product()
                    product.name = item["name"] as? String
                    product.description = item["description"] as? String
                    product.image = item["image"] as? String
                    product.price = item["price"] as? String
                    return product
                })
                completion(true, products)
            } else {
                completion(false, nil)
            }
        }
    }
    
    static func fetchProductsFromServer(completion: @escaping (NSDictionary) -> Void) {
        NetworkServices().get(url: ConfigurationServices.productUrl) { result in
            completion(result)
        }
    }
}
