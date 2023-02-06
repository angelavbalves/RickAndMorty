//
//  SideMenuCoordinator.swift
//  RickAndMorty
//
//  Created by Angela Alves on 20/01/23.
//

import Foundation
import UIKit

class SideMenuCoordinator: CoordinatorProtocol {

    // MARK: - Properties
    var rootViewController: RMNavigationController?
    var childCoordinator: [CoordinatorProtocol] = []

    // MARK: - Init
    init(rootViewController: RMNavigationController = .init()) {
        self.rootViewController = rootViewController
    }

    // MARK: - Start
    func start() {
        let viewModel = SideMenuViewModel(coordinator: self)
        let controller = SideMenuViewController()

        rootViewController?.pushViewController(controller, animated: true)
    }


}
