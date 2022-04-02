//
//  ControllersViewController.swift
//  LABS
//
//  Created by Сергей Адольевич on 24.03.2022.
//

import Foundation
import UIKit

final class ControllersViewController: UIViewController, UITextFieldDelegate{
    
    //SWITCH
    private let lungsIconImage = UIImageView()
    private let lungsSwitch = UISwitch()
    private let smokingLabel = UILabel()
    
    //SLIDER
    private let testSlider = UISlider()
    private let colorChangingView = UIView()
    private let testSliderLabel = UILabel()
    
    //TEXTFIELD
    private let testTextField = UITextField()
    private let testTextFieldLabel = UILabel()
    
    //SEGMENTPICKER
    private let moodSegmentPickerLabel = UILabel()
    private let moodSegmentPicker = UISegmentedControl()
    private let moodIconImage = UIImageView()
    
    //Общие константы для constraint
    private enum Constants {
        enum DistanceBetweenViews{
            static let long: CGFloat = 30
            static let short: CGFloat = 10
        }
        enum Image{
            static let height: CGFloat = 90
            static let width: CGFloat = 110
        }
        enum Label{
            static let width: CGFloat = 100
            static let height: CGFloat = 20
        }
        enum Switch{
            static let width: CGFloat = 50
            static let height: CGFloat = 40
        }
        enum Slider{
            static let height: CGFloat = 20
        }
        enum ColorView{
            static let height: CGFloat = 20
        }
        enum TextField{
            static let height: CGFloat = 30
        }
        enum SegmentPicker{
            static let width: CGFloat = 200
            static let height: CGFloat = 30
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        print(UIScreen.main.bounds)
        
        setupSwitchController()
        setupSliderController()
        setupTextFieldController()
        setupSegmentPickerControl()
    }
    
