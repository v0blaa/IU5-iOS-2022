//
//  TabelViewController.swift
//  Third_lab
//
//  Created by Сергей Адольевич on 13.03.2022.
//

import UIKit

class TabelViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTable()
    }
    
    private func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension TabelViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath) as? FirstCell
        
        
        if indexPath.row == 0{
            cell?.configure(image: UIImage(systemName: "brain")!, titleText: "Brain", subTitleText: "Nice brain")
        }
        else{
            cell?.configure(image: UIImage(systemName: "lungs")!, titleText: "Lungs", subTitleText: "Awesome lungs")
        }
                    
        return cell!
    }
    
    //меняю высоту ячеек
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
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
}

extension TabelViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
    let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "thirdViewController")
    navigationController?.pushViewController(viewController, animated: true)
    tableView.deselectRow(at: indexPath, animated: true)
    }
}
