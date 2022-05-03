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
    private var category: Int
    
    private var dataMas: [GameDisplayData]
    private var curData: GameDisplayData
    
    
    init(view: GameViewInput,
         interactor: GameInteractorInput,
         router: GameRouterInput,
         category: Int) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.category = category
        
        
        self.curData = GameDisplayData(categoryText: "", questionText: "", ansverText: "")
        self.dataMas = []
    }
}
extension GamePresenter: GameViewOutput {
    func setGameData(viewController: GameViewController) {
        interactor.loadData(forCategoryIndex: category)
        
        
        //с этим позже раберусь
        
//    (){
//            let index = Int.random(in: 0..<self.dataMas.count)
//            self.curData = self.dataMas[index]
//            DispatchQueue.main.async{
//                viewController.addSubviews()
//                viewController.setupConstraints()
//
//                viewController.setupCategoryTitle(categoryTitleText: "Cathegory: " + self.curData.categoryText)
//                viewController.setupQuestionLabel(questionLabelText: "Question:\n\"" + self.curData.questionText + "\"")
//                viewController.setupTextfield(textfieldPlaceholder: "Write answer here")
//                viewController.setupAnswerButton(answerButtonText: "Answer")
//                viewController.setupCorrectAnswerLabel(correctAnswerLabelText: self.curData.ansverText)
//                viewController.setuoNextQuestionButton(nextQuestionButtonText: "Next question")
//            }
//        }
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
    func reloadData(viewController: GameViewController) {
        let index = Int.random(in: 0..<dataMas.count)
        self.curData = self.dataMas[index]
        
        viewController.clearAnswerTextField()
        viewController.setupQuestionLabel(questionLabelText: "Question:\n\"" + self.curData.questionText + "\"")
        viewController.setupCorrectAnswerLabel(correctAnswerLabelText: self.curData.ansverText)
    }
}

extension GamePresenter: GameInteractorOutput {
    func setGameData(gameData: [GameData]) {
        for curForecast in gameData {
            curData.ansverText = curForecast.answer
            curData.questionText = curForecast.question
            curData.categoryText = curForecast.category.title
            dataMas.append(curData)
        }
    }
    func didFetchGameData(_ gameData: GameData) {
        curGameData = gameData
        view.reloadData()
    }
    
    func didReceiveError(_ error: Error) {
        view?.showAlert(title: "Ошибка", message: "Произошла ошибка при получении данных")
    }
}

