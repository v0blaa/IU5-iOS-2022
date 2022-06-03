//
//  ViperControllersPresenter.swift
//  LABS
//
//  Created by Сергей Адольевич on 03.04.2022.
//

import Foundation
import UIKit

final class ViperControllersPresenter {
    weak var output: ViperControllersPresenterOutput?
    
    private var interactor: ViperControllersInteractorInput!
    private var router: ViperControllersRouterInput?
    weak var view: ViperControllersViewInput!
    
    init(view: ViperControllersViewInput,
         interactor: ViperControllersInteractorInput,
         router: ViperControllersRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension ViperControllersPresenter: ViperControllersViewOutput {
    func giveData(viewController: ViperControllersViewController) {
        let data = interactor.getData()
        viewController.setupSwitchController(lungsIconImageData: data.curSwitch.image,
                                             lungsIconImageColorData: data.curSwitch.imageColor,
                                             smokingLabelData: data.curSwitch.title)
        viewController.setupSliderController(title: data.curSlider.title,
                                             sliderColor: data.curSlider.sliderColor)
        viewController.setupTextFieldController(title: data.curTextField.title,
                                                textFieldPlaceholder: data.curTextField.textFieldPlaceholder)
        viewController.setupSegmentPickerControl(title: data.curSegmentPicker.title,
                                                 image: data.curSegmentPicker.image,
                                                 imageColor: data.curSegmentPicker.imageColor,
                                                 segmentsTitles: data.curSegmentPicker.segmentsTitles)
    }
    
    @IBAction func switchValueChanged(lungsSwitch: UISwitch, lungsIconImage: UIImageView) {
        switch lungsSwitch.isOn{
        case true:
            lungsIconImage.tintColor = .darkGray
        case false:
            lungsIconImage.tintColor = .systemPink
        }
    }
    
    @objc func sliderValueChanged(testSlider: UISlider, colorChangingView: UIView) {
        colorChangingView.backgroundColor = UIColor(red: CGFloat(testSlider.value), green: 0, blue: 0, alpha: 0.5)
    }
    
    func textFieldShouldReturn(_ testTextField: UITextField, testTextFieldLabel: UILabel) -> Bool {
        testTextField.resignFirstResponder()
        testTextFieldLabel.text = testTextField.text
        return true
    }
    
    @objc func moodSegmentPickerValueChanged(moodSegmentPicker: UISegmentedControl,
                                             moodIconImage: UIImageView) {
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

extension ViperControllersPresenter: ViperControllersInteractorOutput {
    
}
