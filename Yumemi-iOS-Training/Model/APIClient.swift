//
//  APIClient.swift
//  Yumemi-iOS-Training
//
//  Created by 内山 和輝 on 2022/12/19.
//

import Foundation
import YumemiWeather

enum APIClient {
    static func fetchWeatherCondition(completion: @escaping (Result<Response,  YumemiWeatherError>) -> Void) {
        let jsonString = """
        {
            "area": "tokyo",
            "date": "2020-04-01T12:00:00+09:00"
        }
        """

        do {
            let result = try YumemiWeather.fetchWeather(jsonString)
            do {
                let response: Response = try JSONDecoder().decode(Response.self, from: result.data(using: .utf8)!)
                print(response)
                completion(.success(response))
            } catch {
                completion(.failure(.invalidParameterError))
            }
        } catch {
            completion(.failure(.unknownError))
        }
    }
}
