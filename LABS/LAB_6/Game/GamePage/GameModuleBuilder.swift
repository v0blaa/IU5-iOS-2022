//
//  GameModuleBuilder.swift
//  LABS
//
//  Created by Сергей Адольевич on 09.04.2022.
//

import Foundation
import UIKit

class GameModuleBuilder {
    func build(selectedCategory: Int) -> UIViewController {
        let view = GameViewController()
        let interactor = GameInteractor(selectedCategory: selectedCategory)
        let router = GameRouter()
        let presenter = GamePresenter(view: view, interactor: interactor, router: router)
        interactor.output = presenter
        view.output = presenter
        
        return view
    }
}
