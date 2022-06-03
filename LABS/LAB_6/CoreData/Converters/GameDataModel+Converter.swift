//
//  GameDataModel+Converter.swift
//  LABS
//
//  Created by Сергей Адольевич on 17.04.2022.
//

import Foundation
import CoreData

extension GameDataModel {
    static func convert(dto: GameData, into context: NSManagedObjectContext) -> GameDataModel {
        let model = GameDataModel(context: context)
        model.answer = dto.answer
        model.question = dto.question
        model.category = GameCategoryModel.convert(dto: dto.category, into: context)
        return model
        
    }
    
    func convertToDTO() -> GameData {
        GameData(answer: answer ?? "",
                 question: question ?? "",
                 category: category?.convertToDTO() ?? GameCategory(categoryId: -1, title: ""))
    }
}
