//
//  ViewController.swift
//  Third_lab
//
//  Created by Сергей Адольевич on 13.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapAction(_ sender: Any) {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tableViewController")
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

