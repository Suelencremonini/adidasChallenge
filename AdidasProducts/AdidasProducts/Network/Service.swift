//
//  Service.swift
//  AdidasProducts
//
//  Created by suelen on 08/05/21.
//

import Foundation

class Service {
    private var dataTask: DataTaskProtocol
    
    init(dataTask: DataTaskProtocol = DataTask()) {
        self.dataTask = dataTask
    }

    func fetch<T: Decodable>(request: Request, completion: @escaping (Result<T, ResponseError>) -> Void) {
        guard let url = URL(string: request.baseUrl + request.path) else {
            completion(.failure(.invalidURL))
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        
        dataTask.dataTaskWith(urlRequest: urlRequest, urlSession: URLSession.shared) { (data, urlResponse, error) in
            self.getResult(data: data, completion: completion)
        }
    }
    
    private func getResult<T: Decodable>(data: Data?, completion: @escaping (Result<T, ResponseError>) -> Void) {
        guard let data = data else {
            completion(.failure(.other))
            return
        }
        print(String(decoding: data, as: UTF8.self))
        
        guard let response = try? JSONDecoder().decode(T.self, from: data) else {
            completion(.failure(getError(data: data)))
            return
        }
        
        completion(.success(response))
    }
    
    private func getError(data: Data) -> ResponseError {
        guard let error = try? JSONDecoder().decode(APIError.self, from: data) else {
            return .other
        }
        return .api(error)
    }
}
