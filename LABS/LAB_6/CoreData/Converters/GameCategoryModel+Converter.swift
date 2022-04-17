//
//  GameCategoryModel.swift
//  LABS
//
//  Created by Сергей Адольевич on 17.04.2022.
//

import Foundation
import CoreData

extension GameCategoryModel {
    static func convert(dto: GameCategory, into context: NSManagedObjectContext) -> GameCategoryModel {
        let model = GameCategoryModel(context: context)
        model.id = Int32(dto.id)
        model.title = dto.title
        
        return model
    }
    
    func convertToDTO() ->GameCategory {
        GameCategory(id: Int(id),
                     title: title ?? "")
    }
}
