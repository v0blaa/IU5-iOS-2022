//
//  GameViewIO.swift
//  LABS
//
//  Created by Сергей Адольевич on 09.04.2022.
//

import Foundation
import UIKit

protocol GameViewInput: AnyObject {
    
}

protocol GameViewOutput: AnyObject {
    func setGameData(viewController: GameViewController)
    func checkAnswer(userAnswer: String?) -> UIColor
}
