//
//  NetworkRequestFactory.swift
//  LABS
//
//  Created by Сергей Адольевич on 09.04.2022.
//

import Foundation

//http://jservice.io/api/clues?category=42
//42,
protocol NetworkRequestFactoryProtocol {
    func getRequestForCurrentCategory() -> URLRequest
}

final class NetworkRequestFactory: NetworkRequestFactoryProtocol {
    
    private enum Constants {
        //ключа api у сайта нет :(
        static let api = "api"
    }
    
    private let category: Int
    
    init(category: Int) {
        self.category = category
    }
    
    func getRequestForCurrentCategory() -> URLRequest {
        guard let baseURL = URL(string: "https://jservice.io") else {
            print("BaseURL error")
            return URLRequest(url: URL(string: "")!)
        }
        let apiURL = baseURL.appendingPathComponent(Constants.api)
        let methodName = "clues"
        let requestURL = apiURL.appendingPathComponent(methodName)
        var urlComponents = URLComponents(url: requestURL, resolvingAgainstBaseURL: false)
        urlComponents?.queryItems = [
            URLQueryItem(name: "category", value: String(category))
        ]
        guard let url = urlComponents?.url else {
            assertionFailure("Something has gone wrong so URL can't be constructed")
            return URLRequest(url: URL(string: "")!)
        }
        return URLRequest(url: url)
    }
}
