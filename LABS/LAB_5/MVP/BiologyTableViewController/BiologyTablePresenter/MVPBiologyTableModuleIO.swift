//
//  MVPBiologyTableModuleIO.swift
//  LABS
//
//  Created by Сергей Адольевич on 03.04.2022.
//

import Foundation

protocol MVPBiologyTableModuleInput: AnyObject {
    
}

protocol MVPBiologyTableModuleOutput: AnyObject {
    func MVPControllersViewControllerWantsToOpen()
}
