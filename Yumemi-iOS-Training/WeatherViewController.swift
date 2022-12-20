//
//  WeatherViewController.swift
//  Yumemi-iOS-Training
//
//  Created by 内山 和輝 on 2022/12/19.
//

import UIKit

final class WeatherViewController: UIViewController {
    private let weatherManager = WeatherManager()
    private var displayedWetherCondition: String = ""

    @IBOutlet private weak var weatherImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.delegate = self
    }

    @IBAction private func reloadButtonPressed(_ sender: Any) {
        weatherManager.requestWeatherForecast(displayedWetherCondition)
    }

    @IBAction private func closeButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

extension WeatherViewController: WeatherDelegate {
    func updateWeather(_ fetchedWetherCondition: String) {
        switch fetchedWetherCondition {
        case "sunny":
            weatherImageView.image = UIImage(named: "sunny")?.withRenderingMode(.alwaysTemplate)
            weatherImageView.tintColor = .red
        case "rainy":
            weatherImageView.image = UIImage(named: "rainy")?.withRenderingMode(.alwaysTemplate)
            weatherImageView.tintColor = .blue
        case "cloudy":
            weatherImageView.image = UIImage(named: "cloudy")?.withRenderingMode(.alwaysTemplate)
            weatherImageView.tintColor = .gray
        default:
            weatherImageView.image = UIImage(systemName: "questionmark.circle")?.withRenderingMode(.alwaysTemplate)
            weatherImageView.tintColor = .black
        }
        displayedWetherCondition = fetchedWetherCondition
    }
}
