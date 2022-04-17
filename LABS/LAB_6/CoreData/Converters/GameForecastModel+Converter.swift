//
//  GameForecastModel+Converter.swift
//  LABS
//
//  Created by Сергей Адольевич on 17.04.2022.
//

import Foundation
import CoreData

extension GameForecastModel {
    static func convert(dto: GameForecast, into context: NSManagedObjectContext) -> GameForecastModel {
        let model = GameForecastModel(context: context)
        model.answer = dto.answer
        model.question = dto.question
        model.category = GameCategoryModel.convert(dto: dto.category, into: context)
        
        return model
    }
    
    func convertToDTO() -> GameForecast {
        GameForecast(answer: answer ?? "",
                     question: question ?? "",
                     category: category?.convertToDTO() ?? GameCategory(id: -1, title: ""))
    }
}
