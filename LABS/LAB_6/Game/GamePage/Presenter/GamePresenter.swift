//
//  GamePresenter.swift
//  LABS
//
//  Created by Сергей Адольевич on 09.04.2022.
//

import Foundation
import UIKit

final class GamePresenter {
    weak var output: GamePresenterOutput?
    
    private var interactor: GameInteractorInput!
    private var router: GameRouterInput?
    weak var view: GameViewInput!
    private var curGameData: GameData?
    private var gameData: [GameData]
    private var category: Int
    
    
    init(view: GameViewInput,
         interactor: GameInteractorInput,
         router: GameRouterInput,
         category: Int) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.category = category
        
        self.gameData = []
    }
}
extension GamePresenter: GameViewOutput {
    func setGameData(viewController: GameViewController) {
        interactor.loadData(forCategoryIndex: category) {
            let index = Int.random(in: 0..<self.gameData.count)
            self.curGameData = self.gameData[index]
            DispatchQueue.main.async{
                viewController.addSubviews()
                viewController.setupConstraints()
 
                let question = self.curGameData?.question ?? "Error"
                let categoryTitle = self.curGameData?.category.title ?? "Error"
                
                viewController.setupCategoryTitle(categoryTitleText: "Cathegory: " + categoryTitle)
                viewController.setupQuestionLabel(questionLabelText: "Question:\n\"" + question + "\"")
                viewController.setupTextfield(textfieldPlaceholder: "Write answer here")
                viewController.setupAnswerButton(answerButtonText: "Answer")
                viewController.setupCorrectAnswerLabel(correctAnswerLabelText: self.curGameData?.answer ?? "Error")
                viewController.setuoNextQuestionButton(nextQuestionButtonText: "Next question")
            }
        }
    }
    
    //проверка ответа пользователя
    func checkAnswer(userAnswer usersAnswer: String?) -> UIColor {
        if curGameData?.answer.lowercased() == usersAnswer?.lowercased() {
            return .green
        } else {
            return .red
        }
    }
    
    //переход к новому вопросу
    func reloadData(viewController: GameViewController) {
        
        let index = Int.random(in: 0..<gameData.count)
        self.curGameData = self.gameData[index]
        
        let question = self.curGameData?.question ?? "Error"
        
        viewController.clearAnswerTextField()
        viewController.setupQuestionLabel(questionLabelText: "Question:\n\"" + question + "\"")
        viewController.setupCorrectAnswerLabel(correctAnswerLabelText: self.curGameData?.answer ?? "Error")
    }
}

extension GamePresenter: GameInteractorOutput {
    func setGameData(gameData: [GameData]) {
        for curForecast in gameData {
            curGameData?.answer = curForecast.answer
            curGameData?.question = curForecast.question
            curGameData?.category.title = curForecast.category.title
            self.gameData.append(curGameData ?? GameData(answer: "Error", question: "Error", category: GameCategory(categoryId: 0, title: "Error")))
        }
    }
    func didFetchGameData(_ gameData: [GameData]) {
        self.gameData = gameData
    }
    
    func didReceiveError(_ error: Error) {
        view?.showAlert(title: "Ошибка", message: "Произошла ошибка при получении данных")
    }
}

