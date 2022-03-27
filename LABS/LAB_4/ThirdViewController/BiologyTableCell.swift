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
        contentView.addSubview(subTitleLabel)
        contentView.addSubview(iconImage)
        
        let iconHeigh: CGFloat = 60
        let iconWidth: CGFloat = 70
        let horisontalDistance: CGFloat = 30
        let verticalDistance: CGFloat = 20
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: iconWidth + 2 * horisontalDistance),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -horisontalDistance),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: verticalDistance),
            titleLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subTitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: iconWidth + 2 * horisontalDistance),
            subTitleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -horisontalDistance),
            subTitleLabel.heightAnchor.constraint(equalToConstant: 20),
            subTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -verticalDistance)
            ])
        
        iconImage.frame = CGRect(x: horisontalDistance,
                                 y: verticalDistance,
                                 width: iconWidth,
                                 height: iconHeigh)
    }
    
    func configure(title: String, subTitle: String, icon: UIImage) {
        titleLabel.font = titleLabel.font.withSize(20)
        subTitleLabel.font = subTitleLabel.font.withSize(14)
        
        titleLabel.text = title
        subTitleLabel.text = subTitle
        iconImage.image = icon
    }
}
