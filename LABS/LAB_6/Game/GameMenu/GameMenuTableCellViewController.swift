//
//  GameMenuTableCellViewController.swift
//  LABS
//
//  Created by Сергей Адольевич on 09.04.2022.
//

import Foundation
import UIKit

//суть программы: беру с сайта с базой вопросов для викторины рандомный вопрос
//на выбранную пользователем тему
//пользователь отвечает на вопрос и проверяет ответ (textfield загорается красным или зеленым в зависимости
//от правильности ответа)
final class GameMenuTableCellViewController: UITableViewCell {
    
    private let titleLabel = UILabel()
    private let iconImage = UIImageView()
    
    private enum Constants {
        enum Icon {
            static let heigh: CGFloat = 60
            static let width: CGFloat = 70
        }
        enum Label{
            static let height: CGFloat = 30
        }
        enum Distance{
            static let horisontal: CGFloat = 30
            static let vertical: CGFloat = 20
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: NSCoder())
        setupViews()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
        iconImage.image = nil
    }

    private func setupViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(iconImage)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor,
                                             constant: Constants.Icon.width + 2 * Constants.Distance.horisontal),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor,
                                              constant: -Constants.Distance.horisontal),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: Constants.Label.height)
            ])
        
        iconImage.frame = CGRect(x: Constants.Distance.horisontal,
                                 y: Constants.Distance.vertical,
                                 width: Constants.Icon.width,
                                 height: Constants.Icon.heigh)
    }
    
    func configure(title: String, icon: UIImage) {
        titleLabel.font = titleLabel.font.withSize(24)
        
        titleLabel.text = title
        iconImage.image = icon
    }
}
