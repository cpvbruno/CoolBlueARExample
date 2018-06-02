//
//  FirstViewController.swift
//  CoolBlue3DExample
//
//  Created by Bruno Pantaleão N. Gonçalves on 02/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import UIKit

class ProductsViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet var viewModel: ProductsViewModel!
    var products = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.viewController = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.viewModel.getProducts()
    }
    
    @IBAction func refresh(_ sender: Any) {
        self.viewModel.getProducts()
    }
}

extension ProductsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ProductTableViewCell {
            cell.setup(product: products[indexPath.row])
            cell.tag = indexPath.row
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ar") as? ARViewController {
            navigationController?.present(controller, animated: true)
        }
    }
}

