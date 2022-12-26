//
//  WeatherViewController.swift
//  Yumemi-iOS-Training
//
//  Created by 内山 和輝 on 2022/12/19.
//

import UIKit

final class WeatherViewController: UIViewController {
    private let weatherManager = WeatherManager()

    @IBOutlet private weak var weatherImageView: UIImageView!
    @IBOutlet private weak var minTemperatureLabel: UILabel!
    @IBOutlet private weak var maxTemperatureLabel: UILabel!

    deinit {
            print("class：\(String(describing: type(of: self)))")
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.delegate = self
    }

    @IBAction private func reloadButtonPressed(_ sender: Any) {
        weatherManager.requestWeatherForecast()
    }

    @IBAction private func closeButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }

    internal func configureNoWeatherResult() {
        weatherImageView.image = Asset.noWeatherImage?.withRenderingMode(.alwaysTemplate)
        weatherImageView.tintColor = Asset.noWeatherColor
        minTemperatureLabel.text = "-"
        maxTemperatureLabel.text = "-"
    }

    internal func showNoWeatherAlert(alertTitle: String) {
        let noWeatherAlert = UIAlertController(title: alertTitle, message: nil, preferredStyle: .actionSheet)
        let closeAction = UIAlertAction(title: "閉じる", style: .default)
        noWeatherAlert.addAction(closeAction)
        present(noWeatherAlert, animated: true)
    }
}

extension WeatherViewController: WeatherDelegate {
    func updateWeather(fetchedWeatherCondition: WeatherCondition, fetchedMinTemperature: Int, fetchedMaxTemperature: Int) {
        switch fetchedWeatherCondition {
        case .sunny:
            weatherImageView.image = Asset.sunnyImage.withRenderingMode(.alwaysTemplate)
            weatherImageView.tintColor = Asset.sunnyColor
        case .cloudy:
            weatherImageView.image = Asset.cloudyImage.withRenderingMode(.alwaysTemplate)
            weatherImageView.tintColor = Asset.cloudyColor
        case .rainy:
            weatherImageView.image = Asset.rainyImage.withRenderingMode(.alwaysTemplate)
            weatherImageView.tintColor = Asset.rainyColor
        }
        minTemperatureLabel.text = String(fetchedMinTemperature)
        maxTemperatureLabel.text = String(fetchedMaxTemperature)
    }

    func failedTofetchWeatherData(alertTitle: String) {
        configureNoWeatherResult()
        showNoWeatherAlert(alertTitle: alertTitle)
    }
}
