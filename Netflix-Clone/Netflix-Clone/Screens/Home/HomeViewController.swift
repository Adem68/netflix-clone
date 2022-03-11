//
//  HomeViewController.swift
//  Netflix-Clone
//
//  Created by Adem Özcan on 11.03.2022.
//

import UIKit

class HomeViewController: UIViewController {
    let sectionTitles: [String] = [
        "TRENDING MOVIES",
        "POPULAR",
        "TRENDING TV",
        "UPCOMING MOVIES",
        "TOP RATED"
    ]

    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)

        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self

        configureNavigationBar()

        let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 500))
        homeFeedTable.tableHeaderView = headerView
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier,
                                                       for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        header.textLabel?.textColor = .label
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x,
                                         y: header.bounds.origin.y,
                                         width: 100,
                                         height: header.bounds.height)
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defaultOffset

        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
}

private extension HomeViewController {
    func configureNavigationBar() {
        var image = UIImage(named: Constants.logo)
        image = image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image,
                                                           style: .done,
                                                           target: self,
                                                           action: nil)
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: Constants.personIcon),
                            style: .done,
                            target: self,
                            action: nil),
            UIBarButtonItem(image: UIImage(systemName: Constants.playIcon),
                            style: .done,
                            target: self,
                            action: nil)
        ]

        navigationController?.navigationBar.tintColor = .label
    }

    enum Constants {
        static let logo = "netflixLogo"
        static let personIcon = "person"
        static let playIcon = "play.rectangle"
    }
}
