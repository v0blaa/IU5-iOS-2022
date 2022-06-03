//
//  GameCategory.swift
//  LABS
//
//  Created by Сергей Адольевич on 10.04.2022.
//

import Foundation

struct GameCategory: Decodable {
    var categoryId: Int
    var title: String
    
    enum CodingKeys: String, CodingKey {
        case categoryId = "id"
        case title
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        categoryId = try values.decode(Int.self, forKey: .categoryId)
        title = try values.decode(String.self, forKey: .title)
    }
    
    internal init(categoryId: Int,
                  title: String) {
        self.categoryId = categoryId
        self.title = title
    }
}
