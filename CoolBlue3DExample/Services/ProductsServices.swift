//
//  ProductsServices.swift
//  CoolBlue3DExample
//
//  Created by Bruno Pantaleão N. Gonçalves on 02/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import Foundation

class ProductsServices {
    static func getProducts(completion: @escaping (NSDictionary) -> Void) {
        NetworkServices().get(url: "https://demo1579101.mockable.io/coolblue/products") { result in
            completion(result)
        }
    }
}
