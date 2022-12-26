//
//  APIClient.swift
//  Yumemi-iOS-Training
//
//  Created by 内山 和輝 on 2022/12/19.
//

import Foundation
import YumemiWeather

enum APIClient {
    static func fetchWeather(completion: @escaping (Result<Response,  FetchWeatherError>) -> Void) {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        let requestedQuery = Request(area: "tokyo", date: Date())
        guard let requestedData = try? encoder.encode(requestedQuery) else {
            completion(.failure(.failedEncoding))
            return
        }
        guard let jsonString = String(data: requestedData, encoding: .utf8) else {
            completion(.failure(.failedConvertingDataToJson))
            return
        }
        do {
            let fetchedJson = try YumemiWeather.fetchWeather(jsonString)
            guard let fetchedJsonData = fetchedJson.data(using: .utf8) else {
                completion(.failure(.failedConvertingJsonToData))
                return
            }
            do {
                let response: Response = try decoder.decode(Response.self, from: fetchedJsonData)
                completion(.success(response))
            } catch {
                completion(.failure(.failedDecoding))
            }
        } catch {
            completion(.failure(.APIError(.unknownError)))
        }
    }
}
