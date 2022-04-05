//
//  MVPBiologyTableViewIO.swift
//  LABS
//
//  Created by Сергей Адольевич on 03.04.2022.
//

import Foundation
import UIKit

protocol MVPBiologyTableViewInput: AnyObject {
    
}

protocol MVPBiologyTableViewOutput: AnyObject {
    func cellForRowAt(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    func userDidTapTableCell()
}
