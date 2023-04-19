//
//  ListEpisodesViewModel.swift
//  RickAndMorty
//
//  Created by Angela Alves on 22/02/23.
//

import RxSwift
import UIKit
import XCoordinator

class ListEpisodesViewModel {

    // MARK: - Properties
    private let router: WeakRouter<EpisodeRoutes>
    private let service: RMService

    // MARK: - Init
    init(
        service: RMService = .live(),
        router: WeakRouter<EpisodeRoutes>
    ) {
        self.service = service
        self.router = router
    }

    func fetchEpisodes() -> Observable<EpisodesResponse> {
        service
            .getEpisodes()
            .asObservable()
    }

    func didTapOnEpisode(_ episode: EpisodeResponseItem) {
        router.trigger(.details(episode))
    }
}
