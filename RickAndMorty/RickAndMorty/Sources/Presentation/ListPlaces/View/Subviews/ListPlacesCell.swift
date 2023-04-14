//
//  ListPlacesCell.swift
//  RickAndMorty
//
//  Created by Angela Alves on 27/02/23.
//

import Foundation
import UIKit

class ListPlacesCell: UITableViewCell {

    static let identifier = "listPlacesCell"

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
        $0.backgroundColor = AppColors.pink
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

    private let placeName = UILabel() ... {
        $0.font = Fonts.title
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
    }


    private let chevron = UIImageView() ... {
        let chevron = UIImage(systemName: "chevron.right")
        $0.tintColor = .black
        $0.image = chevron
        $0.contentMode = .scaleAspectFit
        $0.setHugging(.defaultHigh, for: .horizontal)
    }

    func configureSubviews() {
        backgroundColor = AppColors.lightPink
        addSubview(bottomView)
        bottomView.addSubview(stackView)
        stackView.addArrangedSubview(leftStackView)
        stackView.addArrangedSubview(chevron)

        leftStackView.addArrangedSubview(placeName)
    }

    func configureConstraints() {
        bottomView.edgesToSuperview(insets: .uniform(Spacing.small), usingSafeArea: true)
        stackView.edges(to: bottomView, insets: .uniform(Spacing.huge))
    }

    func setup(_ place: LocationResponse) {
        placeName.text = place.name
    }
}
