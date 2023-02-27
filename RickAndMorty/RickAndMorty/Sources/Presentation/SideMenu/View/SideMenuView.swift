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

    private lazy var charactersRow = SideMenuRow(
        icon: UIImage(
            systemName: "person.crop.circle.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal),
        title: "Characters",
        onTap: didTapOnCharactersList
    )
    private lazy var placesRow = SideMenuRow(
        icon: UIImage(
            systemName: "globe.europe.africa.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal),
        title: "Places",
        onTap: didTapOnPlacesList
    )
    private lazy var episodesRow = SideMenuRow(
        icon: UIImage(systemName: "film.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal),
        title: "Episodes",
        onTap: didTapOnEpisodesList
    )
    private let favoriteEpisodesRow = SideMenuRow(
        icon: UIImage(
            systemName: "heart.circle.fill")?.withTintColor(.black, renderingMode: .alwaysOriginal),
        title: "Favorite episodes",
        onTap: {}
    )

    private let didTapOnCharactersList: () -> Void
    private let didTapOnEpisodesList: () -> Void
    private let didTapOnPlacesList: () -> Void

    init(
        didTapOnCharactersList: @escaping () -> Void,
        didTapOnEpisodesList: @escaping () -> Void,
        didTapOnPlacesList: @escaping () -> Void
    ) {
        self.didTapOnCharactersList = didTapOnCharactersList
        self.didTapOnEpisodesList = didTapOnEpisodesList
        self.didTapOnPlacesList = didTapOnPlacesList
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
