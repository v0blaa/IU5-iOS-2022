//
//  GameDataModel+Converter.swift
//  LABS
//
//  Created by Сергей Адольевич on 17.04.2022.
//

import Foundation
import CoreData

extension GameDataModel {
    static func convert(dto: [GameData], into context: NSManagedObjectContext) -> [GameDataModel] {
        let model = GameDataModel(context: context)
        var modelMas = [GameDataModel(context: context)]
        for curDto in dto {
            model.answer = curDto.answer
            model.question = curDto.question
            model.category = GameCategoryModel.convert(dto: curDto.category, into: context)
            modelMas.append(model)
        }
        
        return modelMas
    }
    
    func convertToDTO() -> GameData {
        GameData(answer: answer ?? "",
                 question: question ?? "",
                 category: category?.convertToDTO() ?? GameCategory(categoryId: -1, title: ""))
    }
}
