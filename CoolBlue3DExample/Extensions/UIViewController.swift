//
//  UIViewController.swift
//  CoolBlue3DExample
//
//  Created by Bruno Pantaleão N. Gonçalves on 02/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showError() {
        let alert = UIAlertView(title: "Oops...", message: "Something went wront, please try again", delegate: nil, cancelButtonTitle: "Ok")
        alert.show()
    }
    
}
