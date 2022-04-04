//
//  FirstCell.swift
//  Third_lab
//
//  Created by Сергей Адольевич on 14.03.2022.
//

import UIKit

class FirstCell: UITableViewCell {

    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var icon: UIImageView!
    @IBOutlet private weak var subTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(image: UIImage, titleText: String, subTitleText: String){
        title.font = title.font.withSize(20)
        subTitle.font = subTitle.font.withSize(14)
        
        icon.image = image
        title.text = titleText
        subTitle.text = subTitleText
    }
}
