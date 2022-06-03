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
    private let networkService: NetworkServiceProtocol
    private var requestFactory: NetworkRequestFactoryProtocol
    private var storage: StorageProtocol
    
    //lifecycle
    init(requestFactory: NetworkRequestFactory, networkService: NetworkService, storage: StorageProtocol) {
        self.requestFactory = requestFactory
        self.networkService = networkService
        self.storage = storage
    }
    
    //private
    private func saveGameData(_ gameData: [GameData]) {
        storage.save(gameData: gameData) { result in
            switch result {
            case .failure(let error):
                print("Не удалось сохранить данные \(error)")
                
            case .success:
                break
            }
        }
    }

    func obtainGameDataFromCache(categoryIndex: Int?, completion: @escaping (Result<[GameData], Error>) -> Void) {
        storage.obtainGameData(withCategoryIndex: categoryIndex ?? 0 , completion: completion)
    } 
    
    func obtainGameDataFromServer() {
        let request = requestFactory.getRequestForCurrentCategory()
        networkService.sendRequest(request) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .failure(let error):
                print("Error \(error)")
            case .success(let data):
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    let gameData = try decoder.decode([GameData].self, from: data)
                    strongSelf.saveGameData(gameData)
                    strongSelf.output.setGameData(gameData: gameData)
                } catch {
                    assertionFailure("Error: \(error)")
                    strongSelf.output.didReceiveError(error)
                }
            }
        }
    }
}

extension GameInteractor: GameInteractorInput {
    func loadData(forCategoryIndex categoryIndex: Int,  compl: @escaping () -> Void) {
        obtainGameDataFromCache(categoryIndex: categoryIndex) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let gameData):
                strongSelf.output.didFetchGameData(gameData)
                compl()
                
            case .failure(let error):
                strongSelf.output.didReceiveError(error)
            }
            strongSelf.obtainGameDataFromServer()
        }
    }
}

