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
    private let longDistanceBetweenViews: CGFloat = 30
    private let shortDistanceBetweenViews: CGFloat = 10
    private let imageHeight: CGFloat = 90
    private let imageWidth: CGFloat = 110
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            lungsIconImage.widthAnchor.constraint(equalToConstant: imageWidth),
            lungsIconImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                                constant: longDistanceBetweenViews),
            lungsIconImage.heightAnchor.constraint(equalToConstant: imageHeight)
        ])
        lungsIconImage.image = UIImage(systemName: "lungs")
        lungsIconImage.tintColor = .systemPink
        
        
        let labelHeight: CGFloat = 20
        let labelWidth: CGFloat = 100
        smokingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            smokingLabel.centerXAnchor.constraint(equalTo: lungsIconImage.centerXAnchor),
            smokingLabel.widthAnchor.constraint(equalToConstant: labelWidth),
            smokingLabel.topAnchor.constraint(equalTo: lungsIconImage.bottomAnchor,
                                             constant: shortDistanceBetweenViews),
            smokingLabel.heightAnchor.constraint(equalToConstant: labelHeight)
        ])
        smokingLabel.text = "Smoking"
        smokingLabel.textAlignment = .center
        
        
        lungsSwitch.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lungsSwitch.centerXAnchor.constraint(equalTo: lungsIconImage.centerXAnchor),
            lungsSwitch.widthAnchor.constraint(equalToConstant: 50),
            lungsSwitch.topAnchor.constraint(equalTo: smokingLabel.bottomAnchor,
                                             constant: shortDistanceBetweenViews),
            lungsSwitch.heightAnchor.constraint(equalToConstant: 40)
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
                                                  constant: longDistanceBetweenViews),
            testSliderLabel.widthAnchor.constraint(equalToConstant: 100),
            testSliderLabel.topAnchor.constraint(equalTo: lungsSwitch.bottomAnchor, constant: longDistanceBetweenViews),
            testSliderLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        testSliderLabel.text = "Slider"
        
        
        testSlider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            testSlider.leftAnchor.constraint(equalTo: testSliderLabel.rightAnchor,
                                                  constant: longDistanceBetweenViews),
            testSlider.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -longDistanceBetweenViews),
            testSlider.topAnchor.constraint(equalTo: testSliderLabel.topAnchor),
            testSlider.heightAnchor.constraint(equalToConstant: 20)
        ])
        testSlider.value = 0.5
        testSlider.tintColor = .systemRed
        testSlider.addTarget(self, action: #selector(self.sliderValueChanged), for: .valueChanged)
        
        
        colorChangingView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            colorChangingView.leftAnchor.constraint(equalTo: testSliderLabel.leftAnchor),
            colorChangingView.rightAnchor.constraint(equalTo: testSlider.rightAnchor),
            colorChangingView.topAnchor.constraint(equalTo: testSlider.bottomAnchor,
                                                   constant: shortDistanceBetweenViews),
            colorChangingView.heightAnchor.constraint(equalToConstant: 20)
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
            testTextFieldLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: longDistanceBetweenViews),
            testTextFieldLabel.widthAnchor.constraint(equalToConstant: 100),
            testTextFieldLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        testTextFieldLabel.text = "Textfield"
        
        
        testTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            testTextField.leftAnchor.constraint(equalTo: testTextFieldLabel.rightAnchor,
                                                constant: shortDistanceBetweenViews),
            testTextField.rightAnchor.constraint(equalTo: colorChangingView.rightAnchor),
            testTextField.topAnchor.constraint(equalTo: colorChangingView.bottomAnchor,
                                                constant: 50),
            testTextField.heightAnchor.constraint(equalToConstant: 30),
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
            moodSegmentPickerLabel.widthAnchor.constraint(equalToConstant: 200),
            moodSegmentPickerLabel.topAnchor.constraint(equalTo: testTextFieldLabel.bottomAnchor,
                                                constant: 50),
            moodSegmentPickerLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        moodSegmentPickerLabel.text = "Pick one sigment"
        moodSegmentPickerLabel.textAlignment = .center

        
        moodSegmentPicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            moodSegmentPicker.centerXAnchor.constraint(equalTo: moodSegmentPickerLabel.centerXAnchor),
            moodSegmentPicker.widthAnchor.constraint(equalToConstant: 200),
            moodSegmentPicker.topAnchor.constraint(equalTo: moodSegmentPickerLabel.bottomAnchor,
                                                   constant: shortDistanceBetweenViews),
            moodSegmentPicker.heightAnchor.constraint(equalToConstant: 30)
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
            moodIconImage.widthAnchor.constraint(equalToConstant: imageWidth),
            moodIconImage.topAnchor.constraint(equalTo: moodSegmentPicker.bottomAnchor,
                                                constant: longDistanceBetweenViews),
            moodIconImage.heightAnchor.constraint(equalToConstant: imageHeight)
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

