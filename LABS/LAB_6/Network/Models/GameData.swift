//
//  GameForecast.swift
//  LABS
//
//  Created by Сергей Адольевич on 10.04.2022.
//

import Foundation

struct GameData: Decodable {
    var answer: String
    var question: String
    var category: GameCategory
    
    enum CodingKeys: String, CodingKey {
        case answer
        case question
        case category = "category"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        answer = try values.decode(String.self, forKey: .answer)
        question = try values.decode(String.self, forKey: .question)
        category = try values.decode(GameCategory.self, forKey: .category)
    }
    
    internal init(answer: String,
                  question: String,
                  category: GameCategory) {
        self.answer = answer
        self.question = question
        self.category = category
    }
}
