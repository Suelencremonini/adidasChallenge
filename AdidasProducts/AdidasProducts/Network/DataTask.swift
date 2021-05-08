//
//  DataTask.swift
//  AdidasProducts
//
//  Created by suelen on 08/05/21.
//

import Foundation

protocol DataTaskProtocol {
    func dataTaskWith(urlRequest: URLRequest, urlSession: URLSession, completion: @escaping (Data?, URLResponse?, Error?) -> Void)
}

struct DataTask: DataTaskProtocol {
    func dataTaskWith(urlRequest: URLRequest, urlSession: URLSession, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        urlSession.dataTask(with: urlRequest, completionHandler: completion).resume()
    }
}
