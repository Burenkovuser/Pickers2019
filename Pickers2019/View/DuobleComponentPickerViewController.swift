//
//  DuobleComponentPickerViewController.swift
//  Pickers2019
//
//  Created by Vasilii on 12/08/2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import UIKit

class DuobleComponentPickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var duoblePicker: UIPickerView!
    
    private let fillingComponent = 0
    private let breadComponent = 1
    private let fillingType = [ "Ham", "Turkey", "Peanue Butter", "Tuna Salad", "Chicken Salad", "Roast Beef", "Vegimite"]
    private let breadType = ["White", "Whole Wheate", "Rye", "Sourdough", "Seven Grain"]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onButtonPressed(_ sender: Any) {
        let fillingRow = duoblePicker.selectedRow(inComponent: fillingComponent)
        let breadRow = duoblePicker.selectedRow(inComponent: breadComponent)
        
        let filling = fillingType[fillingRow]
        let bread = breadType[breadRow]
        let message = "You \(filling) on \(bread) bread will be right up"
        
        let alert = UIAlertController(
            title: "Thank you for your order",
            message: message,
            preferredStyle: .alert)
        let action = UIAlertAction(
            title: "Greste",
            style: .default,
            handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)

    }
    
    // MARK: - Picer data sours method
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == breadComponent {
            return breadType.count
        } else {
            return fillingType.count
        }
    }
    
    //MARK: - Picker Delegate Methods
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == breadComponent {
            return breadType[row]
        } else {
            return fillingType[row]
        }
    }
}
