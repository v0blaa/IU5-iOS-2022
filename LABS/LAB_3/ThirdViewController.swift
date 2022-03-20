//
//  ThirdViewController.swift
//  Third_lab
//
//  Created by Сергей Адольевич on 18.03.2022.
//

import UIKit

class ThirdViewController: UIViewController, UITextFieldDelegate{

    //Switch
    @IBOutlet private weak var lungsSwitch: UISwitch!
    @IBOutlet private weak var lungsImage: UIImageView!
    @IBOutlet private weak var smokingLabel: UILabel!
    
    //Slider
    @IBOutlet private weak var sliderLabel: UILabel!
    @IBOutlet private weak var colorView: UIView!
    @IBOutlet private weak var testSlider: UISlider!
    
    //TextField
    @IBOutlet private weak var textFieldLabel: UILabel!
    @IBOutlet private weak var testTextField: UITextField!
    
    
    @IBOutlet private weak var segmentPickerLabel: UILabel!
    @IBOutlet private weak var testSegmentedPicker: UISegmentedControl!
    @IBOutlet private weak var humanImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createSwitch()
        self.createSlider()
        self.createTextField()
        self.cresteSegmentedPicker()
    }
    
    //SWITCH
    //создание всего необходимого для switch
    private func createSwitch() {
        lungsSwitch.isOn = false
        lungsImage.image = UIImage(systemName: "lungs")!
        lungsImage.tintColor = .systemPink
        smokingLabel.text = "Smoking"
    }
    //обработка изменения switch
    @IBAction func switchValueChanged(_ sender: Any) {
        if lungsSwitch.isOn{
            lungsImage.tintColor = .systemGray
        }else{
            lungsImage.tintColor = .systemPink
        }
    }
    
    //SLIDER
    //создание всего необходимого для slider
    private func createSlider() {
        sliderLabel.text = "Slider"
        testSlider.tintColor = .systemRed
        changeViewColor()
    }
    //функция для смены цвета colorView
    func changeViewColor(){
        colorView.backgroundColor = UIColor(red: CGFloat(testSlider.value), green: 0, blue: 0, alpha: 0.5)
    }
    //обработка изменения значения slider
    @IBAction func testSliderChanged(_ sender: Any) {
        changeViewColor()
    }
    
    //TEXTFIELD
    //создание всего необходимого для textfield
    private func createTextField() {
        textFieldLabel.text = "TextField"
//        textFieldLabel.minimumScaleFactor = 2
//        textFieldLabel.adjustsFontSizeToFitWidth = true
        testTextField.placeholder = "Write here"
        testTextField.clearButtonMode = .whileEditing
        testTextField.returnKeyType = UIReturnKeyType.done
        testTextField.delegate = self
    }
    //работа с textField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == testTextField{
            testTextField.resignFirstResponder()
            textFieldLabel.text = testTextField.text
        }
        return true
    }

    //SEGMENTEDPICKER
    //создание всего необходимого для segmentespicker
    private func cresteSegmentedPicker() {
        segmentPickerLabel.text = "Pick one segment"
        humanImage.image = UIImage(systemName: "person.fill.questionmark")
        humanImage.tintColor = .systemGray
    }
    //обработка изменения segmentedPicker
    @IBAction func testSegmentedPickerChanged(_ sender: Any) {
        switch testSegmentedPicker.selectedSegmentIndex{
        case 0:
            humanImage.image = UIImage(systemName: "person.fill.xmark")
            humanImage.tintColor = .systemRed
        case 1:
            humanImage.image = UIImage(systemName: "person.fill.questionmark")
            humanImage.tintColor = .systemGray
        case 2:
            humanImage.image = UIImage(systemName: "person.fill.checkmark")
            humanImage.tintColor = .systemGreen
        default:
            break
        }
    }
}

