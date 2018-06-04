//
//  ConfigurationServices.swift
//  CoolBlue3DExample
//
//  Created by Bruno Pantaleão N. Gonçalves on 03/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import Foundation

class ConfigurationServices {
    
    static let configurationFileName = "Server"
    static let baseUrlParamName = "baseUrl"
    static let productsParhParamName = "productsPath"
    
    static var serverConfig: NSDictionary {
        if let path = Bundle.main.path(forResource: configurationFileName, ofType: "plist"),
            let myDict = NSDictionary(contentsOfFile: path) {
            return myDict
        }
        return NSDictionary()
    }
    
    static var baseUrl: String {
        return serverConfig[baseUrlParamName] as? String ?? ""
    }
    
    static var productUrl: String {
        if let productsPath = serverConfig[productsParhParamName] as? String {
            return baseUrl +  productsPath
        }
        return ""
    }
}
