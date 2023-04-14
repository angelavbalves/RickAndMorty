//
//  ListEpisodesCell.swift
//  RickAndMorty
//
//  Created by Angela Alves on 22/02/23.
//

import Foundation
import TinyConstraints
import UIKit

class ListEpisodesCell: UITableViewCell {

    static let identifier = "listEpisodesCell"

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureSubviews()
        configureConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Views
    private let bottomView = UIView() ... {
        $0.layer.masksToBounds = false
        $0.layer.cornerRadius = 10.0
        $0.backgroundColor = AppColors.purple
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.5
        $0.layer.shadowOffset = CGSize(width: 0, height: 3)
    }

    private let stackView = UIStackView() ... {
        $0.axis = .horizontal
        $0.spacing = Spacing.large
        $0.alignment = .center
    }

    private let leftStackView = UIStackView() ... {
        $0.axis = .vertical
        $0.spacing = Spacing.large
    }

    private let episodeName = UILabel() ... {
        $0.font = Fonts.title
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
    }

    private let episodeNumber = UILabel() ... {
        $0.font = Fonts.text
    }

    private let chevron = UIImageView() ... {
        let chevron = UIImage(systemName: "chevron.right")
        $0.tintColor = .black
        $0.image = chevron
        $0.contentMode = .scaleAspectFit
        $0.setHugging(.defaultHigh, for: .horizontal)
    }

    func configureSubviews() {
        backgroundColor = AppColors.lightPurple
        addSubview(bottomView)
        bottomView.addSubview(stackView)
        stackView.addArrangedSubview(leftStackView)
        stackView.addArrangedSubview(chevron)

        leftStackView.addArrangedSubview(episodeName)
        leftStackView.addArrangedSubview(episodeNumber)
    }

    func configureConstraints() {
        bottomView.edgesToSuperview(insets: .uniform(Spacing.small), usingSafeArea: true)
        stackView.edges(to: bottomView, insets: .uniform(Spacing.huge))
    }

    func setup(_ episode: EpisodeResponse) {
        episodeName.text = episode.name
        episodeNumber.text = episode.episode
    }
}
