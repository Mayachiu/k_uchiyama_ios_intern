//
//  APIClient.swift
//  Yumemi-iOS-Training
//
//  Created by 内山 和輝 on 2022/12/19.
//

import Foundation
import YumemiWeather

enum APIClient {
    static func fetchWeatherCondition(completion: @escaping (Result<String,  YumemiWeatherError>) -> Void) {
        do {
            let result = try YumemiWeather.fetchWeatherCondition(at: "tokyo")
            completion(.success(result))
        } catch {
            completion(.failure(.unknownError))
        }
    }
}
