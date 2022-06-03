//
//  MVPMenuViewController.swift
//  LABS
//
//  Created by Сергей Адольевич on 03.04.2022.
//

import Foundation
import UIKit

final class MVPMenuViewController: UIViewController {
    
    private let tableButton = UIButton()
    private let collectionButton = UIButton()
    private var openedViewController: UIViewController?
    
    var output: MVPMenuViewOutput!

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
        view.addSubview(tableButton)
        tableButton.frame = CGRect(x: (view.frame.width - ButtonConstants.buttonWidth * 2 -
                                       ButtonConstants.buttonsDistance) / 2,
                                   y: (view.frame.height - ButtonConstants.buttonHeight) / 2 ,
                                   width: ButtonConstants.buttonWidth,
                                   height: ButtonConstants.buttonHeight)
        tableButton.layer.cornerRadius = 10
        tableButton.backgroundColor = .systemBlue
        tableButton.setTitle("Table", for: .normal)
        tableButton.addTarget(self, action: #selector(userDidTapTableButton), for: .touchUpInside)
        tableButton.tag = 1
        
        
        //кнопка для перехода к коллекции
        view.addSubview(collectionButton)
        collectionButton.frame = CGRect(x: tableButton.frame.maxX + ButtonConstants.buttonsDistance,
                                        y: (view.frame.height - ButtonConstants.buttonHeight)/2 ,
                                        width: ButtonConstants.buttonWidth,
                                        height: ButtonConstants.buttonHeight)
        collectionButton.layer.cornerRadius = 10
        collectionButton.backgroundColor = .systemBlue
        collectionButton.setTitle("Not working", for: .normal)
        
    }
    @objc private func userDidTapTableButton() {
        output.userDidTapTableButton()
    }
}

extension MVPMenuViewController: MVPMenuViewInput {
    
}

