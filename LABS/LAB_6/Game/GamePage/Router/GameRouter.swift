//
//  GameRouter.swift
//  LABS
//
//  Created by Сергей Адольевич on 09.04.2022.
//

import Foundation
import UIKit

protocol GameRouterInput {
}

final class GameRouter: GameRouterInput {
    weak var rootViewController: UIViewController?
}
