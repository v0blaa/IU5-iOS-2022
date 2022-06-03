//
//  ViperControllersInteractor.swift
//  LABS
//
//  Created by Сергей Адольевич on 04.04.2022.
//

import Foundation
import UIKit

final class ViperControllersInteractor {
    weak var output: ViperControllersInteractorOutput!
}

extension ViperControllersInteractor: ViperControllersInteractorInput {
    func getData() -> ControllersData {
        let data = ControllersData(
            curSwitch: ControllersData.Switch(
                image: UIImage(systemName: "lungs")!,
                imageColor: .systemPink,
                title: "Smoking"),
            curSlider: ControllersData.Slider(
                sliderColor: .systemRed,
                title: "Slider"
            ),
            curTextField: ControllersData.TextField(
                title: "TextField",
                textFieldPlaceholder: "Write something here"
                
            ),
            curSegmentPicker: ControllersData.SegmentPicker(
                title: "Pick one segment",
                image: UIImage(systemName: "person.fill.questionmark")!,
                imageColor: .systemGray,
                segmentsTitles: ["No","IDK","Yes"])
            )
            
        return data
    }
}
