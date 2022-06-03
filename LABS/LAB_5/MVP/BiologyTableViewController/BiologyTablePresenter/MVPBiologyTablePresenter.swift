//
//  MVPBiologyTablePresenter.swift
//  LABS
//
//  Created by Сергей Адольевич on 03.04.2022.
//

import Foundation
import UIKit

final class MVPBiologyTablePresenter {
    
    weak var view: MVPBiologyTableViewInput!
    weak var moduleOutput: MVPBiologyTableModuleOutput!
}

extension MVPBiologyTablePresenter: MVPBiologyTableViewOutput {
    func userDidTapTableCell() {
        moduleOutput?.MVPControllersViewControllerWantsToOpen()
    }
    
    func cellForRowAt(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->  UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MVPBiologyCell", for: indexPath) as? MVPBiologyCell else {
            fatalError()
            }
        cell.configure(title: MVPBiologyTableViewController.CellsDisplayData.Title.allCases[indexPath.row].rawValue,
                       subTitle: MVPBiologyTableViewController.CellsDisplayData.SubTitle.allCases[indexPath.row].rawValue,
                       icon: UIImage(systemName: MVPBiologyTableViewController.CellsDisplayData.Images.allCases[indexPath.row].rawValue)!)
        return cell
    }
}
