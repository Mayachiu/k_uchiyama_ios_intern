//
//  ViewController.swift
//  Yumemi-iOS-Training
//
//  Created by 内山 和輝 on 2022/12/19.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var weatherImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func reloadButtonPressed(_ sender: Any) {
        switch APIClient.fetchWeatherCondition() {
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
    }
}

