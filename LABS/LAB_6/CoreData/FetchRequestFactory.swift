//
//  FetchRequestFactory.swift
//  LABS
//
//  Created by Сергей Адольевич on 01.05.2022.
//

import Foundation
import CoreData

protocol FetchRequestFactoryProtocol {
    func gameCategoryDataRequest() -> NSFetchRequest<GameCategoryModel>
    func removeAllRequest() -> NSBatchDeleteRequest
    func gameDataRequest(categoryIndex: Int) -> NSFetchRequest<GameDataModel>
}

final class FetchRequestFactory: FetchRequestFactoryProtocol {
    
    func gameCategoryDataRequest() -> NSFetchRequest<GameCategoryModel> {
        let request = NSFetchRequest<GameCategoryModel>(entityName: GameCategoryModel.entity().name ?? "")
        return request
    }
    
    func removeAllRequest() -> NSBatchDeleteRequest {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: GameCategoryModel.entity().name ?? "")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        return deleteRequest
    }
    
    func gameDataRequest(categoryIndex: Int) -> NSFetchRequest<GameDataModel> {
        let request = GameDataModel.fetchRequest()
        
        let gamePredicate = NSPredicate(format: "%K == %@",  #keyPath(GameDataModel.category.categoryId), Int32(categoryIndex))
        request.predicate = gamePredicate
        
        return request
    }
}
