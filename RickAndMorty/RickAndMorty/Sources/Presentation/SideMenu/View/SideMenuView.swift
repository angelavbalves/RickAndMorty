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
            systemName: "person.crop.circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal),
        title: "Characters")
    private let favoriteCharactersRow = SideMenuRow(
        icon: UIImage(
            systemName: "heart.circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal),
        title: "Favorite characters")
    private let placesRow = SideMenuRow(
        icon: UIImage(
            systemName: "globe.europe.africa.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal),
        title: "Places")
    private let episodesRow = SideMenuRow(
        icon: UIImage(
            systemName: "film.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal),
        title: "Episodes")

    override init() {
        super.init()
        backgroundColor = .green
    }

    private let stackView = UIStackView() .. {
        $0.axis = .vertical
        $0.distribution = .equalCentering
        $0.alignment = .leading
    }

    private let menuStackView = UIStackView() .. {
        $0.axis = .vertical
        $0.spacing = 24
    }

    private let darkModeSegmentedControl = UISegmentedControl(items: ["Dark", "Light"])

    override func configureSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(menuStackView)
        stackView.addArrangedSubview(darkModeSegmentedControl)
        menuStackView.addArrangedSubview(charactersRow)
        menuStackView.addArrangedSubview(favoriteCharactersRow)
        menuStackView.addArrangedSubview(placesRow)
        menuStackView.addArrangedSubview(episodesRow)
    }

    override func configureConstraints() {
        stackView.edgesToSuperview(insets: .uniform(24), usingSafeArea: true)
    }
}
