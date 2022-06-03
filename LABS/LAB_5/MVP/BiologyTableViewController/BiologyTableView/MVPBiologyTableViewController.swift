//
//  MVPBiologyTableViewController.swift
//  LABS
//
//  Created by Сергей Адольевич on 03.04.2022.
//

import Foundation
import UIKit

final class MVPBiologyTableViewController: UIViewController {
    
    private lazy var tableViewController: UITableView = {
        UITableView(frame: CGRect.zero, style: .grouped)
    }()
    
    private var openedViewController: UIViewController?
    var output: MVPBiologyTableViewOutput!
    
    //отображаемая в ячейках информация
    //расприватила для того чтобы использовать эти данные в presenter
    struct CellsDisplayData {
        enum Title: String, CaseIterable {
            case brain = "Brain"
            case lungs = "Lungs"
        }
        enum SubTitle: String, CaseIterable {
            case brain = "Nice brain"
            case lungs = "Awesome lungs"
        }
        enum Images: String, CaseIterable {
            case brain = "brain"
            case lungs = "lungs"
        }
    }
    
    private enum Constants {
    static let heightForRow: CGFloat = 100
    static let heightForHeaderFooter: CGFloat = 30
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(tableViewController)
        
        view.backgroundColor = .systemBackground
        setupTableViewConstrains()
        tableViewController.delegate = self
        tableViewController.dataSource = self
        tableViewController.tableHeaderView = UIView(frame: CGRect(x: 0,
                                                                   y: 0,
                                                                   width: tableViewController.frame.width,
                                                                   height: CGFloat.leastNormalMagnitude))
        registerCell()
    }
    
    //cell
    private func registerCell() {
        tableViewController.register(MVPBiologyCell.self, forCellReuseIdentifier: "MVPBiologyCell")
    }
    
    // header
    func tableView(_ tableView: UITableView, titleForHeaderInSection
                                section: Int) -> String? {
       return "Biology header"
    }

    // footer
    func tableView(_ tableView: UITableView, titleForFooterInSection
                                section: Int) -> String? {
       return "Biology footer"
    }
    
    private func setupTableViewConstrains() {
        tableViewController.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableViewController.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableViewController.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableViewController.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableViewController.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}


extension MVPBiologyTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.heightForRow
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let builder = ViperControllerAssembly()
        let viewController = builder.assembleViperControllerModule()
        navigationController?.pushViewController(viewController, animated: true)
    }
}


extension MVPBiologyTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CellsDisplayData.Title.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        output.cellForRowAt(tableView, cellForRowAt: indexPath)
    }
}

extension MVPBiologyTableViewController: MVPBiologyTableViewInput {
}

extension MVPBiologyTableViewController: ViperControllersPresenterOutput {
    func MVPControllersViewControllerWantsToOpen() {
        let builder = ViperControllerAssembly()
        let viewController = builder.assembleViperControllerModule()
        present(viewController, animated: true)
    }
}
