//
//  CustomPickerViewController.swift
//  Pickers2019
//
//  Created by Vasilii on 12/08/2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import UIKit
import AudioToolbox

class CustomPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    private var winSound: SystemSoundID = 0
    private var crunchSoundID: SystemSoundID = 0
    
    private var images:[UIImage]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        images = [
            UIImage(named: "seven")!,
            UIImage(named: "bar")!,
            UIImage(named: "crown")!,
            UIImage(named: "cherry")!,
            UIImage(named: "lemon")!,
            UIImage(named: "apple")!
        ]
        winLabel.text = " "

    }
 
    @IBAction func spin(_ sender: UIButton) {
        var win = false
        var numInRow = 1
        var lastVal = -1
        
        for i in 0..<5 {
            let newValue = Int(arc4random_uniform(UInt32(images.count)))
            if newValue == lastVal {
                numInRow += 1
            } else {
                numInRow = 1
            }
            lastVal = newValue
            
            picker.selectRow(newValue, inComponent: i, animated: true)
            picker.reloadComponent(i)
            if numInRow >= 3 {
                win = true
            }
            winLabel.text = win ? "WINNER!" : " "
        }
    }
    
    // MARK: - Picer data sours methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 5
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return images.count
    }
    
    // MARK: - Picker delegate methods
    func pickerView(_ pickerView: UIPickerView,
                             viewForRow row: Int,
                             forComponent component: Int,
                             reusing view: UIView?) -> UIView {
        let image = images[row]
        let imageView = UIImageView(image: image)
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 64
    }
}
