//
//  SideMenuView.swift
//  RickAndMorty
//
//  Created by Angela Alves on 20/01/23.
//

import Foundation
import TinyConstraints
import UIKit

class SideMenuView: RMView {

    private let charactersRow = SideMenuRow(
        icon: UIImage(
            systemName: "person.crop.circle.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal),
        title: "Characters")
    private let favoriteEpisodesRow = SideMenuRow(
        icon: UIImage(
            systemName: "heart.circle.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal),
        title: "Favorite episodes")
    private let placesRow = SideMenuRow(
        icon: UIImage(
            systemName: "globe.europe.africa.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal),
        title: "Places")
    private let episodesRow = SideMenuRow(
        icon: UIImage(
            systemName: "film.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal),
        title: "Episodes")

    override init() {
        super.init()
        backgroundColor = AppColors.darkGreen
    }

    private let stackView = UIStackView() .. {
        $0.axis = .vertical
        $0.distribution = .equalCentering
        $0.alignment = .leading
    }

    private lazy var menuStackView = UIStackView() .. {
        $0.axis = .vertical
        $0.spacing = 24
        $0.width(180)
    }

    private let darkModeSegmentedControl = UISegmentedControl(items: ["Light", "Dark"]) .. {
        $0.selectedSegmentTintColor = AppColors.lightGreen
        $0.selectedSegmentIndex = 0
    }

    override func configureSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(menuStackView)
        stackView.addArrangedSubview(darkModeSegmentedControl)
        menuStackView.addArrangedSubview(charactersRow)
        menuStackView.addArrangedSubview(placesRow)
        menuStackView.addArrangedSubview(episodesRow)
        menuStackView.addArrangedSubview(favoriteEpisodesRow)
    }

    override func configureConstraints() {
        stackView.edgesToSuperview(insets: .uniform(24), usingSafeArea: true)
    }
}
