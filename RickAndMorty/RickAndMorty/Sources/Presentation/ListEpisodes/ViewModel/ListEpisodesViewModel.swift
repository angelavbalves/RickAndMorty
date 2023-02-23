//
//  ListEpisodesViewModel.swift
//  RickAndMorty
//
//  Created by Angela Alves on 22/02/23.
//

import Foundation
import RxSwift
import UIKit

class ListEpisodesViewModel {

    // MARK: - Properties
    private weak var coordinator: ListEpisodesCoordinator?
    private let service: RMService

    // MARK: - Init
    init(
        service: RMService = .live(),
        coordinator: ListEpisodesCoordinator
    ) {
        self.service = service
        self.coordinator = coordinator
    }

    func fetchEpisodes(_ url: URL, _ page: Int, _ query: String) -> Observable<EpisodesResponse> {
        service
            .episodes(url, page, query)
    }
}
