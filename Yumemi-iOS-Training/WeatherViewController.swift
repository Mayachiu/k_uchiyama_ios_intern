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

    internal func showNoWeatherAlert(_ alertTitle: String) {
        let noWeatherAlert = UIAlertController(title: alertTitle, message: nil, preferredStyle: .actionSheet)
        let closeAction = UIAlertAction(title: "閉じる", style: .default)
        noWeatherAlert.addAction(closeAction)
        present(noWeatherAlert, animated: true)
    }
}

extension WeatherViewController: WeatherDelegate {
    func updateWeather(fetchedWeatherCondition: String, fetchedMinTemperature: Int, fetchedMaxTemperature: Int) {
        switch fetchedWeatherCondition {
        case "sunny":
            weatherImageView.image = #imageLiteral(resourceName: "sunny").withRenderingMode(.alwaysTemplate)
            weatherImageView.tintColor = .red
        case "rainy":
            weatherImageView.image = #imageLiteral(resourceName: "rainy").withRenderingMode(.alwaysTemplate)
            weatherImageView.tintColor = .blue
        case "cloudy":
            weatherImageView.image = #imageLiteral(resourceName: "cloudy").withRenderingMode(.alwaysTemplate)
            weatherImageView.tintColor = .gray
        default:
            break
        }
        minTemperatureLabel.text = String(fetchedMinTemperature)
        maxTemperatureLabel.text = String(fetchedMaxTemperature)
    }

    func showNoWeatherResult(alertTitle: String) {
        weatherImageView.image = UIImage(systemName: "questionmark.circle")?.withRenderingMode(.alwaysTemplate)
        weatherImageView.tintColor = .black
        minTemperatureLabel.text = "-"
        maxTemperatureLabel.text = "-"

        showNoWeatherAlert(alertTitle)
    }
}
