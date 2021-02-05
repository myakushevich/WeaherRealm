//
//  WetherRealmViewController.swift
//  module14task
//
//  Created by Mikhail Yakushevich on 25.01.2021.
//

import UIKit
import Alamofire
import RealmSwift



class WeatherListItemNumberTwo: Object{
    
    @objc dynamic var  timeValue: String = ""
    
    @objc dynamic var  tempValue: Double = 0.00
    
    @objc dynamic var  windValue: Double = 0.00
    
    @objc dynamic var mainValue: String = ""
    
    
    
    
    
}


class WetherRealmViewController: UIViewController {
    
    private let realm = try! Realm()
    
    var items: Results<WeatherListItemNumberTwo>!
    
    
    
    @IBOutlet var weatherTableView: UITableView!
    
   
    var weather: WeatherList?
    
   
  
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    

        WeatherLoader().getWeather {     weather in
            
            self.weather = weather
            
            if self.weather?.list?[0].dt_txt != nil {
            try! self.realm.write{
                self.realm.deleteAll()
            }
            }
            
            self.weather?.list?.forEach({ (list) in
                            
                try! self.realm.write{
                    
                let item = WeatherListItemNumberTwo()
                item.timeValue = list.dt_txt!
                item.tempValue = list.main!.temp!
                item.mainValue = list.weather![0].main!
                item.windValue = list.wind!.speed!
                    self.realm.add(item)
                }
                
                self.weatherTableView.reloadData()
                
            })
           
          
            
        }
        
        
        
        self.items = realm.objects(WeatherListItemNumberTwo.self)
        
        
 
     
        }
    
    

}


extension WetherRealmViewController: UITableViewDataSource, UITableViewDelegate {
    
     func numberOfSections(in tableView: UITableView) -> Int {
          
        
        return 1
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 155
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        self.items.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2") as! WeatherRealmTableViewCell
        
        
        
        cell.timeLabel.text = self.items[indexPath.row].timeValue
        
        cell.tempLabel.text = "\(Int(self.items[indexPath.row].tempValue - 273.15))"

        cell.windLabel.text = "\(Int(self.items[indexPath.row].windValue))"
        
        cell.cloudLabel.text = self.items[indexPath.row].mainValue
        
  
        return cell
    }
    
}
