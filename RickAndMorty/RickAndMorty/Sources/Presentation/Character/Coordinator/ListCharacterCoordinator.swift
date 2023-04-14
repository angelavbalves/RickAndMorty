//
//  ListCharacterCoordinator.swift
//  Project01
//
//  Created by Angela Alves on 12/04/23.
//

import UIKit
import XCoordinator

final class ListCharacterCoordinator: NavigationCoordinator<CharacterRoutes> {

    init() {
        super.init(rootViewController: RMNavigationController(), initialRoute: .list)
    }

    override func prepareTransition(for route: CharacterRoutes) -> NavigationTransition {
        switch route {
            case .list:
                let viewModel = ListCharactersViewModel(router: weakRouter)
                let controller = ListCharactersViewController(viewModel: viewModel)
                return .push(controller)
            case .details(let characterItem):
                let controller = DetailsCharacterViewController(character: characterItem)
                return .push(controller)
        }
    }
}
