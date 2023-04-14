//
//  HomeView.swift
//  RickAndMorty
//
//  Created by Angela Alves on 14/02/23.
//

import Foundation
import UIKit
import TinyConstraints

class HomeView: RMView {

    private let userDidTapInCharacterButton: () -> Void
    private let userDidTapInLocationButton: () -> Void
    private let userDidTapInEpisodesButton: () -> Void

    // MARK: - Init
    init(
        userDidTapInCharacterButton: @escaping () -> Void,
        userDidTapInLocationButton: @escaping () -> Void,
        userDidTapInEpisodesButton: @escaping () -> Void
    ) {
        self.userDidTapInLocationButton = userDidTapInLocationButton
        self.userDidTapInCharacterButton = userDidTapInCharacterButton
        self.userDidTapInEpisodesButton = userDidTapInEpisodesButton
        super.init()
    }

    // MARK: - View
    private let stackView = UIStackView() ... {
        $0.axis = .vertical
        $0.spacing = 30
    }

    private let logoImageView = UIImageView() ... {
        $0.image = UIImage(named: "rickAndMortyLogo")
        $0.contentMode = .scaleAspectFit
        $0.setHugging(.required, for: .vertical)
    }

    private let contentStackView = UIStackView() ... {
        $0.axis = .vertical
        $0.spacing = 26
    }

    private let firstDescription = UILabel() ... {
        $0.text = "Rick and Morty é uma série animada de comédia que mostra as aventuras interdimensionais de Rick, a mente mais brilhante da galáxia, e seu neto Morty"
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        $0.textAlignment = .justified
        $0.font = .systemFont(ofSize: 18)
        $0.setHugging(.required, for: .vertical)
    }

    private let secondDescription = UILabel() ... {
        $0.text = "Com sua arma capaz de criar portais para viajar no tempo-espaço, Rick leva Morty para explorar todos as absurdas formas de vida que o universo é capaz de sustentar."
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        $0.textAlignment = .justified
        $0.font = .systemFont(ofSize: 18)
    }

    private let containerButtons = UIStackView() ... {
        $0.axis = .vertical
        $0.spacing = Spacing.medium
    }

    private lazy var charactersButton = RMButton() ... {
        $0.setup(title: "Personagens")
        $0.addTarget(
            self,
            action: #selector(buttonCharacterTapped),
            for: .touchUpInside
        )
    }

    private lazy var locationsButton = RMButton() ... {
        $0.setup(title: "Lugares")
        $0.addTarget(
            self,
            action: #selector(buttonLocationTapped),
            for: .touchUpInside
        )
    }

    private lazy var episodesButton = RMButton() ... {
        $0.setup(title: "Episódios")
        $0.addTarget(
            self,
            action: #selector(buttonEpisodesTapped),
            for: .touchUpInside
        )
    }

    @objc
    func buttonCharacterTapped() {
        userDidTapInCharacterButton()
    }

    @objc
    func buttonLocationTapped() {
        userDidTapInLocationButton()
    }

    @objc
    func buttonEpisodesTapped() {
        userDidTapInEpisodesButton()
    }

    // MARK: - Aux
    override func configureSubviews() {
        backgroundColor = .white
        addSubview(stackView)
        stackView.addArrangedSubview(logoImageView)
        stackView.addArrangedSubview(contentStackView)
        stackView.addArrangedSubview(containerButtons)
        contentStackView.addArrangedSubview(firstDescription)
        contentStackView.addArrangedSubview(secondDescription)
        contentStackView.addArrangedSubview(UIView())
        containerButtons.addArrangedSubview(charactersButton)
        containerButtons.addArrangedSubview(locationsButton)
        containerButtons.addArrangedSubview(episodesButton)
    }

    override func configureConstraints() {
        stackView.edgesToSuperview(insets: .uniform(24), usingSafeArea: true)
    }
}
