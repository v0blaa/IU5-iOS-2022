//
//  InitialCell.swift
//  LABS
//
//  Created by Сергей Адольевич on 21.03.2022.
//

import Foundation
import UIKit

final class InitialCell: UITableViewCell {
    
    private let titleLabel = UILabel()
    
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
        
    }

    private func setupViews() {
        contentView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
            ])
        
        titleLabel.backgroundColor = UIColor(white: 0.5, alpha: 1)
    }
    
    func configure(text: String) {
        titleLabel.text = text
    }
}
