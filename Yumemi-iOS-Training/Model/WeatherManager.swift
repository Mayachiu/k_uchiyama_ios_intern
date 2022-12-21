//
//  WeatherManager.swift
//  Yumemi-iOS-Training
//
//  Created by 内山 和輝 on 2022/12/20.
//

import Foundation

final class WeatherManager {
    weak var delegate: WeatherDelegate? = nil

    func requestWeatherForecast(_ displayedWeatherCondition: String){
        let fetchedWeatherCondition: String = APIClient.fetchWeatherCondition()

        if displayedWeatherCondition != fetchedWeatherCondition {
            self.delegate?.updateWeather(fetchedWeatherCondition)
        }
    }
}