    //все для Switch
    private func setupSwitchController() {
        view.addSubview(lungsIconImage)
        view.addSubview(smokingLabel)
        view.addSubview(lungsSwitch)
        
        
        lungsIconImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lungsIconImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lungsIconImage.widthAnchor.constraint(equalToConstant: Constants.Image.width),
            lungsIconImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                                constant: Constants.DistanceBetweenViews.long),
            lungsIconImage.heightAnchor.constraint(equalToConstant: Constants.Image.height)
        ])
        lungsIconImage.image = UIImage(systemName: "lungs")
        lungsIconImage.tintColor = .systemPink
        
        
        smokingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            smokingLabel.centerXAnchor.constraint(equalTo: lungsIconImage.centerXAnchor),
            smokingLabel.widthAnchor.constraint(equalToConstant: Constants.Label.width),
            smokingLabel.topAnchor.constraint(equalTo: lungsIconImage.bottomAnchor,
                                              constant: Constants.DistanceBetweenViews.short),
            smokingLabel.heightAnchor.constraint(equalToConstant: Constants.Label.height)
        ])
        smokingLabel.text = "Smoking"
        smokingLabel.textAlignment = .center
        
        
        lungsSwitch.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lungsSwitch.centerXAnchor.constraint(equalTo: lungsIconImage.centerXAnchor),
            lungsSwitch.widthAnchor.constraint(equalToConstant: Constants.Switch.width),
            lungsSwitch.topAnchor.constraint(equalTo: smokingLabel.bottomAnchor,
                                             constant: Constants.DistanceBetweenViews.short),
            lungsSwitch.heightAnchor.constraint(equalToConstant: Constants.Switch.width)
        ])
        lungsSwitch.addTarget(self, action: #selector(self.switchValueChanged), for: .valueChanged)
    }
    //обработка изменения значения Switch
    @objc func switchValueChanged(sender:UISwitch!) {
        switch lungsSwitch.isOn{
        case true:
            lungsIconImage.tintColor = .darkGray
        case false:
            lungsIconImage.tintColor = .systemPink
        }
    }
    
    //все для Slider
    private func setupSliderController() {
        view.addSubview(testSliderLabel)
        view.addSubview(testSlider)
        view.addSubview(colorChangingView)
        
        
        testSliderLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            testSliderLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor,
                                                  constant: Constants.DistanceBetweenViews.long),
            testSliderLabel.widthAnchor.constraint(equalToConstant: Constants.Label.width),
            testSliderLabel.topAnchor.constraint(equalTo: lungsSwitch.bottomAnchor, constant:
                                                    Constants.DistanceBetweenViews.long),
            testSliderLabel.heightAnchor.constraint(equalToConstant: Constants.Label.height)
        ])
        testSliderLabel.text = "Slider"
        
        
        testSlider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            testSlider.leftAnchor.constraint(equalTo: testSliderLabel.rightAnchor,
                                             constant: Constants.DistanceBetweenViews.long),
            testSlider.rightAnchor.constraint(equalTo: view.rightAnchor, constant:
                                                -Constants.DistanceBetweenViews.long),
            testSlider.topAnchor.constraint(equalTo: testSliderLabel.topAnchor),
            testSlider.heightAnchor.constraint(equalToConstant: Constants.Slider.height)
        ])
        testSlider.value = 0.5
        testSlider.tintColor = .systemRed
        testSlider.addTarget(self, action: #selector(self.sliderValueChanged), for: .valueChanged)
        
        
        colorChangingView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            colorChangingView.leftAnchor.constraint(equalTo: testSliderLabel.leftAnchor),
            colorChangingView.rightAnchor.constraint(equalTo: testSlider.rightAnchor),
            colorChangingView.topAnchor.constraint(equalTo: testSlider.bottomAnchor,
                                                   constant: Constants.DistanceBetweenViews.short),
            colorChangingView.heightAnchor.constraint(equalToConstant: Constants.ColorView.height)
        ])
        colorChangingView.backgroundColor = UIColor(red: CGFloat(testSlider.value), green: 0, blue: 0, alpha: 0.5)
    }
    //обработка изменения значения  Slider
    @objc func sliderValueChanged(sender: UISlider) {
        colorChangingView.backgroundColor = UIColor(red: CGFloat(testSlider.value), green: 0, blue: 0, alpha: 0.5)
    }
    
    //все для TextField
    private func setupTextFieldController() {
        view.addSubview(testTextFieldLabel)
        view.addSubview(testTextField)
        
        
        testTextFieldLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            testTextFieldLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant:
                                                        Constants.DistanceBetweenViews.long),
            testTextFieldLabel.widthAnchor.constraint(equalToConstant: Constants.Label.width),
            testTextFieldLabel.heightAnchor.constraint(equalToConstant: Constants.Label.height)
        ])
        testTextFieldLabel.text = "Textfield"
        
        
        testTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            testTextField.leftAnchor.constraint(equalTo: testTextFieldLabel.rightAnchor,
                                                constant: Constants.DistanceBetweenViews.short),
            testTextField.rightAnchor.constraint(equalTo: colorChangingView.rightAnchor),
            testTextField.topAnchor.constraint(equalTo: colorChangingView.bottomAnchor,
                                               constant: Constants.DistanceBetweenViews.long * 2),
            testTextField.heightAnchor.constraint(equalToConstant: Constants.TextField.height),
            testTextFieldLabel.centerYAnchor.constraint(equalTo: testTextField.centerYAnchor)
        ])
        testTextField.placeholder = "Write something here"
        testTextField.borderStyle = UITextField.BorderStyle.roundedRect
        testTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        testTextField.returnKeyType = UIReturnKeyType.done
        testTextField.delegate = self
    }
    //обработка окончания ввода в TextField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == testTextField{
            testTextField.resignFirstResponder()
            testTextFieldLabel.text = testTextField.text
        }
        return true
    }
    
    //все для SegmentPicker
    private func setupSegmentPickerControl() {
        view.addSubview(moodSegmentPickerLabel)
        view.addSubview(moodSegmentPicker)
        view.addSubview(moodIconImage)
        
        
        moodSegmentPickerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            moodSegmentPickerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            moodSegmentPickerLabel.widthAnchor.constraint(equalToConstant: Constants.Label.width * 2),
            moodSegmentPickerLabel.topAnchor.constraint(equalTo: testTextFieldLabel.bottomAnchor,
                                                constant: Constants.DistanceBetweenViews.long * 2),
            moodSegmentPickerLabel.heightAnchor.constraint(equalToConstant: Constants.Label.height)
        ])
        moodSegmentPickerLabel.text = "Pick one segment"
        moodSegmentPickerLabel.textAlignment = .center

        
        moodSegmentPicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            moodSegmentPicker.centerXAnchor.constraint(equalTo: moodSegmentPickerLabel.centerXAnchor),
            moodSegmentPicker.widthAnchor.constraint(equalToConstant: Constants.SegmentPicker.width),
            moodSegmentPicker.topAnchor.constraint(equalTo: moodSegmentPickerLabel.bottomAnchor,
                                                   constant: Constants.DistanceBetweenViews.short),
            moodSegmentPicker.heightAnchor.constraint(equalToConstant: Constants.SegmentPicker.height)
        ])
        moodSegmentPicker.insertSegment(with: nil, at: 0, animated: true)
        moodSegmentPicker.setTitle("No", forSegmentAt: 0)
        moodSegmentPicker.insertSegment(with: nil, at: 1, animated: true)
        moodSegmentPicker.setTitle("IDK", forSegmentAt: 1)
        moodSegmentPicker.insertSegment(with: nil, at: 2, animated: true)
        moodSegmentPicker.setTitle("Yes", forSegmentAt: 2)
        moodSegmentPicker.addTarget(self, action: #selector(self.moodSegmentPickerValueChanged), for: .valueChanged)
        
        
        moodIconImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            moodIconImage.centerXAnchor.constraint(equalTo: moodSegmentPickerLabel.centerXAnchor),
            moodIconImage.widthAnchor.constraint(equalToConstant: Constants.Image.width),
            moodIconImage.topAnchor.constraint(equalTo: moodSegmentPicker.bottomAnchor,
                                               constant: Constants.DistanceBetweenViews.long),
            moodIconImage.heightAnchor.constraint(equalToConstant: Constants.Image.height)
        ])
        moodIconImage.image = UIImage(systemName: "person.fill.questionmark")
        moodIconImage.tintColor = .systemGray
    }
    
    //обработка изменения значения SegmentPicker
    @objc func moodSegmentPickerValueChanged(sender: UISegmentedControl) {
        switch moodSegmentPicker.selectedSegmentIndex{
        case 0:
            moodIconImage.image = UIImage(systemName: "person.fill.xmark")
            moodIconImage.tintColor = .systemRed
        case 1:
            moodIconImage.image = UIImage(systemName: "person.fill.questionmark")
            moodIconImage.tintColor = .systemGray
        case 2:
            moodIconImage.image = UIImage(systemName: "person.fill.checkmark")
            moodIconImage.tintColor = .systemGreen
        default:
            break
        }
    }
}

