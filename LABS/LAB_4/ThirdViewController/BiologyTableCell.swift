//
//  BiologyTableCell.swift
//  LABS
//
//  Created by Сергей Адольевич on 23.03.2022.
//

import Foundation
import UIKit

final class BiologyTableCell: UITableViewCell {
    
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let iconImage = UIImageView()
    
    private enum Constants {
        enum Icon {
            static let heigh: CGFloat = 60
            static let width: CGFloat = 70
        }
        enum Label{
            static let height: CGFloat = 20
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
        subTitleLabel.text = ""
        iconImage.image = nil
    }

    private func setupViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(subTitleLabel)
        contentView.addSubview(iconImage)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor,
                                             constant: Constants.Icon.width + 2 * Constants.Distance.horisontal),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor,
                                              constant: -Constants.Distance.horisontal),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.Distance.vertical),
            titleLabel.heightAnchor.constraint(equalToConstant: Constants.Label.height)
            ])
        
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subTitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor,
                                                constant: Constants.Icon.width + 2 * Constants.Distance.horisontal),
            subTitleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Constants.Distance.horisontal),
            subTitleLabel.heightAnchor.constraint(equalToConstant: Constants.Label.height),
            subTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.Distance.vertical)
            ])
        
        iconImage.frame = CGRect(x: Constants.Distance.horisontal,
                                 y: Constants.Distance.vertical,
                                 width: Constants.Icon.width,
                                 height: Constants.Icon.heigh)
    }
    
    func configure(title: String, subTitle: String, icon: UIImage) {
        titleLabel.font = titleLabel.font.withSize(20)
        subTitleLabel.font = subTitleLabel.font.withSize(14)
        
        titleLabel.text = title
        subTitleLabel.text = subTitle
        iconImage.image = icon
    }
}
