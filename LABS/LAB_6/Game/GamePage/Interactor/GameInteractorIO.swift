//
//  GameInteractorIO.swift
//  LABS
//
//  Created by Сергей Адольевич on 09.04.2022.
//

import Foundation

protocol GameInteractorInput: AnyObject {
    func loadData(forCategoryIndex categoryIndex: Int)
    func obtainGameDataFromCache(categoryIndex: Int?, completion: @escaping (Result<GameData, Error>) -> Void)
}

protocol GameInteractorOutput: AnyObject {
    func setGameData(gameData: [GameData])
    func didFetchGameData(_ gameData: GameData)
    func didReceiveError(_ error: Error)
}
