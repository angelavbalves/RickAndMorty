//
//  ListEpisodesCoordinator.swift
//  RickAndMorty
//
//  Created by Angela Alves on 22/02/23.
//

import Foundation
import UIKit

class ListEpisodesCoordinator: CoordinatorProtocol {

    // MARK: - Properties
    var rootViewController: RMNavigationController?
    var childCoordinator: [CoordinatorProtocol] = []

    // MARK: - Properties
    init(rootViewController: RMNavigationController?) {
        self.rootViewController = rootViewController
    }

    func start() {
        let viewModel = ListEpisodesViewModel(coordinator: self)
        let controller = ListEpisodesViewController(viewModel: viewModel)

        rootViewController?.setViewControllers([controller], animated: false)
    }
}
