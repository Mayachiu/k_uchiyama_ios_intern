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
        APIClient.fetchWeather(completion: {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let weatherResult):
                let fetchedWeatherCondition = weatherResult.weatherCondition
                let fetchedMinTemperature = weatherResult.minTemperature
                let fetchedMaxTemperature = weatherResult.maxTemperature
                self.delegate?.updateWeather(fetchedWeatherCondition: fetchedWeatherCondition, fetchedMinTemperature: fetchedMinTemperature, fetchedMaxTemperature: fetchedMaxTemperature)
            case .failure(let error):
                self.delegate?.showNoWeatherResult(alertTitle: error.localizedDescription)
            }
        })
    }
}
