//
//  GameEntity.swift
//  LABS
//
//  Created by Сергей Адольевич on 09.04.2022.
//

import Foundation
import UIKit

struct GameDisplayData {
    var categoryText: String
    var questionText: String
    var ansverText: String
    
    init(categoryText: String, questionText: String, ansverText: String) {
        self.categoryText = categoryText
        self.questionText = questionText
        self.ansverText = ansverText
    }
}
