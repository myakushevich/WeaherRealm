//
//  UserDefaultsViewController.swift
//  module14task
//
//  Created by Mikhail Yakushevich on 13.01.2021.
//

import UIKit

class UserDefaultsViewController: UIViewController {

    
    @IBOutlet weak var lastNameText: UITextField!
    
    
    @IBOutlet weak var firstNameText: UITextField!
    
    

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lastNameText.delegate = self
        firstNameText.delegate = self
        
        firstNameText.text = Persistance.shared.firstName
        lastNameText.text = Persistance.shared.lastName

    
        
    }
    
   
    

}


extension UserDefaultsViewController: UITextFieldDelegate {
   
//  Просто сделал два метода (разобрался что где):
//    1ый делает "set" в lasName и firstName по нажатии "return" на
//    клавиатуре устройства, второй метод делает "set" в lasName и
//    firstName сразу после запвершения редактирования поля textfield
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        Persistance.shared.lastName = lastNameText.text
        
        Persistance.shared.firstName = firstNameText.text
        
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        Persistance.shared.lastName = lastNameText.text
        
        Persistance.shared.firstName = firstNameText.text
        
        return true
    }
    
}
