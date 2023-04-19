//
//  AppCoordinator.swift
//  RickAndMorty
//
//  Created by Angela Alves on 20/01/23.
//

import RxSwift
import UIKit
import XCoordinator

class AppCoordinator: NavigationCoordinator<AppRoutes> {

    init() {
        super.init(rootViewController: UINavigationController(), initialRoute: .home)
    }

    override func prepareTransition(for route: AppRoutes) -> NavigationTransition {
        switch route {
            case .home:
                let homeViewController = HomeViewController(router: weakRouter)
                return .push(homeViewController)
            case .characters:
                let coordinator = ListCharacterCoordinator()
                return .present(coordinator)
            case .locations:
                let coordinator = LocationListCoordinator()
                return .present(coordinator)
            case .episodes:
                let coordinator = ListEpisodeCoordinator()
                return .present(coordinator)
        }
    }
}
