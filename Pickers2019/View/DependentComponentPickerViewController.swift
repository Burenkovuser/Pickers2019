//
//  DependentComponentPickerViewController.swift
//  Pickers2019
//
//  Created by Vasilii on 12/08/2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import UIKit

class DependentComponentPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var dependetPicker: UIPickerView!
    
    
    private let stateComponent = 0
    private let zipComponent = 1
    private var stateZips: [String : [String]]! = nil
    private var states: [String]!
    private var zips: [String]!

    override func viewDidLoad() {
        super.viewDidLoad()

        let bundle = Bundle.main//ссылка на пакет Bundle или папку
        let plistURL = bundle.url(forResource: "statedictionary", withExtension: "plist")
        stateZips = NSDictionary.init(contentsOf: (plistURL)!) as! [String : [String]]
        let allState = stateZips.keys
        states = allState.sorted()
        let selectedState = states[0]
        zips = stateZips[selectedState]
    }

    @IBAction func onButtonPressed(_ sender: UIButton) {
        let stateRow = dependetPicker.selectedRow(inComponent: stateComponent)
        let zipRow = dependetPicker.selectedRow(inComponent: zipComponent)
        
        let state = states[stateRow]
        let zip = zips[zipRow]
        
        let title = "You selected zip code \(zip)"
        let message = "\(zip) is in \(state)"
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        let action = UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Picker Data Source Methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == stateComponent {
            return states.count
        } else {
            return zips.count
        }
    }
    
    // MARK: - Picker Delegate Methods
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == stateComponent {
            return states[row]
        } else {
            return zips[row]
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == stateComponent {
            let selectedState = states[row]
            zips = stateZips[selectedState]
            dependetPicker.reloadComponent(zipComponent)
            dependetPicker.selectRow(0, inComponent: zipComponent, animated: true)
        }
    }
    
    //resize sections
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        let pickerWith = pickerView.bounds.size.width
        if component == zipComponent {
            return pickerWith / 3
        } else {
            return  2 * pickerWith / 3
        }
    }
}

