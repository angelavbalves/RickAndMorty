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


    // MARK: - Views
    private let bottomView = UIView() .. {
        $0.layer.masksToBounds = false
        $0.layer.cornerRadius = 10.0
        $0.backgroundColor = AppColors.lightGreen
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.5
        $0.layer.shadowOffset = CGSize(width: 0, height: 3)
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
        $0.font = Fonts.subtitle
        $0.numberOfLines = 0
        $0.textColor = .black
        $0.lineBreakMode = .byWordWrapping
    }

    override func configureSubviews() {
        addSubview(bottomView)
        bottomView.addSubview(stackView)
        stackView.addArrangedSubview(menuIcon)
        stackView.addArrangedSubview(menuLabel)
    }

    override func configureConstraints() {
        bottomView.edgesToSuperview()
        stackView.edges(to: bottomView, insets: .uniform(Spacing.medium))
    }

    private func configure() {
        menuLabel.text = menuTitle
        menuIcon.image = icon
    }
}
