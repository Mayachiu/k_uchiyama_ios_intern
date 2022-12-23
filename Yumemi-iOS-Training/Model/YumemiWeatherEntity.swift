//
//  YumemiWeatherEntity.swift
//  Yumemi-iOS-Training
//
//  Created by 内山 和輝 on 2022/12/22.
//

import Foundation

struct Request: Codable {
    let area: String
    let date: Date
}

struct Response: Codable {
    let weatherCondition: String
    let maxTemperature: Int
    let minTemperature: Int
    let date: Date

    enum CodingKeys: String, CodingKey {
        case weatherCondition = "weather_condition"
        case maxTemperature = "max_temperature"
        case minTemperature = "min_temperature"
        case date
    }
}
