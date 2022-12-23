//
//  FetchWeatherError.swift
//  Yumemi-iOS-Training
//
//  Created by 内山 和輝 on 2022/12/23.
//

import Foundation
import YumemiWeather

enum FetchWeatherError:  LocalizedError {
    case APIError(YumemiWeatherError)
    case failedConvertingDataToJson
    case failedConvertingJsonToData
    case failedEncoding
    case failedDecoding

    var localizedDescription: String {
        switch self {
        case .failedConvertingDataToJson:
            return "データからJSONへの変換に失敗しました"
        case .failedConvertingJsonToData:
            return "JSONからデータへの変換に失敗しました"
        case .failedEncoding:
            return "エンコードに失敗しました"
        case .failedDecoding:
            return "デコードに失敗しました"
        case .APIError(let error):
            switch error {
            case .invalidParameterError:
                return "無効なパラメーターのエラーです"
            case .unknownError:
                return "不明なエラーが発生しました"
            }
        }
    }
}
