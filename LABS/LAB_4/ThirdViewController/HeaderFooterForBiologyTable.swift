//
//  HeaderFooterForBiologyTable.swift
//  LABS
//
//  Created by Сергей Адольевич on 24.03.2022.
//

import Foundation
import UIKit

class HeaderFooterForBiologyTable: UITableViewHeaderFooterView {

    private let title = UILabel()
    private lazy var line: UIView = UIView()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: NSCoder())
        setupViews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = ""
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        title.frame = CGRect(x: 15,
                             y: 0,
                             width: contentView.frame.width,
                             height: contentView.frame.height)
        if reuseIdentifier == "HeaderView" {
            line.frame = CGRect(x: 0,
                                y: contentView.frame.maxY - 1,
                                width: contentView.frame.width,
                                height: 1)
        } else if reuseIdentifier == "FooterView" {
            line.frame = CGRect(x: 0,
                                y: 0,
                                width: contentView.frame.width,
                                height: 1)
        }
    }
    private func setupViews() {
        contentView.addSubview(title)
        contentView.addSubview(line)
        line.backgroundColor = .systemGray3
    }

    func configure(text: String) {
        title.text = text
        title.textColor = .systemGray
        title.font = UIFont.boldSystemFont(ofSize: 14.0)
    }
}
