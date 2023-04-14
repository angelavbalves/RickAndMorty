//
//  ListCharacterCell.swift
//  RickAndMorty
//
//  Created by Angela Alves on 20/01/23.
//

import Foundation
import Kingfisher
import TinyConstraints
import UIKit

class ListCharacterCell: UITableViewCell {

    // MARK: - Identifier
    static let identifier = "characterCell"

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureSubviews()
        configureConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Views
    private let bottomView = UIView() .. {
        $0.layer.masksToBounds = false
        $0.layer.cornerRadius = 10.0
        $0.backgroundColor = AppColors.green
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.5
        $0.layer.shadowOffset = CGSize(width: 0, height: 3)
    }

    private let stackView = UIStackView() .. {
        $0.axis = .horizontal
        $0.spacing = Spacing.large
        $0.alignment = .center
    }

    private let leftStackView = UIStackView() .. {
        $0.axis = .vertical
        $0.spacing = Spacing.large
    }

    private let characterImage = UIImageView() .. {
        $0.height(100)
        $0.width(100)
        $0.layer.masksToBounds = false
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 50.0
        $0.contentMode = .scaleAspectFill
    }

    private let characterStatus = UILabel() .. {
        $0.font = Fonts.text
        $0.textAlignment = .center
    }

    private let characterName = UILabel() .. {
        $0.font = Fonts.title
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
    }

    private let chevron = UIImageView() .. {
        let chevron = UIImage(systemName: "chevron.right")
        $0.tintColor = .black
        $0.image = chevron
        $0.contentMode = .scaleAspectFit
        $0.setHugging(.defaultHigh, for: .horizontal)
    }

    // MARK: - Setup
    func setup(_ character: CharacterResponse) {
        characterStatus.text = character.status
        characterName.text = character.name
        let url = character.image
        characterImage.kf.indicatorType = .activity
        characterImage.kf.setImage(
            with: url,
            options: [.onFailureImage(UIImage(named: "imageNotFound"))]
        )
    }

    func configureSubviews() {
        backgroundColor = AppColors.lightGreen
        addSubview(bottomView)
        bottomView.addSubview(stackView)
        stackView.addArrangedSubview(leftStackView)
        stackView.addArrangedSubview(characterName)
        stackView.addArrangedSubview(chevron)

        leftStackView.addArrangedSubview(characterImage)
        leftStackView.addArrangedSubview(characterStatus)
    }

    func configureConstraints() {
        bottomView.edgesToSuperview(insets: .uniform(Spacing.small), usingSafeArea: true)
        stackView.edges(to: bottomView, insets: .uniform(Spacing.huge))
    }
}
