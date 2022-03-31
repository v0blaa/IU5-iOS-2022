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
        view.backgroundColor = .systemBackground
        setupButtons()
    }
    
    private enum ButtonConstants {
        static let buttonHeight: CGFloat = 60
        static let buttonWidth: CGFloat = 140
        static let buttonsDistance: CGFloat = 30
    }
    
    private func setupButtons() {
        
        //кнопка для перехода к таблице
        tableButton.frame = CGRect(x: (view.frame.width - ButtonConstants.buttonWidth * 2 -
                                       ButtonConstants.buttonsDistance) / 2,
                                   y: (view.frame.height - ButtonConstants.buttonHeight) / 2 ,
                                   width: ButtonConstants.buttonWidth,
                                   height: ButtonConstants.buttonHeight)
        tableButton.layer.cornerRadius = 10
        tableButton.backgroundColor = .systemBlue
        tableButton.setTitle("Table", for: .normal)
        tableButton.addTarget(self, action: #selector(tableButtonAction(_ : )), for: .touchUpInside)
        tableButton.tag = 1
        view.addSubview(tableButton)
        
        //кнопка для перехода к коллекции
        collectionButton.frame = CGRect(x: tableButton.frame.maxX + ButtonConstants.buttonsDistance,
                                        y: (view.frame.height - ButtonConstants.buttonHeight)/2 ,
                                        width: ButtonConstants.buttonWidth,
                                        height: ButtonConstants.buttonHeight)
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
