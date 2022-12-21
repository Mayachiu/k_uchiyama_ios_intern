//
//  NewViewController.swift
//  Yumemi-iOS-Training
//
//  Created by 内山 和輝 on 2022/12/19.
//

import UIKit

final class NewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        transitionToWeatherViewController()
    }

    private func transitionToWeatherViewController() {
        let weatherViewController = WeatherViewController()
        weatherViewController.modalPresentationStyle = .fullScreen
        present(weatherViewController, animated: true)
    }
}
