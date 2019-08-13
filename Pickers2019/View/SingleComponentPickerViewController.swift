//
//  SingleComponentPickerViewController.swift
//  Pickers2019
//
//  Created by Vasilii on 12/08/2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import UIKit

class SingleComponentPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var singlePicker: UIPickerView!
    
    private let charackterNames = ["Luke", "Leia", "Han", "Chewbacca", "Artoo", "Threepio", "Lando"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onButtonPressed(_ sender: Any) {
        let row = singlePicker.selectedRow(inComponent: 0)//выбираем из какого компонента получить информацию
        let selected = charackterNames[row]
        let title = "You selected \(selected)"
        
        let alert = UIAlertController(
            title: title,
            message: "Thank you for your choosing",
            preferredStyle: .alert)
        let action = UIAlertAction(
            title: "You're welcom",
            style: .default,
            handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Picker Data Source Methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return charackterNames.count
    }
    
    // MARK: - Picker Delegate Methods
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return charackterNames[row] //предоставляем данные для строк компонента
    }


}
