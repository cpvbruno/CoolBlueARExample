//
//  BaseViewController.swift
//  CoolBlue3DExample
//
//  Created by Bruno Pantaleão N. Gonçalves on 02/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    let loader = Loader.instanceFromNib()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStyle()
        setupLoader()
    }
    
    func setupStyle() {
        let navBar = navigationController?.navigationBar
        let navBarTextAttr = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        navBar?.barTintColor = UIColor.base
        navBar?.isTranslucent = false
        navBar?.tintColor = UIColor.white
        navBar?.prefersLargeTitles = true
        
        navBar?.titleTextAttributes = navBarTextAttr
        navBar?.largeTitleTextAttributes = navBarTextAttr
    }
    
    func setupLoader()  {
        loader.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        view.addSubview(loader)
        loader.isHidden = true
    }
    
    func showLoader() {
        loader.isHidden = false
    }
    
    func hideLoader() {
        loader.isHidden = true
    }
}
