//
//  RMView.swift
//  RickAndMorty
//
//  Created by Angela Alves on 20/01/23.
//

import Foundation
import UIKit

class RMView: UIView {

    // MARK: Init
    init() {
        super.init(frame: .zero)
        configureSubviews()
        configureConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureSubviews() {}

    func configureConstraints() {}
}
