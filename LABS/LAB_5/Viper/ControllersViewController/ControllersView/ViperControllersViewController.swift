//
//  CViperontrollersViewController.swift
//  LABS
//
//  Created by Сергей Адольевич on 03.04.2022.
//

import Foundation
import UIKit

final class ViperControllersViewController: UIViewController, UITextFieldDelegate {
    
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
    
    var output: ViperControllersViewOutput!
    
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
        
        output.giveData(viewController: self)
    }
    
    //все для Switch
    func setupSwitchController(lungsIconImageData: UIImage,
                               lungsIconImageColorData: UIColor,
                               smokingLabelData: String) {
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
        lungsIconImage.image = lungsIconImageData
        lungsIconImage.tintColor = lungsIconImageColorData
        
        
        smokingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            smokingLabel.centerXAnchor.constraint(equalTo: lungsIconImage.centerXAnchor),
            smokingLabel.widthAnchor.constraint(equalToConstant: Constants.Label.width),
            smokingLabel.topAnchor.constraint(equalTo: lungsIconImage.bottomAnchor,
                                              constant: Constants.DistanceBetweenViews.short),
            smokingLabel.heightAnchor.constraint(equalToConstant: Constants.Label.height)
        ])
        smokingLabel.text = smokingLabelData
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
    @objc func switchValueChanged() {
        output.switchValueChanged(lungsSwitch: lungsSwitch, lungsIconImage: lungsIconImage)
    }
    
    //все для Slider
    func setupSliderController(title: String, sliderColor: UIColor) {
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
        testSliderLabel.text = title
        
        
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
        testSlider.tintColor = sliderColor
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
    @objc func sliderValueChanged() {
        output.sliderValueChanged(testSlider: testSlider, colorChangingView: colorChangingView)
    }
    
    //все для TextField
    func setupTextFieldController(title: String, textFieldPlaceholder: String) {
        view.addSubview(testTextFieldLabel)
        view.addSubview(testTextField)
        
        
        testTextFieldLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            testTextFieldLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant:
                                                        Constants.DistanceBetweenViews.long),
            testTextFieldLabel.widthAnchor.constraint(equalToConstant: Constants.Label.width),
            testTextFieldLabel.heightAnchor.constraint(equalToConstant: Constants.Label.height)
        ])
        testTextFieldLabel.text = title
        
        
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
        testTextField.placeholder = textFieldPlaceholder
        testTextField.borderStyle = UITextField.BorderStyle.roundedRect
        testTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        testTextField.returnKeyType = UIReturnKeyType.done
        testTextField.delegate = self
    }
    //обработка окончания ввода в TextField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        output.textFieldShouldReturn(testTextField,
                                     testTextFieldLabel: testTextFieldLabel)
    }
    
    //все для SegmentPicker
    func setupSegmentPickerControl(title: String, image: UIImage,
                                           imageColor: UIColor, segmentsTitles: [String]) {
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
        moodSegmentPickerLabel.text = title
        moodSegmentPickerLabel.textAlignment = .center

        
        moodSegmentPicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            moodSegmentPicker.centerXAnchor.constraint(equalTo: moodSegmentPickerLabel.centerXAnchor),
            moodSegmentPicker.widthAnchor.constraint(equalToConstant: Constants.SegmentPicker.width),
            moodSegmentPicker.topAnchor.constraint(equalTo: moodSegmentPickerLabel.bottomAnchor,
                                                   constant: Constants.DistanceBetweenViews.short),
            moodSegmentPicker.heightAnchor.constraint(equalToConstant: Constants.SegmentPicker.height)
        ])
        for index in 0...segmentsTitles.count - 1{
            moodSegmentPicker.insertSegment(with: nil, at: index, animated: true)
            moodSegmentPicker.setTitle(segmentsTitles[index], forSegmentAt: index)
        }
        moodSegmentPicker.addTarget(self, action: #selector(self.moodSegmentPickerValueChanged), for: .valueChanged)
        
        
        moodIconImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            moodIconImage.centerXAnchor.constraint(equalTo: moodSegmentPickerLabel.centerXAnchor),
            moodIconImage.widthAnchor.constraint(equalToConstant: Constants.Image.width),
            moodIconImage.topAnchor.constraint(equalTo: moodSegmentPicker.bottomAnchor,
                                               constant: Constants.DistanceBetweenViews.long),
            moodIconImage.heightAnchor.constraint(equalToConstant: Constants.Image.height)
        ])
        moodIconImage.image = image
        moodIconImage.tintColor = imageColor
    }
    
    //обработка изменения значения SegmentPicker
    @objc func moodSegmentPickerValueChanged() {
        output.moodSegmentPickerValueChanged(moodSegmentPicker: moodSegmentPicker,
                                             moodIconImage: moodIconImage)
    }
}

extension ViperControllersViewController: ViperControllersViewInput {
    
}
