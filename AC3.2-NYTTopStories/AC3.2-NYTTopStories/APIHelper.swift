//
//  APIHelper.swift
//  AC3.2-NYTTopStories
//
//  Created by Tom Seymour on 11/20/16.
//  Copyright © 2016 C4Q-3.2. All rights reserved.
//

import Foundation

class APIHelper {
    
    static let manager = APIHelper()
    private init() {}
    
    func getData(endPoint: String, callback: @escaping (Data?) -> () ) {
        guard let myURL = URL(string: endPoint) else { return }
        let session = URLSession(configuration: URLSessionConfiguration.default)
        session.dataTask(with: myURL) { (data: Data?, response: URLResponse?, error: Error?) in
            if error != nil {
                print("Encountered error durring session:   \(error)")
            }
            guard let validData = data else { return }
            callback(validData)
            }.resume()
    }
}
