//
//  LocationListCoordinator.swift
//  RickAndMorty
//
//  Created by Angela Alves on 16/04/23.
//

import UIKit
import XCoordinator

final class LocationListCoordinator: NavigationCoordinator<LocationRoutes> {

    init() {
        super.init(rootViewController: UINavigationController(), initialRoute: .list)
    }

    override func prepareTransition(for route: LocationRoutes) -> NavigationTransition {
        switch route {
            case .list:
                let viewModel = ListLocationViewModel(router: weakRouter)
                let controller = ListLocationViewController(viewModel: viewModel)
                return .push(controller)
            case let .details(locationResponseItem):
                return .push(UIViewController())
        }
    }
}
