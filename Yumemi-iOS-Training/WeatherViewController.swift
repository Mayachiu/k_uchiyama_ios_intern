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
}

extension WeatherViewController: WeatherDelegate {
    func updateWeather(_ fetchedWeatherCondition: String) {
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
    }

    func showNoWeatherResult(_ fetchedWeatherCondition: String) {
        weatherImageView.image = UIImage(systemName: "questionmark.circle")?.withRenderingMode(.alwaysTemplate)
        weatherImageView.tintColor = .black
    }

    func showNoWeatherAlert() {
        let noWeatherAlert = UIAlertController(title: "天気を読み込めませんでした", message: nil, preferredStyle: .actionSheet)
        let closeAction = UIAlertAction(title: "閉じる", style: .default)
        noWeatherAlert.addAction(closeAction)
        present(noWeatherAlert, animated: true, completion: nil)
    }
}
