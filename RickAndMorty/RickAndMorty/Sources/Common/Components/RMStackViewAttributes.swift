//
//  RMStackViewAttributes.swift
//  RickAndMorty
//
//  Created by Angela Alves on 28/02/23.
//

import Foundation
import UIKit
import TinyConstraints

class RMStackViewAttributes: UIStackView {

    init() {
        super.init(frame: .zero)
        axis = .horizontal
        configureSubviews()
        spacing = Spacing.medium
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let titleLabel = UILabel() ... {
        $0.font = Fonts.subtitle
        $0.setCompressionResistance(.required, for: .horizontal)
    }

    private let backgroundLabel = UIView() ... {
        $0.layer.masksToBounds = false
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 6.0
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.5
        $0.layer.shadowOffset = CGSize(width: 5, height: 3)
    }

    private let propertyLabel = UILabel() ... {
        $0.font = Fonts.largeText
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
    }

    func configureSubviews() {
        addArrangedSubview(titleLabel)
        addArrangedSubview(backgroundLabel)
        backgroundLabel.addSubview(propertyLabel)
        propertyLabel.edges(to: backgroundLabel)
    }

    func setup(title: String, property: String, background: UIColor) {
        titleLabel.text = title
        backgroundLabel.backgroundColor = background
        propertyLabel.text = property
    }
}
