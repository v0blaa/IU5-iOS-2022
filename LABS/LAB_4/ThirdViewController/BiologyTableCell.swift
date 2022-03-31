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
    static let iconHeigh: CGFloat = 60
    static let iconWidth: CGFloat = 70
    static let labelHeight: CGFloat = 20
    static let horisontalDistance: CGFloat = 30
    static let verticalDistance: CGFloat = 20
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
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.iconWidth + 2 * Constants.horisontalDistance),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Constants.horisontalDistance),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.verticalDistance),
            titleLabel.heightAnchor.constraint(equalToConstant: Constants.labelHeight)
            ])
        
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subTitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.iconWidth + 2 * Constants.horisontalDistance),
            subTitleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Constants.horisontalDistance),
            subTitleLabel.heightAnchor.constraint(equalToConstant: Constants.labelHeight),
            subTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.verticalDistance)
            ])
        
        iconImage.frame = CGRect(x: Constants.horisontalDistance,
                                 y: Constants.verticalDistance,
                                 width: Constants.iconWidth,
                                 height: Constants.iconHeigh)
    }
    
    func configure(title: String, subTitle: String, icon: UIImage) {
        titleLabel.font = titleLabel.font.withSize(20)
        subTitleLabel.font = subTitleLabel.font.withSize(14)
        
        titleLabel.text = title
        subTitleLabel.text = subTitle
        iconImage.image = icon
    }
}
