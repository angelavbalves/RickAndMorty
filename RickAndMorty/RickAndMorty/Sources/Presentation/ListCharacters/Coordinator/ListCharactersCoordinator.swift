//
//  ListCharactersCoordinator.swift
//  RickAndMorty
//
//  Created by Angela Alves on 20/01/23.
//

import Foundation
import UIKit

class ListCharactersCoordinator: CoordinatorProtocol {

    // MARK: - Properties
    var rootViewController: RMNavigationController?
    var childCoordinator: [CoordinatorProtocol] = []

    // MARK: - Properties
    init(rootViewController: RMNavigationController?) {
        self.rootViewController = rootViewController
    }
    
    func start() {
        let viewModel = ListCharactersViewModel(coordinator: self)
        let controller = ListCharactersViewController(viewModel: viewModel)

        rootViewController?.setViewControllers([controller], animated: false)
    }
}
