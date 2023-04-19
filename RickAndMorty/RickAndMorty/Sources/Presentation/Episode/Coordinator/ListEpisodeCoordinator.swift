//
//  ListEpisodeCoordinator.swift
//  RickAndMorty
//
//  Created by Angela Alves on 14/04/23.
//

import Foundation
import XCoordinator
import UIKit

final class ListEpisodeCoordinator: NavigationCoordinator<EpisodeRoutes> {

    init() {
        super.init(rootViewController: UINavigationController(), initialRoute: .list)
    }

    override func prepareTransition(for route: EpisodeRoutes) -> NavigationTransition {
        switch route {
            case .list:
                let viewModel = ListEpisodesViewModel(router: weakRouter)
                let controller = ListEpisodesViewController(viewModel: viewModel)
                return .push(controller)
            case .details(let characterItem):
                return .push(UIViewController())
        }
    }
}
