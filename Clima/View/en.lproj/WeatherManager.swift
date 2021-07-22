//
//  WeatherManager.swift
//  Clima
//
//  Created by Тамирлан Абаев   on 21.07.2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import UIKit

struct WeatherManager {
    let weatherURL = "http://api.openweathermap.org/data/2.5/weather?appid=8a080fb21c0f2d8ae72bd9591ef4d510&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performSegue(urlString: urlString)
    }
    
    func performSegue(urlString:String) {
        
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
           
            
        }
        
    }
}

