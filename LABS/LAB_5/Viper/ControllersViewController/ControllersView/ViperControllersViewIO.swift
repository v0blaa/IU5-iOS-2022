//
//  ViperControllersViewIO.swift
//  LABS
//
//  Created by Сергей Адольевич on 03.04.2022.
//

import Foundation
import UIKit

protocol ViperControllersViewInput: AnyObject {
    
}

protocol ViperControllersViewOutput: AnyObject {
    func giveData(viewController: ViperControllersViewController)
    func switchValueChanged(lungsSwitch: UISwitch, lungsIconImage: UIImageView)
    func sliderValueChanged(testSlider: UISlider, colorChangingView: UIView)
    func textFieldShouldReturn(_ testTextField: UITextField, testTextFieldLabel: UILabel) -> Bool
    func moodSegmentPickerValueChanged(moodSegmentPicker: UISegmentedControl,
                                       moodIconImage: UIImageView)
}
