//
//  AppCoordinator.swift
//  RickAndMorty
//
//  Created by Angela Alves on 20/01/23.
//

import Foundation
import RxSwift
import UIKit
import XCoordinator

class AppCoordinator: ViewCoordinator<AppRoutes> {

    init() {
        super.init(rootViewController: UIViewController(), initialRoute: .home)
    }

    override func prepareTransition(for route: AppRoutes) -> ViewTransition {
        switch route {
            case .home:
                let homeViewController = HomeViewController(router: weakRouter)
                return .present(homeViewController)
            case .characters:
                let coordinator = ListCharacterCoordinator()
                return .present(coordinator)
            case .locations:
                return .none()
            case .episodes:
                return .none()
        }
    }
}
