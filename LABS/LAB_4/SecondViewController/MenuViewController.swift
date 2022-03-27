//
//  SecondViewCotnroller.swift
//  LABS
//
//  Created by Сергей Адольевич on 23.03.2022.
//

import Foundation
import UIKit

final class MenuViewController: UIViewController{
    
    let tableButton = UIButton()
    let collectionButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }
    
    private func setupButtons() {
        let buttonHeight: CGFloat = 60
        let buttonWidth: CGFloat = 140
        let buttonsDistance: CGFloat = 30
        
        //кнопка для перехода к таблице
        tableButton.frame = CGRect(x: (view.frame.width - buttonWidth * 2 - buttonsDistance) / 2,
                                   y: (view.frame.height - buttonHeight) / 2 ,
                                   width: buttonWidth,
                                   height: buttonHeight)
        tableButton.layer.cornerRadius = 10
        tableButton.backgroundColor = .systemBlue
        tableButton.setTitle("Table", for: .normal)
        tableButton.addTarget(self, action: #selector(tableButtonAction(_ : )), for: .touchUpInside)
        tableButton.tag = 1
        view.addSubview(tableButton)
        
        //кнопка для перехода к коллекции
        collectionButton.frame = CGRect(x: tableButton.frame.maxX + buttonsDistance,
                                        y: (view.frame.height - buttonHeight)/2 ,
                                        width: buttonWidth,
                                        height: buttonHeight)
        collectionButton.layer.cornerRadius = 10
        collectionButton.backgroundColor = .systemBlue
        collectionButton.setTitle("Not working", for: .normal)
        
        view.addSubview(collectionButton)
    }
    @objc func tableButtonAction(_ sender:UIButton!) {
        let nextVC = BiologyViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
