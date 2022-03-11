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
        view.backgroundColor = .systemBackground

        let viewControllers = [
            homeViewController,
            upcomingViewController,
            searchViewController,
            downloadsViewController
        ]

        setupTabBars()

        setViewControllers(viewControllers, animated: true)
    }

}

private extension MainTabBarViewController {
    func setupTabBars() {
        homeViewController.tabBarItem.title = Titles.homeTabBarTitle
        homeViewController.tabBarItem.image = UIImage(systemName: Images.homeTabBarImage)
        upcomingViewController.tabBarItem.title = Titles.upcomingTabBarTitle
        upcomingViewController.tabBarItem.image = UIImage(systemName: Images.upcomingTabBarImage)
        searchViewController.tabBarItem.title = Titles.searchTabBarTitle
        searchViewController.tabBarItem.image = UIImage(systemName: Images.searchTabBarImage)
        downloadsViewController.tabBarItem.title = Titles.downloadsTabBarTitle
        downloadsViewController.tabBarItem.image = UIImage(systemName: Images.downloadsTabBarImage)
        tabBar.tintColor = .label
    }

    enum Images {
        static let homeTabBarImage = "house"
        static let upcomingTabBarImage = "play.rectangle.on.rectangle"
        static let searchTabBarImage = "magnifyingglass"
        static let downloadsTabBarImage = "square.and.arrow.down"
    }

    enum Titles {
        static let homeTabBarTitle = "Home"
        static let upcomingTabBarTitle = "New and Popular"
        static let searchTabBarTitle = "Search"
        static let downloadsTabBarTitle = "Downloads"
    }
}
