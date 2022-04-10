//
//  GameInteractor.swift
//  LABS
//
//  Created by Сергей Адольевич on 09.04.2022.
//

import Foundation
import UIKit

final class GameInteractor {
    weak var output: GameInteractorOutput!
    private let networkService: NetworkServiceProtocol!
    private var requestFactory: NetworkRequestFactoryProtocol!
    
    init(selectedCategory: Int) {
        self.requestFactory = NetworkRequestFactory(category: selectedCategory)
        self.networkService = NetworkService(session: URLSession(configuration: .default))
    }
}

extension GameInteractor: GameInteractorInput {
    
    func getGameForecast(completion: @escaping () -> Void) {
        let request = requestFactory.getRequestForCurrentCategory()
        networkService.sendRequest(request) { result in
            switch result {
            case .failure(let error):
                print("Error \(error)")
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let forecast = try decoder.decode([GameForecast].self, from: data)
                    self.output.setGameForecast(forecast: forecast)
                    completion()
                } catch {
                    assertionFailure("\(error)")
                }
            }
        }
    }
}
