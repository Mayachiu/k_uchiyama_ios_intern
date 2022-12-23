//
//  WeatherDelegate.swift
//  Yumemi-iOS-Training
//
//  Created by 内山 和輝 on 2022/12/20.
//

import Foundation

protocol WeatherDelegate: AnyObject {
    func updateWeather(fetchedWeatherCondition: String, fetchedMinTemperature: Int, fetchedMaxTemperature: Int)
    func showNoWeatherResult(alertTitle: String)
}
