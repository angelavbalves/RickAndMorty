//
//  LoadCoordinator.swift
//  RickAndMorty
//
//  Created by Angela Alves on 14/02/23.
//

import Foundation
import UIKit

class LoadCoordinator: CoordinatorProtocol {

    // MARK: - Properties
    var rootViewController: RMNavigationController?
    var childCoordinator: [CoordinatorProtocol] = []

    // MARK: - Properties
    init(rootViewController: RMNavigationController = .init()) {
        self.rootViewController = rootViewController
    }

    func start() {
        let viewModel = LoadViewModel(coordinator: self)
        let controller = LoadViewController(viewModel: viewModel)

        rootViewController?.setViewControllers([controller], animated: false)
    }

    func showListCharacters() {
        let coordinator = ListCharactersCoordinator(rootViewController: rootViewController)
        childCoordinator.append(coordinator)
        coordinator.start()
    }
}
