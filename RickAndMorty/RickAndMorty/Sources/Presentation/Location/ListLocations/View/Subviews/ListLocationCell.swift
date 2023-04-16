//
//  ListLocationCell.swift
//  RickAndMorty
//
//  Created by Angela Alves on 27/02/23.
//

import Foundation
import UIKit

class ListLocationCell: UITableViewCell {

    static let identifier = "listLocationCell"

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureSubviews()
        configureConstraints()
        accessoryType = .disclosureIndicator
        selectionStyle = .none
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
        $0.axis = .horizontal
        $0.spacing = Spacing.small
        $0.alignment = .center
    }

    private let locationName = UILabel() ... {
        $0.font = Fonts.title
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
    }

    func configureSubviews() {
        backgroundColor = .clear
        addSubview(bottomView)
        bottomView.addSubview(stackView)

        stackView.addArrangedSubview(locationName)
    }

    func configureConstraints() {
        bottomView.edgesToSuperview(insets: .uniform(Spacing.extraSmall), usingSafeArea: true)
        stackView.edges(to: bottomView, insets: .uniform(Spacing.medium))
    }

    func setup(_ location: LocationResponseItem) {
        locationName.text = location.name
    }
}
