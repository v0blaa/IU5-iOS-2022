//
//  ViperControllerModuleBuilder.swift
//  LABS
//
//  Created by Сергей Адольевич on 04.04.2022.
//

import Foundation
import UIKit

class ViperControllerAssembly {
    func assembleViperControllerModule() -> UIViewController {
        let view = ViperControllersViewController()
        let interactor = ViperControllersInteractor()
        let router = ViperControllersRouter()
        let presenter = ViperControllersPresenter(view: view,
                                                  interactor: interactor,
                                                  router: router)
        interactor.output = presenter
        view.output = presenter
        
        return view
    }
}
