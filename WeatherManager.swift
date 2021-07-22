//
//  WeatherManager.swift
//  Clima
//
//  Created by Тамирлан Абаев   on 21.07.2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=8a080fb21c0f2d8ae72bd9591ef4d510&units=metric"
    
    func fetchWeather(cityName:String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString:String) {
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
//                    let dataString = String(data: safeData, encoding: .utf8)
                    self.parseJSON(weatherData: safeData)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(weatherData:Data) {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(WeatherData.self, from: weatherData)
            let name = decodeData.name
            let temp = decodeData.main.temp
            let desc = decodeData.weather[0].description
            let id = decodeData.weather[0].id
            
            let weatherModel = WeatherModel(cityName: name, cityTemp: temp, cityDescription: desc, weatherId: id)
            
            print(weatherModel.temperatureString)
            
        } catch  {
            print(error)
        }
    }
    
    
}
