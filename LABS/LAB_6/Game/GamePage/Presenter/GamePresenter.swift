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
    private var dataMas: [GameData]
    private var curData: GameData
    
    
    init(view: GameViewInput,
         interactor: GameInteractorInput,
         router: GameRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.curData = GameData(categoryText: "", questionText: "", ansverText: "")
        self.dataMas = []
    }
}
extension GamePresenter: GameViewOutput {
    func setGameData(viewController: GameViewController) {
        interactor.getGameForecast(){
            let index = Int.random(in: 0..<self.dataMas.count)
            self.curData = self.dataMas[index]
            DispatchQueue.main.async{
                viewController.addSubviews()
                viewController.setupConstraints()
                
                viewController.setupCategoryTitle(categoryTitleText: "Cathegory: " + self.curData.categoryText)
                viewController.setupQuestionLabel(questionLabelText: "Question:\n\"" + self.curData.questionText + "\"")
                viewController.setupTextfield(textfieldPlaceholder: "Write answer here")
                viewController.setupAnswerButton(answerButtonText: "Answer")
                viewController.setupCorrectAnswerLabel(correctAnswerLabelText: self.curData.ansverText)
                viewController.setuoNextQuestionButton(nextQuestionButtonText: "Next question")
            }
        }
    }
    
    //проверка ответа пользователя
    func checkAnswer(userAnswer usersAnswer: String?) -> UIColor {
        if curData.ansverText.lowercased() == usersAnswer?.lowercased() {
            return .green
        } else {
            return .red
        }
    }
    
    //переход к новому вопросу
    func setNextQuestion(viewController: GameViewController) {
        let index = Int.random(in: 0..<dataMas.count)
        self.curData = self.dataMas[index]
        
        viewController.clearAnswerTextField()
        viewController.setupQuestionLabel(questionLabelText: "Question:\n\"" + self.curData.questionText + "\"")
        viewController.setupCategoryTitle(categoryTitleText: "Cathegory: " + self.curData.categoryText)
        viewController.setupCorrectAnswerLabel(correctAnswerLabelText: self.curData.ansverText)
    }
}

extension GamePresenter: GameInteractorOutput {
    func setGameForecast(forecast: [GameForecast]) {
        for curForecast in forecast {
            curData.ansverText = curForecast.answer
            curData.questionText = curForecast.question
            curData.categoryText = curForecast.category.title
            dataMas.append(curData)
        }
    }
}

