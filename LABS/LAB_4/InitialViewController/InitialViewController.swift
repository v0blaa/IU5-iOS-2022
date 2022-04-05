//
//  InitialViewController.swift
//  LABS
//
//  Created by Сергей Адольевич on 20.03.2022.
//

import Foundation
import UIKit

final class InitialViewController: UIViewController{
    
    private var openedViewController: UIViewController?
    
    private lazy var tableViewController: UITableView = {
        UITableView(frame: CGRect.zero, style: .grouped)
    }()
    
    private enum СellsDisplayData: String, CaseIterable {
        case lab3 = "Лабораторная работа №3"
        case lab4 = "Лабораторная работа №4"
        case lab5 = "Лабораторная работа №5(MVP)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(tableViewController)
        view.backgroundColor = UIColor(white: 0.8, alpha: 1)
        title = "Список лабораторных работ"
        setupTableViewConstrains()
        tableViewController.delegate = self
        tableViewController.dataSource = self
        tableViewController.backgroundColor = UIColor(white: 0.7, alpha: 1)
        tableViewController.tableHeaderView = UIView(frame: CGRect(x: 0,
                                                                   y: 0,
                                                                   width: tableViewController.frame.width,
                                                                   height: CGFloat.leastNormalMagnitude))
        registerCell()
    }
    
    private func registerCell() {
        tableViewController.register(InitialCell.self, forCellReuseIdentifier: "InitialCell")
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

extension InitialViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let viewController = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "Lab3Storyboard")
            navigationController?.pushViewController(viewController, animated: true)
        case 1:
            let viewController = MenuViewController()
            navigationController?.pushViewController(viewController, animated: true)
        case 2:
            let builder = MVPMenuModuleBuilder()
            let viewController = builder.build(output: self)
            navigationController?.pushViewController(viewController, animated: true)
        default:
            break
        }
    }
}

extension InitialViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return СellsDisplayData.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableViewController.dequeueReusableCell(withIdentifier: "InitialCell", for: indexPath) as? InitialCell else {
            fatalError()
        }
        cell.configure(text: СellsDisplayData.allCases[indexPath.row].rawValue)
        return cell
    }
    
}

extension InitialViewController: MVPMenuModuleOutput, MVPBiologyTableModuleOutput {
    func MVPControllersViewControllerWantsToOpen() {
        print("lol")
    }
    
    func MVPBiologyTableWantsToOpen() {
        let builder = MVPBiologyTableModuleBuilder()
        let viewController = builder.build(output: self)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
