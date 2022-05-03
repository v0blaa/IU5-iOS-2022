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
        let requestFactory = NetworkRequestFactory(category: selectedCategory)
        let networkService = NetworkService(session: URLSession(configuration: .default))
        let coreDataManager = CoreDataManager()
        let storageRequestFactory = FetchRequestFactory()
        let storage = Storage(coreDataManager: coreDataManager, storageRequestFactory: storageRequestFactory)
        
        let view = GameViewController()
        let interactor = GameInteractor(requestFactory: requestFactory,
                                        networkService: networkService,
                                        storage: storage
                                        )
        let router = GameRouter()
        let presenter = GamePresenter(view: view, interactor: interactor, router: router, category: selectedCategory)
        interactor.output = presenter
        view.output = presenter
        
        return view
    }
}
