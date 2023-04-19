//
//  DetailsEpisodeCell.swift
//  RickAndMorty
//
//  Created by Angela Alves on 16/04/23.
//

import Kingfisher
import TinyConstraints
import UIKit

final class DetailsEpisodeCell: UICollectionViewCell {

    static let identifier = "detailsEpisodeCell"

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        configureSubviews()
        configureConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let stackView = UIStackView() ... {
        $0.axis = .vertical
        $0.alignment = .center
        $0.spacing = Spacing.medium
    }

    private let footerStackView = UIStackView() ... {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.spacing = Spacing.medium
    }

    private let characterName = UILabel() ... {
        $0.numberOfLines = 0
        $0.font = Fonts.smallText
        $0.textAlignment = .center
        $0.setCompressionResistance(.required, for: .vertical)
    }

    private lazy var characterImage = UIImageView() ... {
        $0.contentMode = .scaleAspectFit
    }

    private let characterStatus = UILabel() ... {
        $0.font = Fonts.smallText
    }

    private lazy var icon = UIImageView() ... {
        $0.height(8)
        $0.width(8)
        $0.layer.cornerRadius = 4.0
    }

    func setup(_ character: CharacterResponseItem) {
        characterStatus.text = character.status
        characterName.text = character.name
        let url = character.image
        characterImage.kf.indicatorType = .activity
        characterImage.kf.setImage(
            with: url,
            options: [.onFailureImage(UIImage(named: "photo"))])
        let status = character.status.lowercased()
        if status.contains("alive") {
            icon.image = UIImage(
                systemName: "circle.fill")?
                .withTintColor(
                    AppColors.green,
                    renderingMode: .alwaysOriginal)
        } else {
            icon.image = UIImage(
                systemName: "circle.fill")?
                .withTintColor(
                    AppColors.red,
                    renderingMode: .alwaysOriginal)
        }
    }

    func configureSubviews() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 5, height: 3)
        layer.cornerRadius = 8.0
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(characterName)
        stackView.addArrangedSubview(characterImage)
        stackView.addArrangedSubview(footerStackView)

        footerStackView.addArrangedSubview(icon)
        footerStackView.addArrangedSubview(characterStatus)
    }

    func configureConstraints() {
        stackView.edgesToSuperview(insets: .uniform(Spacing.extraSmall))
    }
}
