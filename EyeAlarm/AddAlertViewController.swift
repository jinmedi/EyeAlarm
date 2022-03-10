//
//  AddAlertViewController.swift
//  EyeAlarm
//
//  Created by 김종엽 on 2022/03/03.
//

import Foundation
import UIKit

class AddAlertViewController : UIViewController {
    var pickedDate : ((_ date: Date) -> Void)?
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func dismissButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        pickedDate?(datePicker.date)
        self.dismiss(animated: true, completion: nil)
        
    }
}
