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
        accessoryType = .disclosureIndicator
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Views
    private let bottomView = UIView() ... {
        $0.layer.masksToBounds = false
        $0.layer.cornerRadius = 10.0
        $0.backgroundColor = .white
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.5
        $0.layer.shadowOffset = CGSize(width: 0, height: 3)
    }

    private let stackView = UIStackView() ... {
        $0.axis = .vertical
        $0.spacing = Spacing.small
    }

    private let episodeName = UILabel() ... {
        $0.font = Fonts.subtitle
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
    }

    private let episodeNumber = UILabel() ... {
        $0.font = Fonts.smallText
    }

    func configureSubviews() {
        backgroundColor = .clear
        addSubview(bottomView)
        bottomView.addSubview(stackView)

        stackView.addArrangedSubview(episodeName)
        stackView.addArrangedSubview(episodeNumber)
    }

    func configureConstraints() {
        bottomView.edgesToSuperview(insets: .uniform(Spacing.extraSmall), usingSafeArea: true)
        stackView.edges(to: bottomView, insets: .uniform(Spacing.medium))
    }

    func setup(_ episode: EpisodeResponseItem) {
        episodeName.text = episode.name
        episodeNumber.text = episode.episode
    }
}
