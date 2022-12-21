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
            var fetchedWetherCondition = ""

            switch result {
            case .success(let weatherResult):
                fetchedWetherCondition = weatherResult
                self.delegate?.updateWeather(fetchedWetherCondition)
            case .failure(let error):
                self.delegate?.showNoWeatherResult(fetchedWetherCondition)
                self.delegate?.showNoWeatherAlert()
                print(error)
            }
        })
    }
}
