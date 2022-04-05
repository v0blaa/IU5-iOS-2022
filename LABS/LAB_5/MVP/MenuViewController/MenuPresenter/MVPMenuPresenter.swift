//
//  MVPMenuPresenter.swift
//  LABS
//
//  Created by Сергей Адольевич on 03.04.2022.
//

import Foundation

final class MVPMenuPresenter {
    
    weak var view: MVPMenuViewInput!
    weak var moduleOutput: MVPMenuModuleOutput!
}

extension MVPMenuPresenter: MVPMenuViewOutput {
    func userDidTapTableButton() {
        moduleOutput?.MVPBiologyTableWantsToOpen()
    }
}
