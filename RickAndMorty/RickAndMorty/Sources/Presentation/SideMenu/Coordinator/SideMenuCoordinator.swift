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
    init(rootViewController: RMNavigationController) {
        self.rootViewController = rootViewController
    }

    // MARK: - Start
    func start() {
        let viewModel = SideMenuViewModel(coordinator: self)
        let controller = SideMenuViewController(viewModel: viewModel)

        rootViewController?.pushViewController(controller, animated: true)
    }

    func showCharacterList() {
        let coordinator = ListCharactersCoordinator(rootViewController: rootViewController)
        childCoordinator.append(coordinator)
        coordinator.start()
    }

    func showEpisodesList() {
        let coordinator = ListEpisodesCoordinator(rootViewController: rootViewController)
        childCoordinator.append(coordinator)
        coordinator.start()
    }

    func showPlacesList() {
        let coordinator = ListPlacesCoordinator(rootViewController: rootViewController)
        childCoordinator.append(coordinator)
        coordinator.start()
    }
}
