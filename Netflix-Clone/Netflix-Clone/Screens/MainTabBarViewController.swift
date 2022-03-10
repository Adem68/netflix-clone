//
//  MainTabBarViewController.swift
//  Netflix-Clone
//
//  Created by Adem Özcan on 11.03.2022.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    private let homeViewController = UINavigationController(rootViewController: HomeViewController())
    private let upcomingViewController = UINavigationController(rootViewController: UpcomingViewController())
    private let searchViewController = UINavigationController(rootViewController: SearchViewController())
    private let downloadsViewController = UINavigationController(rootViewController: DownloadsViewController())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow

        let viewControllers = [
            homeViewController,
            upcomingViewController,
            searchViewController,
            downloadsViewController
        ]

        setViewControllers(viewControllers, animated: true)
    }

}
