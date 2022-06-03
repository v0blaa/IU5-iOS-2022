//
//  MVPBiologyTableModuleBuilder.swift
//  LABS
//
//  Created by Сергей Адольевич on 03.04.2022.
//

import Foundation
import UIKit

final class MVPBiologyTableModuleBuilder {
 
    func build(output: MVPBiologyTableModuleOutput) -> UIViewController {
        let viewController = MVPBiologyTableViewController()
        let presenter = MVPBiologyTablePresenter()
        
        viewController.output = presenter
        presenter.view = viewController
        presenter.moduleOutput = output
        
        return viewController
    }
}
