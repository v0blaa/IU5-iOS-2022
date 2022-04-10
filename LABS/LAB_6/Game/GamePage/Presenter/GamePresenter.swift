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
    private var data: GameData
    
    
    init(view: GameViewInput,
         interactor: GameInteractorInput,
         router: GameRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.data = GameData(categoryText: "", questionText: "", ansverText: "")
    }
}
extension GamePresenter: GameViewOutput {
    func setGameData(viewController: GameViewController) {
        interactor.getGameForecast(){
        DispatchQueue.main.async{
            viewController.setupQuestionLabel(questionLabelText: "Question:\n\"" + self.data.questionText + "\"")
            viewController.setupThemeTitle(categoryTitleText: "Cathegory: " + self.data.categoryText)
            viewController.setupTextfield(textfieldPlaceholder: "Write answer here")
            viewController.setupAnswerButton(answerButtonText: "Answer")
            viewController.setupCorrectAnswerLabel(correctAnswerLabelText: self.data.ansverText)
        }
        }
    }
    
    func buttonClicked(userAnswer usersAnswer: String?) -> UIColor {
        if data.ansverText.lowercased() == usersAnswer?.lowercased() {
            return .green
        } else {
            return .red
        }
    }
}

extension GamePresenter: GameInteractorOutput {
    func setGameForecast(forecast: [GameForecast]) {
        let index = Int.random(in: 0..<100)
        data.ansverText = forecast[index].answer
        data.questionText = forecast[index].question
        data.categoryText = forecast[index].category.title
    }
    
}

