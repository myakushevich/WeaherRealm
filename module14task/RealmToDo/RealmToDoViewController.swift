//
//  RealmToDoViewController.swift
//  module14task
//
//  Created by Mikhail Yakushevich on 20.01.2021.
//

import UIKit
import RealmSwift



class ToDoListItem2: Object{
    
    @objc dynamic var item = ""
    @objc dynamic var date: Date = Date()
    @objc dynamic var doneOrNotDone: Bool = false
    
}

class RealmToDoViewController: UIViewController {
    
    private let realm = try! Realm()
    
    private var data = [ToDoListItem2]()
    
    @IBOutlet var table: UITableView!
    
    public var completionHandler: (()-> Void)?
 
    
    @IBAction func didTapAddButton(){
        guard let vc = storyboard?.instantiateViewController(identifier: "enter") as? RealmEntryViewController else {
            return
        }
        vc.completionHandler = {[weak self] in
            self?.refresh()
        }
        vc.title = "New Task"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        data = realm.objects(ToDoListItem2.self).map({ $0 })
        table.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        table.delegate = self
        table.dataSource = self

        
    }
    
    func refresh() {
        data = realm.objects(ToDoListItem2.self).map({ $0 })
        table.reloadData()
        
    }
    

}


extension RealmToDoViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].item
        
        
        
        let currentItem = data[indexPath.row]
        
       if (currentItem.doneOrNotDone) == true{
            cell.accessoryType = .checkmark}
        else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = data[indexPath.row]
        
        
        
        guard let vc = storyboard?.instantiateViewController(identifier: "view") as? RealmViewViewController else {
            return
        }
        
        vc.item = item
        vc.deletionHandler = {[weak self] in
            self?.refresh()
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.title = item.item
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
      let taskList = data[indexPath.row]
        
    let doneAction = UIContextualAction(style: .normal, title: "Done") { (_, _, _) in
        
        try! self.realm.write{
        taskList.doneOrNotDone = !taskList.doneOrNotDone
        }
        self.completionHandler?()
        self.table.reloadData()
        
    }
        doneAction.backgroundColor = UIColor.green
      return UISwipeActionsConfiguration(actions: [doneAction])
        
    }
}
