//
//  ViperControllersEntity.swift
//  LABS
//
//  Created by Сергей Адольевич on 05.04.2022.
//

import Foundation
import UIKit

//почему-то ощущение, что ControllersData выглядит кривовато
struct ControllersData{
    struct Switch {
        var image: UIImage
        var imageColor: UIColor
        var title: String

        init(image: UIImage, imageColor: UIColor, title: String) {
            self.image = image
            self.imageColor = imageColor
            self.title = title
        }
    }
    struct Slider {
        var sliderColor: UIColor
        var title: String
        
        init(sliderColor: UIColor, title: String) {
            self.sliderColor = sliderColor
            self.title = title
        }
    }
    struct TextField {
        var title: String
        var textFieldPlaceholder: String
        
        init(title: String, textFieldPlaceholder: String) {
            self.title = title
            self.textFieldPlaceholder = textFieldPlaceholder
        }
    }
    struct SegmentPicker {
        var title: String
        var image: UIImage
        var imageColor: UIColor
        var segmentsTitles: [String]
        
        init(title: String, image: UIImage, imageColor: UIColor, segmentsTitles: [String]) {
            self.image = image
            self.imageColor = imageColor
            self.title = title
            self.segmentsTitles = segmentsTitles
        }
    }
    
    var curSwitch: Switch
    var curSlider: Slider
    var curTextField: TextField
    var curSegmentPicker: SegmentPicker
    
    init(curSwitch: ControllersData.Switch,
         curSlider: ControllersData.Slider,
         curTextField: ControllersData.TextField,
         curSegmentPicker: ControllersData.SegmentPicker) {
        
        self.curSwitch = curSwitch
        self.curSlider = curSlider
        self.curTextField = curTextField
        self.curSegmentPicker = curSegmentPicker
    }
}
