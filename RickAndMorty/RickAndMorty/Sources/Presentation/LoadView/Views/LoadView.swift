//
//  LoadView.swift
//  RickAndMorty
//
//  Created by Angela Alves on 14/02/23.
//

import Foundation
import UIKit
import TinyConstraints

class LoadView: RMView {

    // MARK: - Init
    override init() {
        super.init()
        isHidden = false
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View
    let activeIndicator = UIActivityIndicatorView(style: .large)

    // MARK: - Aux
    override func configureSubviews() {
        backgroundColor = .white
        addSubview(activeIndicator)
        activeIndicator.centerInSuperview()
    }

    func show() {
        isHidden = false
        activeIndicator.startAnimating()
    }

    func hide() {
        isHidden = true
        activeIndicator.stopAnimating()
    }
}
