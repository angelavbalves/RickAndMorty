//
//  SideMenuViewModel.swift
//  RickAndMorty
//
//  Created by Angela Alves on 20/01/23.
//

import Foundation
import UIKit

class SideMenuViewModel {

    private weak var coordinator: SideMenuCoordinator?

    // MARK: - Init
    init(coordinator: SideMenuCoordinator) {
        self.coordinator = coordinator
    }
}
