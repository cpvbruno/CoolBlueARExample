//
//  Loader.swift
//  CoolBlue3DExample
//
//  Created by Bruno Pantaleão N. Gonçalves on 02/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import UIKit

class Loader: UIView {
    class func instanceFromNib() -> Loader {
        return UINib(nibName: "Loader", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! Loader
    }
}
