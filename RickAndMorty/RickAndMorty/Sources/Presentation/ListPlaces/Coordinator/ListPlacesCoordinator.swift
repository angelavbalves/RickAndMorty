//
//  ListPlacesCoordinator.swift
//  RickAndMorty
//
//  Created by Angela Alves on 24/02/23.
//

import Foundation
import UIKit

class ListPlacesCoordinator: CoordinatorProtocol {

    // MARK: - Properties
    var rootViewController: RMNavigationController?
    var childCoordinator: [CoordinatorProtocol] = []

    // MARK: - Properties
    init(rootViewController: RMNavigationController?) {
        self.rootViewController = rootViewController
    }

    func start() {
        let viewModel = ListPlacesViewModel(coordinator: self)
        let controller = ListPlacesViewController(viewModel: viewModel)

        rootViewController?.setViewControllers([controller], animated: true)
    }
}
