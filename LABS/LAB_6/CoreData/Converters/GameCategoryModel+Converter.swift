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
        model.categoryId = Int32(dto.categoryId)
        model.title = dto.title
        
        return model
    }
    
    func convertToDTO() ->GameCategory {
        GameCategory(categoryId: Int(categoryId),
                     title: title ?? "")
    }
}
