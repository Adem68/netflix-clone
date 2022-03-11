//
//  UpcomingViewController.swift
//  Netflix-Clone
//
//  Created by Adem Özcan on 11.03.2022.
//

import UIKit

class UpcomingViewController: UIViewController {
    private var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "NETFLIX CLONE"
        label.textColor = .label
        label.font = label.font.withSize(30)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(label)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

}
