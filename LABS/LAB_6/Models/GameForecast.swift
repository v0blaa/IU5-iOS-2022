//
//  GameForecast.swift
//  LABS
//
//  Created by Сергей Адольевич on 10.04.2022.
//

import Foundation

struct GameForecast: Decodable {
    let answer: String
    let question: String
    let category: GameCategory
    
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
}
