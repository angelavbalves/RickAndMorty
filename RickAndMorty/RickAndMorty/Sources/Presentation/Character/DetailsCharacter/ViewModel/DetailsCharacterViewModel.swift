//
//  DetailsCharacterViewModel.swift
//  RickAndMorty
//
//  Created by Angela Alves on 27/02/23.
//

import Foundation

class DetailsCharacterViewModel {

    weak var coordinator: AppCoordinator?
    private let service: RMService
    let character: CharacterResponseItem

    init(
        character: CharacterResponseItem,
        service: RMService = .live(),
        coordinator: AppCoordinator?
    ) {
        self.character = character
        self.service = service
        self.coordinator = coordinator
    }
}
