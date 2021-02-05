//
//  ListClass.swift
//  module14task
//
//  Created by Mikhail Yakushevich on 25.01.2021.
//

import Foundation

class ListClass: Codable {
    
    public var main: MainClass?
    
    public var weather: [WeatherClass]?
    
    public var wind: WindClass?
    
    public var dt_txt: String?
    
}
