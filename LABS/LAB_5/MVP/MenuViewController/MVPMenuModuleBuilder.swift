//
//  MVPMenuModuleBuilder.swift
//  LABS
//
//  Created by Сергей Адольевич on 03.04.2022.
//

import Foundation
import UIKit

final class MVPMenuModuleBuilder {
 
    func build(output: MVPMenuModuleOutput) -> UIViewController {
        let viewController = MVPMenuViewController()
        let presenter = MVPMenuPresenter()
        
        viewController.output = presenter
        presenter.view = viewController
        presenter.moduleOutput = output
        
        return viewController
    }
}
