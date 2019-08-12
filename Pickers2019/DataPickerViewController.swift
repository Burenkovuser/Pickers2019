//
//  DataPickerViewController.swift
//  Pickers2019
//
//  Created by Vasilii on 12/08/2019.
//  Copyright © 2019 Vasilii Burenkov. All rights reserved.
//

import UIKit

class DataPickerViewController: UIViewController {

    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set current date
        let date = NSDate()
        datePicker.setDate(date as Date, animated: false)
       
    }
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        let date = datePicker.date
        let message = "The date and time you selected is \(date)"
        let alert = UIAlertController(
            title: "Date and time selected",
            message: message,
            preferredStyle: .alert)
        let action = UIAlertAction (
            title: "That's so true!",
            style: .default,
            handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
