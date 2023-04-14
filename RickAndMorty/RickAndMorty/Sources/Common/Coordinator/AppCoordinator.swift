//
//  AppCoordinator.swift
//  RickAndMorty
//
//  Created by Angela Alves on 20/01/23.
//

import Foundation
import RxSwift
import UIKit

final class AppCoordinator: CoordinatorProtocol {

    // MARK: - Properties
    private var window: UIWindow
    var rootViewController: RMNavigationController? { window.rootViewController as? RMNavigationController }
    var childCoordinator: [CoordinatorProtocol] = []

    // MARK: - Init
    init(window: UIWindow) {
        self.window = window
        window.makeKeyAndVisible()
    }

    // MARK: - Start
    func start() {
        let coordinator = LoadCoordinator()
        window.rootViewController = coordinator.rootViewController
        childCoordinator.append(coordinator)
        coordinator.start()
    }
}
