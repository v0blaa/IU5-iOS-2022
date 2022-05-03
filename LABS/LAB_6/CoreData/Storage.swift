//
//  Storage.swift
//  LABS
//
//  Created by Сергей Адольевич on 01.05.2022.
//

import Foundation

enum StorageError: Error {
    case noData
}

protocol StorageProtocol {
    func save(gameData: [GameData], completion: @escaping (Result<GameData, Error>) -> Void)
    func obtainGameData(withCategoryIndex categoryIndex: Int, completion: @escaping (Result<GameData, Error>) -> Void)
}

final class Storage: StorageProtocol {
    
    // private
    
    private let coreDataManager: CoreDataManagerProtocol
    private let storageRequestFactory: FetchRequestFactoryProtocol
    
    // lifecycle
    
    init(coreDataManager: CoreDataManagerProtocol, storageRequestFactory: FetchRequestFactoryProtocol) {
        self.coreDataManager = coreDataManager
        self.storageRequestFactory = storageRequestFactory
    }
    
    func save(gameData: [GameData], completion: @escaping (Result<GameData, Error>) -> Void) {

         for curGameData in gameData {
            let context = coreDataManager.writeContext
            context.perform {
                _ = GameDataModel.convert(dto: curGameData, into: context)
                do {
                    try context.save()
                    completion(.success(curGameData))
                } catch {
                    assertionFailure("Error when saving context \(error)")
                    context.rollback()
                    completion(.failure(error))
                }
            }
        }
    }
    
    func obtainGameData(withCategoryIndex categoryIndex: Int, completion: @escaping (Result<GameData, Error>) -> Void) {
        let context = coreDataManager.readContext
        context.perform { [weak self] in
            guard let strongSelf = self else { return }
            let request = strongSelf.storageRequestFactory.gameDataRequest(categoryIndex: categoryIndex)
            do {
                let fetchRequestResults = try context.fetch(request)
                guard let gameData = fetchRequestResults.first else {
                    completion(.failure(StorageError.noData))
                    return
                }
                let dtoModel = gameData.convertToDTO()
                completion(.success(dtoModel))
            } catch {
                assertionFailure("Failed to obtain game data: \(error)")
                completion(.failure(error))
            }
        }
    }
}
