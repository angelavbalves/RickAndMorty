//
//  ListPlacesViewModel.swift
//  RickAndMorty
//
//  Created by Angela Alves on 24/02/23.
//

import Foundation

class ListPlacesViewModel {

    // MARK: - Properties
    private weak var coordinator: ListPlacesCoordinator?
    private let service: RMService

    // MARK: - Init
    init(
        service: RMService = .live(),
        coordinator: ListPlacesCoordinator
    ) {
        self.service = service
        self.coordinator = coordinator
    }
}
