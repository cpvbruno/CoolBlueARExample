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
        let alert = UIAlertView(title: localizedString(text: "errorHeader"),
                                message: localizedString(text: "errorBody"),
                                delegate: nil,
                                cancelButtonTitle: localizedString(text: "errorButton"))
        alert.show()
    }
    
    func localizedString(text: String) -> String {
        return NSLocalizedString(text, comment: "")
    }
    
}
