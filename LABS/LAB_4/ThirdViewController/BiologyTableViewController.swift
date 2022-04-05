//
//  ThirdViewControllerWithTable.swift
//  LABS
//
//  Created by Сергей Адольевич on 23.03.2022.
//

import Foundation
import UIKit

final class BiologyViewController: UIViewController{
    
    private lazy var tableViewController: UITableView = {
        UITableView(frame: CGRect.zero, style: .grouped)
    }()
    
    //отображаемая в ячейках информация
    private enum СellsDisplayTitle: String, CaseIterable {
        case brain = "Brain"
        case lungs = "Lungs"
    }
    private enum СellsDisplaySubTitle: String, CaseIterable {
        case brain = "Nice brain"
        case lungs = "Awesome lungs"
    }
    private enum СellsDisplayImages: String, CaseIterable {
        case brain = "brain"
        case lungs = "lungs"
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
        registerHeader()
        registerFooter()
    }
    
    private func registerCell() {
        tableViewController.register(MVPBiologyCellViewController.self, forCellReuseIdentifier: "BiologyTableCell")
    }
    
    private func registerHeader() {
        tableViewController.register(HeaderFooterForBiologyTable.self,
                                     forHeaderFooterViewReuseIdentifier: "HeaderView")
    }
    private func registerFooter() {
        tableViewController.register(HeaderFooterForBiologyTable.self,
                           forHeaderFooterViewReuseIdentifier: "FooterView")
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

extension BiologyViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.heightForRow
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controllersVC = ControllersViewController()
        navigationController?.pushViewController(controllersVC, animated: true)
    }
    
    //настройка header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.heightForHeaderFooter
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: "HeaderView") as? HeaderFooterForBiologyTable
        else {
            return UIView()
        }
        header.configure(text: "Biology header")
        return header
    }

    //настройка footer
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return Constants.heightForHeaderFooter
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let footer = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: "FooterView") as? HeaderFooterForBiologyTable
        else {
            return UIView()
        }
        footer.configure(text: "Biology footer")
        return footer
    }
}

extension BiologyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return СellsDisplayTitle.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableViewController.dequeueReusableCell(withIdentifier: "BiologyTableCell", for: indexPath) as? MVPBiologyCellViewController else {
            fatalError()
        }
        cell.configure(title: СellsDisplayTitle.allCases[indexPath.row].rawValue,
                       subTitle: СellsDisplaySubTitle.allCases[indexPath.row].rawValue,
                       icon: UIImage(systemName: СellsDisplayImages.allCases[indexPath.row].rawValue)!)
        return cell
    }
}

