//
//  GameViewController.swift
//  LABS
//
//  Created by Сергей Адольевич on 09.04.2022.
//

import Foundation
import UIKit
import QuartzCore

final class GameViewController: UIViewController {
    
    private let themeTitleLabel = UILabel()
    private let questionLabel = UILabel()
    private let answerTextField = UITextField()
    private let answerButton = UIButton()
    private let correctAnswerLabel = UILabel()
    private let nextQuestionButton = UIButton()
    
    private enum Constants {
        enum Distances {
            static let long: CGFloat = 50
            static let short: CGFloat = 30
        }
        enum ThemeTitleLabel {
            static let fontSize: CGFloat = 30
            static let width: CGFloat = 300
        }
        enum QuestionLabel {
            static let centerYConstant: CGFloat = -50
            static let width: CGFloat = 300
            
            static let fontSize: CGFloat = 24
        }
        enum AnswerTextField {
            static let height: CGFloat = 40
        }
        enum AnswerButton {
            static let width: CGFloat = 100
            static let height: CGFloat = AnswerTextField.height
        }
        enum CorrectAnswerLabel {
            static let height: CGFloat = 15
            static let fontSize: CGFloat = 12
        }
        enum NextQuestionButton {
            static let width: CGFloat = 200
            static let height: CGFloat = AnswerButton.height
        }
    }
    
    var output: GameViewOutput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        output.setGameData(viewController: self)
    }
    
    func addSubviews() {
        view.addSubview(questionLabel)
        view.addSubview(themeTitleLabel)
        view.addSubview(answerTextField)
        view.addSubview(answerButton)
        view.addSubview(correctAnswerLabel)
        view.addSubview(nextQuestionButton)
    }
    
    func setupConstraints() {
        //вопрос
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            questionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            questionLabel.widthAnchor.constraint(equalToConstant: Constants.QuestionLabel.width),
            questionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor,
                                                   constant: Constants.QuestionLabel.centerYConstant)
            ])
        
        //название темы
        themeTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            themeTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            themeTitleLabel.widthAnchor.constraint(equalToConstant: Constants.ThemeTitleLabel.width),
            themeTitleLabel.bottomAnchor.constraint(equalTo: questionLabel.topAnchor,
                                                    constant: -Constants.Distances.short)
            ])
        
        //поле ввода ответа
        answerTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            answerTextField.leftAnchor.constraint(equalTo: view.leftAnchor,
                                                  constant: Constants.Distances.long),
            answerTextField.rightAnchor.constraint(equalTo: view.rightAnchor,
                                                   constant: -(Constants.Distances.short + Constants.AnswerButton.width + Constants.Distances.long)),
            answerTextField.topAnchor.constraint(equalTo: questionLabel.bottomAnchor,
                                                 constant: Constants.Distances.long),
            answerTextField.heightAnchor.constraint(equalToConstant: Constants.AnswerTextField.height)
            ])
        
        //кнопка ответа
        answerButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            answerButton.leftAnchor.constraint(equalTo: answerTextField.rightAnchor,
                                               constant: Constants.Distances.short),
            answerButton.widthAnchor.constraint(equalToConstant: Constants.AnswerButton.width),
            answerButton.centerYAnchor.constraint(equalTo: answerTextField.centerYAnchor),
            answerButton.heightAnchor.constraint(equalToConstant: Constants.AnswerButton.height)
            ])
        
        //правильный ответ
        correctAnswerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            correctAnswerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            correctAnswerLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
            correctAnswerLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            correctAnswerLabel.heightAnchor.constraint(equalToConstant: Constants.CorrectAnswerLabel.height)
            ])
        
        //кнопка перехода к следующему вопросу
        nextQuestionButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextQuestionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextQuestionButton.widthAnchor.constraint(equalToConstant: Constants.NextQuestionButton.width),
            nextQuestionButton.topAnchor.constraint(equalTo: answerTextField.bottomAnchor,
                                                       constant: Constants.Distances.long),
            nextQuestionButton.heightAnchor.constraint(equalToConstant: Constants.NextQuestionButton.height)
            ])
    }
    
    //название категории вопроса
    func setupCategoryTitle(categoryTitleText: String) {
    
        themeTitleLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        themeTitleLabel.numberOfLines = 0
        themeTitleLabel.textAlignment = .center
        themeTitleLabel.font = .boldSystemFont(ofSize: Constants.ThemeTitleLabel.fontSize)
        themeTitleLabel.text = categoryTitleText
    }
    
    //сам вопрос
    func setupQuestionLabel(questionLabelText: String) {
        
        questionLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        questionLabel.numberOfLines = 0
        questionLabel.textAlignment = .center
        questionLabel.font = .italicSystemFont(ofSize: Constants.QuestionLabel.fontSize)
        questionLabel.text = questionLabelText
    }
    
    //поле для ввода ответа
    func setupTextfield(textfieldPlaceholder: String) {

        answerTextField.placeholder = textfieldPlaceholder
        answerTextField.borderStyle = UITextField.BorderStyle.roundedRect
        answerTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        answerTextField.returnKeyType = UIReturnKeyType.done
        answerTextField.delegate = self
        answerTextField.autocorrectionType = .no
        
    }
    
    //кнопка для отправки ответа
    func setupAnswerButton(answerButtonText: String) {
        
        answerButton.layer.cornerRadius = 10
        answerButton.backgroundColor = .systemBlue
        answerButton.setTitle(answerButtonText, for: .normal)
        answerButton.setTitleColor(.white, for: .normal)
        answerButton.addTarget(self, action: #selector(answerButtonClicked), for: .touchUpInside)
    }
    
    //правильный ответ (отображается внизу экрана)
    func setupCorrectAnswerLabel(correctAnswerLabelText: String) {
       
        correctAnswerLabel.text = correctAnswerLabelText
        correctAnswerLabel.textAlignment = .center
        correctAnswerLabel.textColor = .systemGray2
        correctAnswerLabel.font = correctAnswerLabel.font.withSize(Constants.CorrectAnswerLabel.fontSize)
    }
    
    //кнопка перехода к следующему вопросу
    func setuoNextQuestionButton(nextQuestionButtonText: String) {
        
        nextQuestionButton.layer.cornerRadius = 10
        nextQuestionButton.backgroundColor = .systemGray
        nextQuestionButton.setTitle(nextQuestionButtonText, for: .normal)
        nextQuestionButton.setTitleColor(.white, for: .normal)
        nextQuestionButton.addTarget(self, action: #selector(nextQuestionButtonClicked), for: .touchUpInside)
    }
    
    //функции для обработки событий
    @objc func answerButtonClicked() {
        answerTextField.backgroundColor = output.checkAnswer(userAnswer: answerTextField.text)
    }
    @objc func nextQuestionButtonClicked() {
        output.reloadData(viewController: self)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        answerTextField.backgroundColor = output.checkAnswer(userAnswer: answerTextField.text)
        return true
    }
    
    //очистка textfield для нового вопроса
    func clearAnswerTextField() {
        print("clear")
        answerTextField.text = ""
        answerTextField.backgroundColor = .systemBackground
    }
}
extension GameViewController: UITextFieldDelegate {
    
}

extension GameViewController: GameViewInput {
    func reloadData() {
        output.reloadData(viewController: self)
    }
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
}
