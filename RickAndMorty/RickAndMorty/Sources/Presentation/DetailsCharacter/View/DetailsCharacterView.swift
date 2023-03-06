//
//  DetailsCharacterView.swift
//  RickAndMorty
//
//  Created by Angela Alves on 27/02/23.
//

import Foundation
import UIKit
import TinyConstraints
import Kingfisher

class DetailsCharacterView: RMView {

    private let character: CharacterResponseItem

    init(character: CharacterResponseItem) {
        self.character = character
        super.init()
        backgroundColor = AppColors.lightYellow
        configureView()
    }

    private let backgroundStackView = UIStackView() .. {
        $0.axis = .vertical
        $0.spacing = Spacing.large
    }

    private lazy var characterImage = UIImageView() .. {
        $0.height(300)
        $0.width(150)
        $0.layer.masksToBounds = false
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 8.0
        $0.contentMode = .scaleAspectFill
    }

    private lazy var name = UILabel() .. {
        $0.text = character.name
        $0.font = Fonts.title
        $0.textAlignment = .center
        $0.setHugging(.required, for: .vertical)
    }

    private lazy var origin = RMStackViewAttributes()

    private lazy var gender = RMStackViewAttributes()

    private lazy var species = RMStackViewAttributes()

    override func configureSubviews() {
        addSubview(backgroundStackView)
        backgroundStackView.addArrangedSubview(characterImage)
        backgroundStackView.addArrangedSubview(name)
        backgroundStackView.addArrangedSubview(origin)
        backgroundStackView.addArrangedSubview(gender)
        backgroundStackView.addArrangedSubview(species)
        backgroundStackView.addArrangedSubview(UIView())
    }

    override func configureConstraints() {
        backgroundStackView.edgesToSuperview(insets: .uniform(Spacing.huge))
    }

    private func configureView() {
        let url = character.image
        characterImage.kf.indicatorType = .activity
        characterImage.kf.setImage(
            with: url,
            options: [.onFailureImage(UIImage(named: "imageNotFound"))]
        )
        origin.setup(title: "Origin", property: character.origin.name, background: AppColors.yellow)
        gender.setup(title: "Gender", property: character.gender, background: AppColors.yellow)
        species.setup(title: "Specie", property: character.species, background: AppColors.yellow)
    }
}
