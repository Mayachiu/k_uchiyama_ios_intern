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

            switch result {
            case .success(let weatherResult):
                fetchedWeatherCondition = weatherResult
                self.delegate?.updateWeather(fetchedWeatherCondition)
            case .failure(let error):
                self.delegate?.showNoWeatherResult(fetchedWeatherCondition)
                self.delegate?.showNoWeatherAlert()
                print(error)
            }
        })
    }
}
