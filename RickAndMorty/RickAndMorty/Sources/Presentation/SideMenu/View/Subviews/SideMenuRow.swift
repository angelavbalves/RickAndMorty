//
//  SideMenuRow.swift
//  RickAndMorty
//
//  Created by Angela Alves on 25/01/23.
//

import Foundation
import UIKit
import TinyConstraints

class SideMenuRow: RMView {

    private let icon: UIImage?
    private let menuTitle: String

    init(icon: UIImage?, title: String) {
        self.icon = icon
        menuTitle = title
        super.init()
        configure()
    }

    private let stackView = UIStackView() .. {
        $0.axis = .horizontal
        $0.spacing  = 6
        $0.distribution = .fillProportionally
    }

    private let menuIcon = UIImageView() .. {
        $0.contentMode = .scaleAspectFit
        $0.width(40)
        $0.height(40)
    }

    private let menuLabel = UILabel() .. {
//        $0.font = UIFont(name: "Comic Sans", size: 8)
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.numberOfLines = 0
        $0.textColor = .white
        $0.lineBreakMode = .byWordWrapping
    }

    override func configureSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(menuIcon)
        stackView.addArrangedSubview(menuLabel)
    }

    override func configureConstraints() {
        stackView.edgesToSuperview()
    }

    private func configure() {
        menuLabel.text = menuTitle
        menuIcon.image = icon
    }
}
