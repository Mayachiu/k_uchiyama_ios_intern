//
//  WeatherManager.swift
//  Yumemi-iOS-Training
//
//  Created by 内山 和輝 on 2022/12/20.
//

import Foundation

final class WeatherManager {
    weak var delegate: WeatherDelegate? = nil

    func requestWeatherForecast() {
        APIClient.fetchWeatherCondition(completion: {[weak self] result in
            guard let self = self else { return }
            var fetchedWeatherCondition = ""
            var fetchedMinTemperature = 0
            var fetchedMaxTemperature = 0

            switch result {
            case .success(let weatherResult):
                fetchedWeatherCondition = weatherResult.weatherCondition
                fetchedMinTemperature = weatherResult.minTemperature
                fetchedMaxTemperature = weatherResult.maxTemperature
                self.delegate?.updateWeather(fetchedWeatherCondition, fetchedMinTemperature, fetchedMaxTemperature)
            case .failure(let error):
                self.delegate?.showNoWeatherResult(fetchedWeatherCondition)
                self.delegate?.showNoWeatherAlert()
                print(error)
            }
        })
    }
}
