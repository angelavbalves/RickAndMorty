//
//  RMNavigationController.swift
//  RickAndMorty
//
//  Created by Angela Alves on 20/01/23.
//

import Foundation
import UIKit

class RMNavigationController: UINavigationController {

    // MARK: - init
    init(rootViewController: RMViewController) {
        super.init(rootViewController: rootViewController)
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }

    func configureAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = AppColors.darkGreen

        navigationBar.tintColor = .black

        navigationBar.standardAppearance = appearance
        navigationBar.compactAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
    }
}
