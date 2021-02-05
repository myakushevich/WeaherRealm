//
//  Persistance.swift
//  module14task
//
//  Created by Mikhail Yakushevich on 13.01.2021.
//

import Foundation


class Persistance {
    
    
    static let shared = Persistance()
    
    private let kFistNameKey = "Persistance.kFistNameKey"
    
    var firstName: String? {
        set { UserDefaults.standard.setValue(newValue, forKey: kFistNameKey)}
        get {return UserDefaults.standard.string(forKey: kFistNameKey)}
    }
    
    private let kLastNameKey = "Persistance.kLastNameKey"
    
    var lastName: String? {
        set { UserDefaults.standard.setValue(newValue, forKey: kLastNameKey)}
        get { return UserDefaults.standard.string(forKey: kLastNameKey)}
    }
    
}
