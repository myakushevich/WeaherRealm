//
//  RealmEntryViewController.swift
//  module14task
//
//  Created by Mikhail Yakushevich on 20.01.2021.
//
import RealmSwift
import UIKit

class RealmEntryViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var textField: UITextField!
    
    @IBOutlet var datePicker: UIDatePicker!
    
    private let realm = try! Realm()
    
    public var completionHandler: (()-> Void)?
    
    
    @objc func didTapSaveButton(){
        
        if let text = textField.text, !text.isEmpty {
            let date = datePicker.date
            
            realm.beginWrite()
            
            let newItem = ToDoListItem2()
            newItem.date = date
            newItem.item = text
            newItem.doneOrNotDone = false
            realm.add(newItem)
            try! realm.commitWrite()
            
            completionHandler?()
            navigationController?.popToRootViewController(animated: true)
            
        }
        else {
            print("add something")
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSaveButton))

        textField.becomeFirstResponder()
        textField.delegate = self
        datePicker.setDate(Date(), animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }

}
