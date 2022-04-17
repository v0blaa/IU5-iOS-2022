//
//  NetworkService.swift
//  LABS
//
//  Created by Сергей Адольевич on 09.04.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func sendRequest(_ request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
        
    private let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
        
    func sendRequest(_ request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        session.dataTask(with: request) { data, responce, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let responce = responce as? HTTPURLResponse, responce.statusCode == 200 else {
                return
            }
    
            if let data = data {
                completion(.success(data))
            }
        }.resume()
    }
}
