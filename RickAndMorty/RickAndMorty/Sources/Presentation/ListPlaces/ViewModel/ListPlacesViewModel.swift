//
//  ListPlacesViewModel.swift
//  RickAndMorty
//
//  Created by Angela Alves on 24/02/23.
//

import Foundation
import RxSwift

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

    func fetchPlaces(_ url: URL, _ page: Int, _ query: String) -> Observable<LocationsResponse> {
        service
            .locations(url, page, query)
    }
}
