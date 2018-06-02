//
//  NetworkServices.swift
//  CoolBlue3DExample
//
//  Created by Bruno Pantaleão N. Gonçalves on 02/06/18.
//  Copyright © 2018 Bruno Pantaleão. All rights reserved.
//

import Foundation

class NetworkServices {
    func get(url: String, completion: @escaping (NSDictionary) -> Void) {
        let scriptUrl = url
        let myUrl = URL(string: scriptUrl);
        var request = URLRequest(url:myUrl!);
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            
            if error != nil
            {
                print("error=\(String(describing: error))")
                completion(NSDictionary(dictionary: ["failed": "1"]))
                return
            }
            do {
                if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
                    completion(convertedJsonIntoDict)
                }
            } catch let error as NSError {
                print(error.localizedDescription)
                completion(NSDictionary(dictionary: ["failed": "1"]))
            }
        }
        task.resume()
    }
}
