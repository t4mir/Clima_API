//
//  WeatherData.swift
//  Clima
//
//  Created by Тамирлан Абаев   on 22.07.2021.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData:Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main:Codable {
    let temp: Double
}

struct Weather:Codable {
    let id: Int
    let description: String
}
