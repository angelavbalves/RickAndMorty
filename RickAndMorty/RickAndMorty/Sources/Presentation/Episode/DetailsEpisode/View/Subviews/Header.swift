//
//  HeaderCell.swift
//  RickAndMorty
//
//  Created by Angela Alves on 16/04/23.
//

import UIKit
import TinyConstraints


final class DetailsEpisodeHeader: UICollectionReusableView {

    static let identifier = "headerDetailsEpisode"

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        configureConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - Views
    private let stackView = UIStackView() ... {
        $0.axis = .vertical
        $0.spacing = Spacing.medium
    }

    private let rowDate = RMAttributesRow()
    private let rowTitleEpisode = RMAttributesRow()

    private let title = UILabel() ... {
        $0.font = Fonts.text
        $0.text = "Characters who have been seen in the episode"
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        $0.textAlignment = .center
    }

    func configureSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(rowTitleEpisode)
        stackView.addArrangedSubview(rowDate)
        stackView.addArrangedSubview(title)
    }

    func configureConstraints() {
        stackView.edgesToSuperview(insets: .uniform(Spacing.medium), usingSafeArea: true)
    }

    func setup(_ episode: EpisodeResponseItem) {
        rowTitleEpisode.setup(
            title: "Title",
            property: episode.name,
            background: AppColors.darkGreen
        )
        rowDate.setup(
            title: "Air Date",
            property: episode.airDate,
            background: AppColors.darkGreen
        )
    }
}

