//
//  UIView+Ext.swift
//  RickAndMorty
//
//  Created by Angela Alves on 17/04/23.
//

import UIKit

extension UIView {
    var isSmallScreen: Bool {
        let width = UIScreen.main.bounds.width
        return width <= 375
    }
}
