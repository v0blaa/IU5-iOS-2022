//
//  MenuTableViewController.swift
//  LABS
//
//  Created by Сергей Адольевич on 09.04.2022.
//

import Foundation
import UIKit

final class MenuTableViewController: UIViewController {
    
    private lazy var tableViewController: UITableView = {
        UITableView(frame: CGRect.zero, style: .grouped)
    }()
    
    private enum CellsDisplayData {
        enum Titles: String, CaseIterable {
            case sport = "Sport"
            case animals = "Animals"
            case science = "Science"
        }
        
        enum Icons: String, CaseIterable {
            case sport = "sportscourt"
            case animals = "pawprint"
            case science = "graduationcap"
        }
    }
    
    private enum CategoriesData: Int, CaseIterable {
        case sport = 42
        case animals = 21
        case science = 25
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
        title = "Game menu"
        setupTableViewConstrains()
        tableViewController.delegate = self
        tableViewController.dataSource = self
        tableViewController.tableHeaderView = UIView(frame: CGRect(x: 0,
                                                                   y: 0,
                                                                   width: tableViewController.frame.width,
                                                                   height: CGFloat.leastNormalMagnitude))
        registerCell()
    }
    
    private func registerCell() {
        tableViewController.register(GameMenuTableCellViewController.self,
                                     forCellReuseIdentifier: "GameMenuTableCell")
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

extension MenuTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.heightForRow
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let builder = GameModuleBuilder()
        let selectedCategory: Int = CategoriesData.allCases[indexPath.row].rawValue
        let viewController = builder.build(selectedCategory: selectedCategory)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection
                                section: Int) -> String? {
       return "Choose the topic of a question"
    }
}

extension MenuTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CellsDisplayData.Titles.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableViewController.dequeueReusableCell(withIdentifier: "GameMenuTableCell", for: indexPath) as? GameMenuTableCellViewController else {
            fatalError()
        }
        cell.configure(title: CellsDisplayData.Titles.allCases[indexPath.row].rawValue,
                       icon: UIImage(systemName: CellsDisplayData.Icons.allCases[indexPath.row].rawValue)!)
        return cell
    }
}

