//
//  WeatherLoader.swift
//  module14task
//
//  Created by Mikhail Yakushevich on 25.01.2021.
//

import Foundation

import Alamofire

class WeatherLoader {

    func getWeather(completion: @escaping (WeatherList) -> ()){

    AF.request("https://api.openweathermap.org/data/2.5/forecast?cnt=16&q=moscow&appid=e80494da57b62d99aaecadf595d106a9").validate().responseDecodable(of: WeatherList.self){
        dataResponse in
        switch dataResponse.result {
        
        
        case .success(let someValue): DispatchQueue.main.async {
            completion(someValue)
            
        }
        
        
        case .failure(let error):
            print(error)
        }
    }
            
                
            
            
        }
        
}

