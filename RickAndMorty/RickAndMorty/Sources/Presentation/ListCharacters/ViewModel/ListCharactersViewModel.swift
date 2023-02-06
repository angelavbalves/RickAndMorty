//
//  ListCharactersViewModel.swift
//  RickAndMorty
//
//  Created by Angela Alves on 20/01/23.
//

import Foundation

class ListCharactersViewModel {

    // MARK: - Properties
    private weak var coordinator: ListCharactersCoordinator?

    // MARK: - Init
    init(coordinator: ListCharactersCoordinator) {
        self.coordinator = coordinator
    }
}
