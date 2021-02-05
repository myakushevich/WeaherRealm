//
//  RealmViewViewController.swift
//  module14task
//
//  Created by Mikhail Yakushevich on 20.01.2021.
//

import UIKit
import RealmSwift

class RealmViewViewController: UIViewController {

    public var item: ToDoListItem2?
    
    public var deletionHandler: (()-> Void)?
    
    private let realm = try! Realm()
    
    @IBOutlet var itemLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!

    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        itemLabel.text = item?.item
        dateLabel.text = Self.dateFormatter.string(from: item!.date)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapDelete))
        
    }
    
    @objc private func didTapDelete() {
        guard let myItem = self.item else {
            return
        }
        realm.beginWrite()
        realm.delete(myItem)
        
        try! realm.commitWrite()
        
        deletionHandler?()
        
        navigationController?.popToRootViewController(animated: true)
        
    }

    

}
