//
//  GameInteractorIO.swift
//  LABS
//
//  Created by Сергей Адольевич on 09.04.2022.
//

import Foundation

protocol GameInteractorInput: AnyObject {
    func getGameForecast(completion: @escaping () -> Void)
}

protocol GameInteractorOutput: AnyObject {
    func setGameForecast(forecast: [GameForecast])

}
