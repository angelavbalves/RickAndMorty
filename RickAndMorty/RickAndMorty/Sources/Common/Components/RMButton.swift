//
//  RMButton.swift
//  Project01
//
//  Created by Angela Alves on 12/04/23.
//

import UIKit
import TinyConstraints

final class RMButton: UIButton {

    private let propertyAnimator = UIViewPropertyAnimator(duration: 0.2, curve: .easeOut)

    override var isHighlighted: Bool {
        didSet {
            setBackgroudColor()
        }
    }

    func setup(title: String) {
        self.setContentHuggingPriority(.required, for: .horizontal)
        self.tintColor = .black
        self.setTitle(title, for: .normal)
        self.setTitleColor(.black, for: .normal)
        self.backgroundColor = AppColors.darkGreen
        self.height(52)
        self.layer.cornerRadius = 26
        self.clipsToBounds = true
    }

    func setBackgroudColor() {
        if self.isHighlighted {
            self.propertyAnimator.stopAnimation(true)
            backgroundColor = AppColors.lightGreen
            return
        }
        self.propertyAnimator.addAnimations {
            self.backgroundColor = AppColors.darkGreen
        }
        self.propertyAnimator.startAnimation()
    }
}

